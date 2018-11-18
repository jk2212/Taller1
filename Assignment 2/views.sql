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

--add fields "business_account" and company_id to storage if the payment method is supported by a company and the reference to the company in such case
ALTER TABLE user_payment_methods ADD business_account CHAR(1);
ALTER TABLE user_payment_methods ADD company_id NUMBER;

ALTER TABLE user_payment_methods
    ADD CONSTRAINT usr_pmnt_mthds_companies_fk FOREIGN KEY ( company_id )
        REFERENCES companies ( id );

--update a row to have an example to show in the video
UPDATE user_payment_methods SET company_id=1, business_account='t' where user_id = 3;

--Add field to trip_statuses to be able to know what of the statuses is the successful one without to hardcode strings
ALTER TABLE trip_statuses ADD successful_trip CHAR(1);
UPDATE trip_statuses SET successful_trip = 'f';
UPDATE trip_statuses SET successful_trip = 't' WHERE name = 'Successful';


--1
CREATE VIEW MEDIOS_PAGO_CLIENTES
AS SELECT 
    u.id as CLIENTE_ID,
    u.name || ' ' || u.last_name as NOMBRE_CLIENTE,
    pm.id as MEDIO_PAGO_ID,
    pm.name as TIPO,
    upm.card_number as DETALLES_MEDIO_PAGO,
    case when upm.business_account = 'f' or upm.business_account is null then 'FALSO' else 'VERDADERO' end as EMPRESARIAL,
    c.name as NOMBRE_EMPRESA
FROM users u -- table with clients
    INNER JOIN user_payment_methods upm on u.id = upm.user_id --joined with table with the payment methods by client
    INNER JOIN payment_methods pm on upm.payment_method_id = pm.id --joined with table with generic payment methos in the application
    LEFT JOIN companies c on upm.company_id = c.id; --table with company names for bussiness accounts, using left join instead of inner join because not all account are bussiness account, so not all user will has a relation with table companies

    
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
FROM trips t --table with trips
    inner join driver_cars dc on t.driver_car_id=dc.id -- joined with cars by driver
    inner join service_types st on dc.service_type_id=st.id -- joined with the service types, for instace 'UBER X' or 'UBER BLACK'
    inner join drivers d on dc.driver_id=d.id --the table with the information of drives
    inner join trip_users tu on tu.trip_id=t.id -- the users per trip, because in a trip can go several users who are gonna pay
    inner join users u on tu.user_id=u.id -- information about users
    inner join cities c on c.id=t.city_id -- the cities with its prices 
    inner join trip_user_bills tub on tub.trip_user_id = tu.id -- the bills per user and per trip
GROUP BY t.id --grouping by trip_id because the idea is to sum the all the bills from a trip to show the total price of the trip
ORDER BY MAX(t.start_date);

--3
explain plan set STATEMENT_ID='q1' into plan_table for
select * from VIAJES_CLIENTES WHERE NOMBRE_CLIENTE = 'Teresita de Merida'; --A execution plan is created for the view VIAJES_CLIENTES
select plan_table_output from table(dbms_xplan.display('plan_table','q1','typical'));
CREATE INDEX user_first_last_name_idx ON users (name, last_name); --A composite index is created because we are quering using the field NOMBRE_CLIENTE, that field is the concatenation between name and last_name in the users table
--The index does not improve the excecution plan because the query of the VIEW is full of joins and the joins performance usually cannot be improved using indexes
---------------------------------------------------------------------------------------------------------------------
--| Id  | Operation                              | Name                     | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------------------------------
--|   0 | SELECT STATEMENT                       |                          |     1 |   506 |    31  (23)| 00:00:01 |
--|   1 |  VIEW                                  | VIAJES_CLIENTES          |     1 |   506 |    31  (23)| 00:00:01 |
--|   2 |   SORT ORDER BY                        |                          |     1 |   117 |    31  (23)| 00:00:01 |
--|*  3 |    FILTER                              |                          |       |       |            |          |
--|   4 |     HASH GROUP BY                      |                          |     1 |   117 |    31  (23)| 00:00:01 |
--|*  5 |      HASH JOIN                         |                          |    20 |  2340 |    29  (18)| 00:00:01 |
--|*  6 |       HASH JOIN                        |                          |    20 |  2180 |    25  (16)| 00:00:01 |
--|*  7 |        HASH JOIN                       |                          |    20 |  1800 |    20  (15)| 00:00:01 |
--|*  8 |         HASH JOIN                      |                          |    10 |   810 |    17  (18)| 00:00:01 |
--|*  9 |          HASH JOIN                     |                          |    10 |   620 |    13  (16)| 00:00:01 |
--|* 10 |           HASH JOIN                    |                          |    10 |   500 |    10  (20)| 00:00:01 |
--|  11 |            MERGE JOIN                  |                          |    10 |   340 |     6  (17)| 00:00:01 |
--|  12 |             TABLE ACCESS BY INDEX ROWID| CITIES                   |     2 |    24 |     2   (0)| 00:00:01 |
--|  13 |              INDEX FULL SCAN           | CITIES_PK                |     2 |       |     1   (0)| 00:00:01 |
--|* 14 |             SORT JOIN                  |                          |    10 |   220 |     4  (25)| 00:00:01 |
--|  15 |              TABLE ACCESS FULL         | TRIPS                    |    10 |   220 |     3   (0)| 00:00:01 |
--|  16 |            TABLE ACCESS FULL           | DRIVER_CARS              |   100 |  1600 |     3   (0)| 00:00:01 |
--|  17 |           TABLE ACCESS FULL            | SERVICE_TYPES            |     2 |    24 |     3   (0)| 00:00:01 |
--|  18 |          TABLE ACCESS FULL             | DRIVERS                  |   100 |  1900 |     3   (0)| 00:00:01 |
--|  19 |         TABLE ACCESS FULL              | TRIP_USERS               |    20 |   180 |     3   (0)| 00:00:01 |
--|  20 |        VIEW                            | index$_join$_011         |   500 |  9500 |     5  (20)| 00:00:01 |
--|* 21 |         HASH JOIN                      |                          |       |       |            |          |
--|  22 |          INDEX FAST FULL SCAN          | USERS_PK                 |   500 |  9500 |     1   (0)| 00:00:01 |
--|  23 |          INDEX FAST FULL SCAN          | USER_FIRST_LAST_NAME_IDX |   500 |  9500 |     4   (0)| 00:00:01 |
--|  24 |       TABLE ACCESS FULL                | TRIP_USER_BILLS          |    20 |   160 |     3   (0)| 00:00:01 |
---------------------------------------------------------------------------------------------------------------------


--4
ALTER TABLE cities ADD base_value DECIMAL(17,7); --adding field to store trip base value per city
ALTER TABLE cities ADD value_per_km DECIMAL(17,7); --adding field to store value per km per city
ALTER TABLE cities ADD value_per_min DECIMAL(17,7); --adding field to store value per minute per city

UPDATE cities set base_value = 2500, value_per_min = 178.571429, value_per_km = 764.525994 WHERE id = 1; -- updating the existing city to the values that the assigment sugest
INSERT INTO cities (id, name, country_id, base_value, value_per_min, value_per_km) VALUES (cities_sec.NEXTVAL, 'Bogotá', 1, 2400, 173.1273, 522.43456); -- inserting Bogotá city with the values that the assigment sugest

--5
CREATE OR REPLACE FUNCTION VALOR_DISTANCIA(km IN FLOAT, city_name IN VARCHAR2) -- function to calculate the price of the trip over the distance
   RETURN FLOAT
IS
    negative_distance_ex EXCEPTION; --exception if the distance parameter is a negative number
    city_not_found_ex EXCEPTION; --exception if the city passed as a parameter does not exist in the database
    city_count INT; -- variable to validate if the city passed as a parameter exists in the database
    total_value FLOAT; -- to storage the value to be returned
BEGIN
    IF(km<0) THEN -- if the distance is negative
        RAISE negative_distance_ex; -- throw an exception
    END IF;
    SELECT COUNT(*) INTO city_count FROM cities WHERE NAME = city_name; --validate if the city passed as a parameter exists in the database
    IF(city_count=0) THEN -- if city is not present on persistence
        RAISE city_not_found_ex; -- thow an exception
    END IF;
    SELECT value_per_km * km INTO total_value FROM cities WHERE NAME = city_name; -- calculate the value of the trip using the km parameters and the value per km in the cities table
    RETURN total_value;
END VALOR_DISTANCIA;

--6
CREATE OR REPLACE FUNCTION VALOR_TIEMPO(minutes IN FLOAT, city_name IN VARCHAR2)  -- function to calculate the price of the trip over the time
   RETURN FLOAT
IS
    negative_time_ex EXCEPTION; --exception if the minutes parameter is a negative number
    city_not_found_ex EXCEPTION;--exception if the city passed as a parameter does not exist in the database
    city_count INT;-- variable to validate if the city passed as a parameter exists in the database
    total_value FLOAT;-- to storage the value to be returned
BEGIN
    IF(minutes<0) THEN --if the minutes are a negative number
        RAISE negative_time_ex; -- throw an exception
    END IF;
    SELECT COUNT(*) INTO city_count FROM cities WHERE NAME = city_name; --validate if the city passed as a parameter exists in the database
    IF(city_count=0) THEN -- if city is not present in the table 
        RAISE city_not_found_ex;-- throw an exception
    END IF;
    SELECT value_per_min * minutes INTO total_value FROM cities WHERE NAME = city_name;-- calculate the value of the trip using the minutes parameters and the value per minutes in the cities table
    RETURN total_value;
END VALOR_TIEMPO;

CREATE OR REPLACE PROCEDURE CALCULAR_TARIFA (trip_id_param IN INT) -- procedure to update the bills with trip values
AS
BEGIN
    MERGE INTO trip_user_bills tub -- using merge because oracle does not allow update-join
    USING (--inner select with all the information required to calculate the total value of the trip
        SELECT tu.id as trip_user_id, tu.trip_id, t.distance_covered, t.start_date, t.end_date, c.base_value, c.name AS city_name, ts.successful_trip FROM trips t
            INNER JOIN cities c ON c.id = t.city_id
            INNER JOIN trip_users tu ON t.id = tu.trip_id
            INNER JOIN trip_statuses ts ON t.trip_status_id = ts.id
            WHERE t.id = trip_id_param
    ) jtu
    ON (jtu.trip_user_id = tub.trip_user_id)    
    WHEN MATCHED THEN UPDATE SET 
        tub.subtotal = CASE NVL(jtu.successful_trip,'f') WHEN 't' THEN -- if the trip status is successful calculate the value of subtotal, if not then set it to 0
            ((jtu.base_value + 
            VALOR_TIEMPO(round((CAST(jtu.end_date AS DATE) - CAST(jtu.start_date AS DATE)) * (60 * 24),2), jtu.city_name) +
            VALOR_DISTANCIA(jtu.distance_covered, jtu.city_name)) / (SELECT COUNT(*) FROM trip_users itu WHERE itu.trip_id=trip_id_param)) 
            --update the subtotal to the base value of the city + the value by distance + the value by time, divided among the amount of users in the trip
        ELSE 
            0
        END,
        tub.total = CASE NVL(jtu.successful_trip,'f') WHEN 't' THEN-- if the trip status is successful calculate the value of total, if not then set it to 0
            ((jtu.base_value + 
            VALOR_TIEMPO(round((CAST(jtu.end_date AS DATE) - CAST(jtu.start_date AS DATE)) * (60 * 24),2), jtu.city_name) +
            VALOR_DISTANCIA(jtu.distance_covered, jtu.city_name)) / (SELECT COUNT(*) FROM trip_users itu WHERE itu.trip_id=trip_id_param))
            --update the subtotal to the base value of the city + the value by distance + the value by time, divided among the amount of users in the trip
            + tub.surcharges + tub.tip
            --adding to subtotal the value of the tip and surcharges
        ELSE 
            0
        END
    WHERE jtu.trip_id=trip_id_param;
EXCEPTION
    WHEN others THEN --if any axception was thrown the set the value of total and subtotal to 0
        MERGE INTO trip_user_bills tub
        USING trip_users tu
        ON (tu.id = tub.trip_user_id)
        WHEN MATCHED THEN UPDATE SET tub.subtotal = 0,tub.total = 0
        WHERE tu.trip_id = trip_id_param;
END;