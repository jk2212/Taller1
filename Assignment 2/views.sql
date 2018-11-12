--changes in the schema to fit in the new requirement
--Add "city_id" field to "trips" table to make easier the reference betwen both tables
ALTER TABLE trips ADD city_id NUMERIC;

ALTER TABLE trips
    ADD CONSTRAINT trip_cities_fk FOREIGN KEY ( city_id )
        REFERENCES cities ( id );

UPDATE TRIPS SET city_id=1;

--creation of table "companies" to save the companies that can support the bussines accounts 
CREATE SEQUENCE companies_seq START WITH 1;
CREATE TABLE companies (id number primary key, name VARCHAR2(256));
INSERT INTO companies (id, name) VALUES (companies_seq.NEXTVAL, 'Capgemini');
UPDATE user_payment_methods SET company_id=1, business_account='t' where user_id = 3;


--add fields "business_account" and company_id to storage if the payment method is supported by a company and the reference to the company in such case
ALTER TABLE user_payment_methods ADD business_account CHAR(1);
ALTER TABLE user_payment_methods ADD company_id NUMBER;

ALTER TABLE user_payment_methods
    ADD CONSTRAINT usr_pmnt_mthds_companies_fk FOREIGN KEY ( company_id )
        REFERENCES companies ( id );


--Add field to trip_statuses to be able to know what of the statuses is the successful one without to hardcode strings
ALTER TABLE trip_statuses ADD successful_trip CHAR(1);
UPDATE trip_statuses SET successful_trip = 'f';
UPDATE trip_statuses SET successful_trip = 't' WHERE name = 'Successful';


--1
CREATE OR REPLACE VIEW MEDIOS_PAGO_CLIENTES AS
SELECT 
    u.id as CLIENTE_ID,
    u.name || ' ' || u.last_name as NOMBRE_CLIENTE,
    pm.id as MEDIO_PAGO_ID,
    pm.name as TIPO,
    upm.card_number as DETALLES_MEDIO_PAGO,
    case when upm.business_account = 'f' or upm.business_account is null then 'FALSO' else 'VERDADERO' end as EMPRESARIAL,
    c.name as NOMBRE_EMPRESA    
FROM users u
    INNER JOIN user_payment_methods upm on u.id = upm.user_id
    INNER JOIN payment_methods pm on upm.payment_method_id = pm.id
    LEFT JOIN companies c on upm.company_id = c.id;
    
--2    
CREATE OR REPLACE VIEW VIAJES_CLIENTES AS
SELECT
    MAX(t.start_date) as FECHA_VIAJE,
    MAX(d.name) || ' ' || MAX(d.last_name) as NOMBRE_CONDUCTOR,
    MAX(dc.license_plate_number) as PLACA_VAHICULO,
    MAX(u.name) || ' ' || MAX(u.last_name) as NOMBRE_CLIENTE,
    SUM(tub.total) as VALOR_TOTAL,
    case MAX(t.dinamic) when 'f' then 'FALSO' else 'VERDADERO' end as TARIFA_DINAMICA,
    MAX(st.name) as TIPO_SERVICIO,
    MAX(c.name) as CIUDAD_VIAJE
FROM trips t 
    inner join driver_cars dc on t.driver_car_id=dc.id
    inner join service_types st on dc.service_type_id=st.id
    inner join drivers d on dc.driver_id=d.id
    inner join trip_users tu on tu.trip_id=t.id
    inner join users u on tu.user_id=u.id
    inner join cities c on c.id=t.city_id
    inner join trip_user_bills tub on tub.trip_user_id = tu.id
GROUP BY t.id
ORDER BY MAX(t.start_date);

--3
explain plan set STATEMENT_ID='q1' into plan_table for
select * from VIAJES_CLIENTES WHERE NOMBRE_CLIENTE = 'Teresita de Merida';
select plan_table_output from table(dbms_xplan.display('plan_table','q1','typical'));
CREATE INDEX user_first_last_name_idx ON users (name, last_name);

--4
ALTER TABLE cities ADD base_value DECIMAL(17,7);
ALTER TABLE cities ADD value_per_km DECIMAL(17,7);
ALTER TABLE cities ADD value_per_min DECIMAL(17,7);

UPDATE cities set base_value = 2500, value_per_min = 178.571429, value_per_km = 764.525994 WHERE id = 1;
INSERT INTO cities (id, name, country_id, base_value, value_per_min, value_per_km) VALUES (cities_sec.NEXTVAL, 'Bogotá', 1, 2400, 173.1273, 522.43456);

--5
CREATE OR REPLACE FUNCTION VALOR_DISTANCIA(km IN FLOAT, city_name IN VARCHAR2) 
   RETURN FLOAT
IS
    negative_distance_ex EXCEPTION;
    city_not_found_ex EXCEPTION;
    city_count INT;
    total_value FLOAT;
BEGIN
    IF(km<0) THEN
        RAISE negative_distance_ex;
    END IF;
    SELECT COUNT(*) INTO city_count FROM cities WHERE NAME = city_name;
    IF(city_count=0) THEN
        RAISE city_not_found_ex;
    END IF;
    SELECT value_per_km * km INTO total_value FROM cities WHERE NAME = city_name;
    RETURN total_value;
END VALOR_DISTANCIA;

--6
CREATE OR REPLACE FUNCTION VALOR_TIEMPO(minutes IN FLOAT, city_name IN VARCHAR2) 
   RETURN FLOAT
IS
    negative_time_ex EXCEPTION;
    city_not_found_ex EXCEPTION;
    city_count INT;
    total_value FLOAT;
BEGIN
    IF(minutes<0) THEN
        RAISE negative_time_ex;
    END IF;
    SELECT COUNT(*) INTO city_count FROM cities WHERE NAME = city_name;
    IF(city_count=0) THEN
        RAISE city_not_found_ex;
    END IF;
    SELECT value_per_min * minutes INTO total_value FROM cities WHERE NAME = city_name;
    RETURN total_value;
END VALOR_TIEMPO;

CREATE OR REPLACE PROCEDURE CALCULAR_TARIFA (trip_id_param IN INT)
AS
BEGIN
    MERGE INTO trip_user_bills tub
    USING (
        SELECT tu.id as trip_user_id, tu.trip_id, t.distance_covered, t.start_date, t.end_date, c.base_value, c.name AS city_name, ts.successful_trip FROM trips t
            INNER JOIN cities c ON c.id = t.city_id
            INNER JOIN trip_users tu ON t.id = tu.trip_id
            INNER JOIN trip_statuses ts ON t.trip_status_id = ts.id
            WHERE t.id = trip_id_param
    ) jtu
    ON (jtu.trip_user_id = tub.trip_user_id)
    WHEN MATCHED THEN UPDATE SET tub.total = CASE NVL(jtu.successful_trip,'f') WHEN 't' THEN
            ((jtu.base_value + 
            VALOR_TIEMPO(round((CAST(jtu.end_date AS DATE) - CAST(jtu.start_date AS DATE)) * (60 * 24),2), jtu.city_name) +
            VALOR_DISTANCIA(jtu.distance_covered, jtu.city_name)) / (SELECT COUNT(*) FROM trip_users itu WHERE itu.trip_id=trip_id_param))
            + tub.surcharges + tub.tip
        ELSE 
            0
        END
    WHERE jtu.trip_id=trip_id_param;
EXCEPTION
    WHEN others THEN
        MERGE INTO trip_user_bills tub
        USING trip_users tu
        ON (tu.id = tub.trip_user_id)
        WHEN MATCHED THEN UPDATE SET tub.total = 0
        WHERE tu.trip_id = trip_id_param;
END;