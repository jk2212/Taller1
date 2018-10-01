CREATE SEQUENCE banks_sec START WITH 1;
CREATE TABLE banks (
    id     NUMERIC NOT NULL,
    name   VARCHAR2(256) NOT NULL
);

ALTER TABLE banks ADD CONSTRAINT banks_pk PRIMARY KEY ( id );

CREATE SEQUENCE car_brands_sec START WITH 1;
CREATE TABLE car_brands (
    id     NUMERIC NOT NULL,
    name   VARCHAR2(128) NOT NULL
);

ALTER TABLE car_brands ADD CONSTRAINT car_brands_pk PRIMARY KEY ( id );

CREATE SEQUENCE cities_sec START WITH 1;
CREATE TABLE cities (
    id           NUMERIC NOT NULL,
    name         VARCHAR2(256) NOT NULL,
    country_id   NUMERIC NOT NULL
);

ALTER TABLE cities ADD CONSTRAINT cities_pk PRIMARY KEY ( id );

CREATE SEQUENCE countries_sec  START WITH 1;
CREATE TABLE countries (
    id     NUMERIC NOT NULL,
    name   VARCHAR2(256) NOT NULL
);

ALTER TABLE countries ADD CONSTRAINT countries_pk PRIMARY KEY ( id );

CREATE SEQUENCE currencies_sec START WITH 1;
CREATE TABLE currencies (
    id           NUMERIC NOT NULL,
    name         VARCHAR2(128) NOT NULL,
    country_id   NUMERIC NOT NULL
);

ALTER TABLE currencies ADD CONSTRAINT currencies_pk PRIMARY KEY ( id );

CREATE SEQUENCE driver_cars_sec START WITH 1;
CREATE TABLE driver_cars (
    id                     NUMERIC NOT NULL,
    driver_id              NUMERIC NOT NULL,
    card_brand_id          NUMERIC NOT NULL,
    license_plate_number   VARCHAR2(32) NOT NULL,
    model                  VARCHAR2(256) NOT NULL,
    year                   NUMERIC NOT NULL,
    service_type_id        NUMERIC NOT NULL
);

ALTER TABLE driver_cars ADD CONSTRAINT driver_cars_pk PRIMARY KEY ( id );

CREATE SEQUENCE driver_emails_sec START WITH 1;
CREATE TABLE driver_emails (
    id          NUMERIC NOT NULL,
    email       VARCHAR2(256) NOT NULL,
    driver_id   NUMERIC NOT NULL
);

ALTER TABLE driver_emails ADD CONSTRAINT driver_emails_pk PRIMARY KEY ( id );

CREATE SEQUENCE driver_payment_bills_sec START WITH 1;
CREATE TABLE driver_payment_bills (
    id                  NUMERIC NOT NULL,
    trip_user_bill_id   NUMERIC NOT NULL,
    payment_date        TIMESTAMP NOT NULL,
    uber_fee            DECIMAL NOT NULL
);

ALTER TABLE driver_payment_bills ADD CONSTRAINT driver_payment_bills_pk PRIMARY KEY ( id );

CREATE SEQUENCE drivers_sec START WITH 1;
CREATE TABLE drivers (
    id                    NUMERIC NOT NULL,
    name                  VARCHAR2(128) NOT NULL,
    last_name             VARCHAR2(128) NOT NULL,
    city_id               NUMERIC NOT NULL,
    language_id           NUMERIC NOT NULL,
    invite_code           VARCHAR2(64),
    profile_photo         VARCHAR2(256) NOT NULL,
    mobile                VARCHAR2(32) NOT NULL,
    bank_account_number   VARCHAR2(32) NOT NULL,
    bank_id               NUMERIC NOT NULL
);

ALTER TABLE drivers ADD CONSTRAINT usersv1_pk PRIMARY KEY ( id );

CREATE SEQUENCE languages_sec START WITH 1;
CREATE TABLE languages (
    id         NUMERIC NOT NULL,
    language   VARCHAR2(128) NOT NULL
);

ALTER TABLE languages ADD CONSTRAINT languages_pk PRIMARY KEY ( id );

CREATE SEQUENCE path_details_sec START WITH 1;
CREATE TABLE path_details (
    id          NUMERIC NOT NULL,
    path_date   TIMESTAMP NOT NULL,
    latitude    DECIMAL(20,10) NOT NULL,
    longitude   DECIMAL(20,10) NOT NULL,
    trip_id     NUMERIC NOT NULL
);

ALTER TABLE path_details ADD CONSTRAINT path_details_pk PRIMARY KEY ( id );

CREATE SEQUENCE payment_methods_sec START WITH 1;
CREATE TABLE payment_methods (
    id     NUMERIC NOT NULL,
    name   VARCHAR2(128) NOT NULL
);

ALTER TABLE payment_methods ADD CONSTRAINT payment_methods_pk PRIMARY KEY ( id );

CREATE SEQUENCE promotion_codes_sec START WITH 1;
CREATE TABLE promotion_codes (
    id                NUMERIC NOT NULL,
    code              VARCHAR2(32) NOT NULL,
    value             DECIMAL NOT NULL,
    currency_id       NUMERIC NOT NULL,
    expiration_date   TIMESTAMP NOT NULL
);

ALTER TABLE promotion_codes ADD CONSTRAINT promotion_codes_pk PRIMARY KEY ( id );

CREATE SEQUENCE service_types_sec START WITH 1;
CREATE TABLE service_types (
    id         NUMERIC NOT NULL,
    name       VARCHAR2(128) NOT NULL,
    category   NUMERIC NOT NULL
);

ALTER TABLE service_types ADD CONSTRAINT service_types_pk PRIMARY KEY ( id );

CREATE SEQUENCE trip_statuses_sec START WITH 1;
CREATE TABLE trip_statuses (
    id     NUMERIC NOT NULL,
    name   VARCHAR2(128) NOT NULL
);

ALTER TABLE trip_statuses ADD CONSTRAINT trip_statuses_pk PRIMARY KEY ( id );

CREATE SEQUENCE trip_user_bills_sec START WITH 1;
CREATE TABLE trip_user_bills (
    id                      NUMERIC NOT NULL,
    trip_user_id            NUMERIC NOT NULL,
    subtotal                DECIMAL NOT NULL,
    surcharges              DECIMAL NOT NULL,
    tip                     DECIMAL NOT NULL,
    user_promotion_code_id  NUMERIC,
    total                   DECIMAL NOT NULL
);

ALTER TABLE trip_user_bills ADD CONSTRAINT trip_user_bills_pk PRIMARY KEY ( id );

CREATE SEQUENCE trip_users_sec START WITH 1;
CREATE TABLE trip_users (
    id                       NUMERIC NOT NULL,
    user_id                  NUMERIC NOT NULL,
    trip_id                  NUMERIC NOT NULL,
    user_payment_method_id   NUMERIC NOT NULL
);

ALTER TABLE trip_users ADD CONSTRAINT trip_users_pk PRIMARY KEY ( id );

CREATE SEQUENCE trips_sec START WITH 1;
CREATE TABLE trips (
    id                   NUMERIC NOT NULL,
    origin               VARCHAR2(256) NOT NULL,
    destination          VARCHAR2(256) NOT NULL,
    start_date           TIMESTAMP NOT NULL,
    end_date             TIMESTAMP,
    driver_car_id        NUMERIC NOT NULL,
    dinamic              CHAR(1),
    trip_status_id       NUMERIC NOT NULL,
    distance_covered     DECIMAL
);

ALTER TABLE trips ADD CONSTRAINT trips_pk PRIMARY KEY ( id );

CREATE SEQUENCE user_emails_sec START WITH 1;
CREATE TABLE user_emails (
    id        NUMERIC NOT NULL,
    user_id   NUMERIC NOT NULL,
    email     VARCHAR2(256) NOT NULL
);

ALTER TABLE user_emails ADD CONSTRAINT user_emails_pk PRIMARY KEY ( id );

CREATE SEQUENCE user_payment_methods_sec START WITH 1;
CREATE TABLE user_payment_methods (
    id                  NUMERIC NOT NULL,
    user_id             NUMERIC NOT NULL,
    payment_method_id   NUMERIC NOT NULL,
    card_number         VARCHAR2(64),
    account_user        VARCHAR2(256),
    expiration_date     TIMESTAMP,
    password            VARCHAR2(256) NOT NULL
);

ALTER TABLE user_payment_methods ADD CONSTRAINT user_payment_methods_pk PRIMARY KEY ( id );

CREATE SEQUENCE user_pmnt_method_noti_sec START WITH 1;
CREATE TABLE user_pmnt_method_notifications (
    id                  NUMERIC NOT NULL,
    user_id             NUMERIC NOT NULL,
    payment_method_id   NUMERIC NOT NULL
);

ALTER TABLE user_pmnt_method_notifications ADD CONSTRAINT user_payment_mthd_notif_pk PRIMARY KEY ( id );

CREATE SEQUENCE user_promotion_codes_sec START WITH 1;
CREATE TABLE user_promotion_codes (
    id                  NUMERIC NOT NULL,
    user_id             NUMERIC NOT NULL,
    promotion_code_id   NUMERIC NOT NULL,
    activation_date     TIMESTAMP
);

ALTER TABLE user_promotion_codes ADD CONSTRAINT user_promotion_codes_pk PRIMARY KEY ( id );

CREATE SEQUENCE users_sec START WITH 1;
CREATE TABLE users (
    id              NUMERIC NOT NULL,
    name            VARCHAR2(128) NOT NULL,
    last_name       VARCHAR2(128) NOT NULL,
    city_id         NUMERIC NOT NULL,
    language_id     NUMERIC NOT NULL,
    invite_code     VARCHAR2(64),
    profile_photo   VARCHAR2(256),
    mobile          VARCHAR2(32) NOT NULL
);

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( id );

ALTER TABLE cities
    ADD CONSTRAINT cities_countries_fk FOREIGN KEY ( country_id )
        REFERENCES countries ( id );

ALTER TABLE currencies
    ADD CONSTRAINT currencies_countries_fk FOREIGN KEY ( country_id )
        REFERENCES countries ( id );

ALTER TABLE driver_cars
    ADD CONSTRAINT driver_cars_car_brands_fk FOREIGN KEY ( card_brand_id )
        REFERENCES car_brands ( id );

ALTER TABLE driver_cars
    ADD CONSTRAINT driver_cars_drivers_fk FOREIGN KEY ( driver_id )
        REFERENCES drivers ( id );

ALTER TABLE driver_cars
    ADD CONSTRAINT driver_cars_service_types_fk FOREIGN KEY ( service_type_id )
        REFERENCES service_types ( id );

ALTER TABLE driver_emails
    ADD CONSTRAINT driver_emails_drivers_fk FOREIGN KEY ( driver_id )
        REFERENCES drivers ( id );

ALTER TABLE driver_payment_bills
    ADD CONSTRAINT drv_paymnt_bll_trp_usr_bill_fk FOREIGN KEY ( trip_user_bill_id )
        REFERENCES trip_user_bills ( id );

ALTER TABLE drivers
    ADD CONSTRAINT drivers_banks_fk FOREIGN KEY ( bank_id )
        REFERENCES banks ( id );

ALTER TABLE drivers
    ADD CONSTRAINT drivers_cities_fk FOREIGN KEY ( city_id )
        REFERENCES cities ( id );

ALTER TABLE drivers
    ADD CONSTRAINT drivers_languages_fk FOREIGN KEY ( language_id )
        REFERENCES languages ( id );

ALTER TABLE path_details
    ADD CONSTRAINT path_details_trips_fk FOREIGN KEY ( trip_id )
        REFERENCES trips ( id );

ALTER TABLE promotion_codes
    ADD CONSTRAINT promotion_codes_currencies_fk FOREIGN KEY ( currency_id )
        REFERENCES currencies ( id );

ALTER TABLE trip_user_bills
    ADD CONSTRAINT trip_user_bills_trip_users_fk FOREIGN KEY ( trip_user_id )
        REFERENCES trip_users ( id );

ALTER TABLE trip_user_bills
    ADD CONSTRAINT trip_usr_blls_usr_prom_cds_fk FOREIGN KEY ( user_promotion_code_id )
        REFERENCES user_promotion_codes ( id );

ALTER TABLE trip_users
    ADD CONSTRAINT trip_users_trips_fk FOREIGN KEY ( trip_id )
        REFERENCES trips ( id );

ALTER TABLE trip_users
    ADD CONSTRAINT trip_usr_user_pmnt_methds_fk FOREIGN KEY ( user_payment_method_id )
        REFERENCES user_payment_methods ( id );

ALTER TABLE trip_users
    ADD CONSTRAINT trip_users_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE trips
    ADD CONSTRAINT trips_driver_cars_fk FOREIGN KEY ( driver_car_id )
        REFERENCES driver_cars ( id );

ALTER TABLE trips
    ADD CONSTRAINT trips_trip_statuses_fk FOREIGN KEY ( trip_status_id )
        REFERENCES trip_statuses ( id );

ALTER TABLE user_emails
    ADD CONSTRAINT user_emails_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE user_payment_methods
    ADD CONSTRAINT usr_pmnt_mthds_pmnt_mthds_fk FOREIGN KEY ( payment_method_id )
        REFERENCES payment_methods ( id );

ALTER TABLE user_payment_methods
    ADD CONSTRAINT user_payment_methods_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE user_pmnt_method_notifications
    ADD CONSTRAINT usr_pmnt_mthd_ntf_pmnt_mt_fk FOREIGN KEY ( payment_method_id )
        REFERENCES payment_methods ( id );

ALTER TABLE user_pmnt_method_notifications
    ADD CONSTRAINT usr_pmnt_mthd_ntf_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE user_promotion_codes
    ADD CONSTRAINT usr_promo_cods_promo_cods_fk FOREIGN KEY ( promotion_code_id )
        REFERENCES promotion_codes ( id );

ALTER TABLE user_promotion_codes
    ADD CONSTRAINT user_promotion_codes_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE users
    ADD CONSTRAINT users_cities_fk FOREIGN KEY ( city_id )
        REFERENCES cities ( id );

ALTER TABLE users
    ADD CONSTRAINT users_languages_fk FOREIGN KEY ( language_id )
        REFERENCES languages ( id );



INSERT INTO countries(id, name) VALUES (countries_sec.NEXTVAL, 'Colombia');
INSERT INTO cities(id, name, country_id) VALUES (cities_sec.NEXTVAL, 'Medellin', 1);
INSERT INTO banks(id, name) VALUES (banks_sec.NEXTVAL, 'Bancolombia');
insert into languages(id, language) values (languages_sec.NEXTVAL, 'Spanish');


insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Lian', 'Innis', 1, 1, null, '/images/profile/nibrdkydgpyug735854.jpg', '3175427317', '337941186467899', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Elmer', 'Beswell', 1, 1, null, '/images/profile/ucvfcaqwtplnc580792.jpg', '3128699960', '5231362660497466', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dyanne', 'Oller', 1, 1, null, '/images/profile/aqowahiywjpaj643681.jpg', '3193223517', '3568592082676176', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Hedvige', 'Bleackley', 1, 1, null, '/images/profile/yvfgrhelplubi071258.jpg', '3169043607', '3560061208977155', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Brandais', 'Fielding', 1, 1, null, '/images/profile/xlajfseukwcvn134887.jpg', '3136117063', '5010126467299558', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Bonnee', 'Millyard', 1, 1, null, '/images/profile/ptnzdxtgjeeko701528.jpg', '3120521398', '30298329508356', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ofelia', 'St Pierre', 1, 1, null, '/images/profile/ylsyachmwkvzi297585.jpg', '3183834302', '5010125596081051', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Guss', 'Bichener', 1, 1, null, '/images/profile/wvuspjhttsbvq839828.jpg', '3188409074', '3550738245879419', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Adora', 'Reeme', 1, 1, null, '/images/profile/sqszqzlcbmqke703194.jpg', '3197040918', '3549072566401734', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Danette', 'D''Errico', 1, 1, null, '/images/profile/gaslbolkjpuqj754060.jpg', '3171852302', '6761505076004435', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Brigham', 'Crosston', 1, 1, null, '/images/profile/odrxemvfanrch264458.jpg', '3144906311', '5349960108699038', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Bancroft', 'Curley', 1, 1, null, '/images/profile/pciwsaquhnztq431660.jpg', '3101432483', '5100139274426620', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Jacquelynn', 'Simioli', 1, 1, null, '/images/profile/dtajavgtklmxf799180.jpg', '3162188874', '3571270474101070', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Kelwin', 'Gobbet', 1, 1, null, '/images/profile/nxneihomtsudg558277.jpg', '3133545445', '3545035664230796', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Heath', 'Bram', 1, 1, null, '/images/profile/jtuavhswfzxkd769428.jpg', '3137482759', '6767913614009802010', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Kim', 'Order', 1, 1, null, '/images/profile/ugiovjapzdshd169397.jpg', '3122966950', '5602245690882461', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Auroora', 'Dotson', 1, 1, null, '/images/profile/rvyomurwtfegs126551.jpg', '3162212172', '3566630408058885', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ashlen', 'Trimbey', 1, 1, null, '/images/profile/rjwiecprzsnjy143768.jpg', '3159933367', '3577581191381017', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Philomena', 'Didsbury', 1, 1, null, '/images/profile/kuwoupjuywsjc476943.jpg', '3168435493', '3533459523026365', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Worth', 'Rounce', 1, 1, null, '/images/profile/xrwddrmidclvs820924.jpg', '3137664007', '4917357306432889', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dag', 'O''Leagham', 1, 1, null, '/images/profile/zabzdccsdkjxj940107.jpg', '3106023962', '6767271431148201', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Giorgi', 'Moisey', 1, 1, null, '/images/profile/qgiwdsnjjrpjw953886.jpg', '3100755466', '30158955121942', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ulrich', 'Truelove', 1, 1, null, '/images/profile/feqyavubxmfaf206249.jpg', '3159832941', '30411828936370', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Estel', 'Gaythorpe', 1, 1, null, '/images/profile/zfwwarkspdvxy700695.jpg', '3130244669', '3537928024049361', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Tabby', 'Darville', 1, 1, null, '/images/profile/npwmdkmthbqwu626154.jpg', '3117605244', '5108756364394319', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Zabrina', 'Marriot', 1, 1, null, '/images/profile/rllbtdfsfnajm445375.jpg', '3121124393', '4508380375994766', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Elwin', 'Overton', 1, 1, null, '/images/profile/ebskgczwsamyy062893.jpg', '3123313879', '5602258620068879', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Raul', 'Liccardo', 1, 1, null, '/images/profile/zgyzkodafvuih172236.jpg', '3194008555', '4887444850552', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Benedick', 'St. Hill', 1, 1, null, '/images/profile/xruqlgpfzmgxq064585.jpg', '3124846650', '6763907779740695', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Giraldo', 'Christoffersen', 1, 1, null, '/images/profile/kvndyynbmkuom243932.jpg', '3123516828', '5531889796372665', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Pollyanna', 'Duferie', 1, 1, null, '/images/profile/cqdnyvzlfsout725312.jpg', '3125842144', '6371016641960251', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Robinet', 'Mish', 1, 1, null, '/images/profile/zvejxrjecozok780086.jpg', '3110073829', '6709817458804455', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Evangelina', 'Steynor', 1, 1, null, '/images/profile/ssbipyycbejfy476209.jpg', '3156885252', '670950378899023568', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Enrichetta', 'Lowrey', 1, 1, null, '/images/profile/cukgmefgwmasd287543.jpg', '3181114759', '676120541695960869', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Humphrey', 'Newick', 1, 1, null, '/images/profile/gwkomhfmjbqux103631.jpg', '3129833409', '3548276469491319', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Binky', 'Michelin', 1, 1, null, '/images/profile/uxwhefmbrxnwp327259.jpg', '3189617019', '5583253611391185', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Wini', 'Osanne', 1, 1, null, '/images/profile/tddupyqtqrkul146213.jpg', '3193637186', '201840962028276', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Candy', 'Soame', 1, 1, null, '/images/profile/aunnxdimjijjg961300.jpg', '3156018319', '5048375694254524', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Catlin', 'Stanbro', 1, 1, null, '/images/profile/sydclnfajsjvc915964.jpg', '3124733073', '201970275545326', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ebba', 'Raven', 1, 1, null, '/images/profile/gjpzsgtszdugs720424.jpg', '3188540572', '30321003223975', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Lion', 'Ragles', 1, 1, null, '/images/profile/tqdjhpmsrmdcu543522.jpg', '3167480918', '30476795258868', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Avram', 'Onn', 1, 1, null, '/images/profile/rpcugjnqgrxwj738312.jpg', '3122126091', '3559134492366758', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ransom', 'Fridaye', 1, 1, null, '/images/profile/nuebhzbcoqhtq752055.jpg', '3168409966', '5442355494537049', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Vergil', 'Trimme', 1, 1, null, '/images/profile/dyobrdtqleyrv479186.jpg', '3140435634', '5108751833492687', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Haily', 'Serridge', 1, 1, null, '/images/profile/xfxvyepatfvid697619.jpg', '3138388298', '3548175115902614', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Alaine', 'Grinaugh', 1, 1, null, '/images/profile/mfvpprgslqhwt201768.jpg', '3186123585', '3528438497974484', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Editha', 'Sinclaire', 1, 1, null, '/images/profile/yaeigwhmdjvph138957.jpg', '3115910077', '6706446743281505878', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Corey', 'Gumbley', 1, 1, null, '/images/profile/zhytadeyblaeg309823.jpg', '3151028226', '201767509224086', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Fern', 'Timcke', 1, 1, null, '/images/profile/irunpeytqjbgd958590.jpg', '3132382033', '36470295995701', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Lezley', 'Merrien', 1, 1, null, '/images/profile/wqzdzsqlftqpx738594.jpg', '3161384417', '3580962730022640', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Nanci', 'Nuccitelli', 1, 1, null, '/images/profile/uzwfxcaomchem827036.jpg', '3169931211', '3566147463948884', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Neddy', 'Alam', 1, 1, null, '/images/profile/lgodfrfjmssao198283.jpg', '3116038530', '5100137302295975', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Matthew', 'Carlile', 1, 1, null, '/images/profile/hzwjzxiydlnjm386008.jpg', '3164728584', '3552253406325614', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Prudy', 'Tipling', 1, 1, null, '/images/profile/amefjafygtcgy686463.jpg', '3103768551', '5494755629589079', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Lyn', 'Paulot', 1, 1, null, '/images/profile/skcphslnjurhl391098.jpg', '3104437326', '3556245446452826', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Bennie', 'Perutto', 1, 1, null, '/images/profile/pkatontwxhmco872902.jpg', '3140864281', '5602249375973918', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Marjory', 'Coxwell', 1, 1, null, '/images/profile/pethxzqmdsnkb217385.jpg', '3127925336', '3554881119874458', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Kylen', 'Tarbert', 1, 1, null, '/images/profile/symqzcikyhqel595590.jpg', '3197845540', '5602247302549249', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Caryl', 'Greathead', 1, 1, null, '/images/profile/wvrcylydzyguj713120.jpg', '3161134507', '50182916323117020', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Alexandros', 'Seamarke', 1, 1, null, '/images/profile/qlkknvpfvbxfz514238.jpg', '3185279636', '3530761745719930', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Heddie', 'Yesipov', 1, 1, null, '/images/profile/yoqlqeqpwudyx101840.jpg', '3100258423', '560221988699721587', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Pippy', 'Larchiere', 1, 1, null, '/images/profile/zzcqohqohlvut904331.jpg', '3174001648', '5588621663074013', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Harrison', 'Wittleton', 1, 1, null, '/images/profile/jtmyhqywahibl051315.jpg', '3168211397', '3575533935969716', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Say', 'Jarville', 1, 1, null, '/images/profile/tzutexkkagxnz638309.jpg', '3139902197', '348939132460692', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dode', 'MacAleese', 1, 1, null, '/images/profile/qhbcvqhfutxcj799176.jpg', '3119306055', '6706678645640266', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dougy', 'Mitchinson', 1, 1, null, '/images/profile/urwzudwvqcnlr683219.jpg', '3173750250', '3541882102021756', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Noelle', 'Drew', 1, 1, null, '/images/profile/ytharxcxlmpzu506543.jpg', '3189710421', '5602221653317431', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Eugenius', 'Ipgrave', 1, 1, null, '/images/profile/vvillkwwgcbwl127285.jpg', '3196743658', '5100145973602668', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Melodie', 'Braxay', 1, 1, null, '/images/profile/gfyidkoqvwbxt817360.jpg', '3113707414', '30364595937305', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Gussie', 'Wilcockes', 1, 1, null, '/images/profile/inmowyubfoqax665986.jpg', '3126915755', '349311903029586', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Audrey', 'Biesterfeld', 1, 1, null, '/images/profile/mvnarsyjvfwht009260.jpg', '3178882842', '201913938801751', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Hershel', 'Bucham', 1, 1, null, '/images/profile/dhxrnnjquznnl042412.jpg', '3191511891', '3543101798697763', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Gigi', 'Ben', 1, 1, null, '/images/profile/bmpwqnfizyghj657710.jpg', '3118957171', '5893632308063644179', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dollie', 'MacGiany', 1, 1, null, '/images/profile/gbdxlkiwfctuv297449.jpg', '3165582226', '345652375662592', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ramsay', 'Malek', 1, 1, null, '/images/profile/wbvoazfiukufn329044.jpg', '3111697911', '63044918625441059', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Eve', 'Ridler', 1, 1, null, '/images/profile/vzszjzccbrqpr457202.jpg', '3153462658', '3535594954482584', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Kathryne', 'Starling', 1, 1, null, '/images/profile/ekwtqxgjzgwkk699000.jpg', '3196339891', '3540608589239905', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Tilda', 'MacKowle', 1, 1, null, '/images/profile/mtyyjyazwzwll227475.jpg', '3154659432', '337941092519551', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Rosabella', 'Di Domenico', 1, 1, null, '/images/profile/iwickzorheqnp144936.jpg', '3105050399', '201531781744959', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Taylor', 'Lapish', 1, 1, null, '/images/profile/mxmwnvrrbujvg349003.jpg', '3179798117', '3559268155126743', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Avivah', 'Lewton', 1, 1, null, '/images/profile/zeribslpxxonl703426.jpg', '3143972865', '3551722682810219', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Peg', 'Balmann', 1, 1, null, '/images/profile/vlrxvxjydryme993532.jpg', '3121070117', '5602236856888558', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Elsey', 'Bishell', 1, 1, null, '/images/profile/vjgabgoukbjfw231234.jpg', '3178801897', '5476414182098407', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ariella', 'Guillon', 1, 1, null, '/images/profile/shiyobqgodzqc082294.jpg', '3190709114', '3533241711995852', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Margalo', 'Legerwood', 1, 1, null, '/images/profile/xbggczunsfgcx146700.jpg', '3198367550', '3539256360375408', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Ashli', 'Erdis', 1, 1, null, '/images/profile/xalzcwxaxevxp838970.jpg', '3181117861', '3570672341258929', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Willabella', 'Bachshell', 1, 1, null, '/images/profile/dviwbtvlgqthv849359.jpg', '3100269030', '337941931311087', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dorette', 'Iacobassi', 1, 1, null, '/images/profile/ecwlwkihxxlav256755.jpg', '3189540461', '5641829719355410', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Von', 'Dulson', 1, 1, null, '/images/profile/cugjyfuddyyga220818.jpg', '3164587645', '3533548924485525', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Danila', 'Borg', 1, 1, null, '/images/profile/zmbapbtknhpqp607142.jpg', '3103346373', '6333419444451236396', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Jackelyn', 'McGraffin', 1, 1, null, '/images/profile/ympauwnfgtgnx522516.jpg', '3121586126', '5602252438283010', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Blair', 'Ivanikov', 1, 1, null, '/images/profile/xghuxdaxdzznz711020.jpg', '3142214264', '3557818975928496', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Robyn', 'Tolotti', 1, 1, null, '/images/profile/wldczmbhvzgga074170.jpg', '3190841892', '3544384368593823', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Gerianne', 'Cheley', 1, 1, null, '/images/profile/rjgffnelpckpp403731.jpg', '3168249489', '30135905146542', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Claybourne', 'Szymanek', 1, 1, null, '/images/profile/bncduwlwshxuf106631.jpg', '3158141684', '5602227582665980', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Waylen', 'Szwarc', 1, 1, null, '/images/profile/kwqyxkktktqse082710.jpg', '3188411475', '3565580467171544', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Dolli', 'Firmager', 1, 1, null, '/images/profile/omsghbxtfxwcr151131.jpg', '3132395806', '3576996666761637', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Foss', 'Petherick', 1, 1, null, '/images/profile/aituhcpjgqdzq185024.jpg', '3111996723', '201805020778071', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Mickie', 'Baal', 1, 1, null, '/images/profile/bvlccfuwvhful787773.jpg', '3194754669', '3572891384056366', 1);
insert into drivers (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile, bank_account_number, bank_id) values (drivers_sec.NEXTVAL, 'Falkner', 'Pharoah', 1, 1, null, '/images/profile/sjysbxwbifmob162531.jpg', '3170155373', '201985790144454', 1);


INSERT INTO car_brands(id, name) VALUES(car_brands_sec.NEXTVAL, 'Chevrolet');
INSERT INTO service_types(id, name, category) VALUES (service_types_sec.NEXTVAL, 'Uber X', 1);
INSERT INTO service_types(id, name, category) VALUES (service_types_sec.NEXTVAL, 'Uber Black', 2);

insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 1, 1, 'bon161', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 2, 1, 'ofd969', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 3, 1, 'jbm859', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 4, 1, 'xsn807', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 5, 1, 'iel387', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 6, 1, 'jiy203', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 7, 1, 'xqk702', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 8, 1, 'vin900', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 9, 1, 'cpt453', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 10, 1, 'ilu530', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 11, 1, 'isn055', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 12, 1, 'clh058', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 13, 1, 'sae262', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 14, 1, 'xrj529', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 15, 1, 'fui950', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 16, 1, 'unr372', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 17, 1, 'hym428', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 18, 1, 'qly480', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 19, 1, 'ugh812', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 20, 1, 'qia727', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 21, 1, 'fhq891', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 22, 1, 'iuc908', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 23, 1, 'osx382', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 24, 1, 'eap285', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 25, 1, 'jhe637', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 26, 1, 'onr831', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 27, 1, 'pid142', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 28, 1, 'zza951', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 29, 1, 'dso256', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 30, 1, 'cun468', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 31, 1, 'rcm677', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 32, 1, 'gmr025', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 33, 1, 'xoo047', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 34, 1, 'iun554', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 35, 1, 'ebw634', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 36, 1, 'ruc428', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 37, 1, 'kzj261', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 38, 1, 'xnt549', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 39, 1, 'zqk700', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 40, 1, 'fnj311', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 41, 1, 'gap614', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 42, 1, 'wee044', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 43, 1, 'del546', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 44, 1, 'zxz296', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 45, 1, 'tbv461', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 46, 1, 'kyz332', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 47, 1, 'nzy115', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 48, 1, 'hug304', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 49, 1, 'lmo896', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 50, 1, 'cdg533', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 51, 1, 'kke309', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 52, 1, 'oks092', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 53, 1, 'fvr596', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 54, 1, 'rxa940', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 55, 1, 'bvx053', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 56, 1, 'ieo159', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 57, 1, 'yoa105', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 58, 1, 'ghw985', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 59, 1, 'irl995', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 60, 1, 'psl642', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 61, 1, 'zqk903', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 62, 1, 'mqm839', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 63, 1, 'fso809', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 64, 1, 'lgt062', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 65, 1, 'jsx377', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 66, 1, 'def279', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 67, 1, 'lcm555', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 68, 1, 'plr996', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 69, 1, 'nsd288', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 70, 1, 'wwh913', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 71, 1, 'hom155', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 72, 1, 'jdj749', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 73, 1, 'ebh134', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 74, 1, 'kwa067', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 75, 1, 'yoq042', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 76, 1, 'qzi221', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 77, 1, 'jst912', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 78, 1, 'scv749', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 79, 1, 'sgo273', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 80, 1, 'ahw087', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 81, 1, 'wzj391', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 82, 1, 'xpk846', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 83, 1, 'bqd733', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 84, 1, 'yjg509', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 85, 1, 'hvy473', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 86, 1, 'gnh362', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 87, 1, 'iox912', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 88, 1, 'pwq654', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 89, 1, 'bef753', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 90, 1, 'dbg034', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 91, 1, 'yxe637', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 92, 1, 'vxh426', 'Sprint', 2015, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 93, 1, 'rbr826', 'Sprint', 2014, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 94, 1, 'sqd994', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 95, 1, 'rur991', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 96, 1, 'sxk458', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 97, 1, 'rvf454', 'Sprint', 2013, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 98, 1, 'rzj354', 'Sprint', 2016, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 99, 1, 'lwo602', 'Sprint', 2017, 1);
insert into driver_cars (id, driver_id, card_brand_id, license_plate_number, model, year, service_type_id) values (driver_cars_sec.NEXTVAL, 100, 1, 'xro530', 'Sprint', 2017, 1);

insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Berky', 'Martijn', 1, 1, 'rl69uw7', '/images/profile/uosovnmycfytc0202726.jpg', '3166676061');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Drucill', 'Bowcock', 1, 1, 'wj92ob5', '/images/profile/xptggeetupgwm7105091.jpg', '3116379760');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mohammed', 'Tattoo', 1, 1, 'mv80yw9', '/images/profile/jxvgvrsleqhof4590191.jpg', '3165275422');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Edgard', 'Montrose', 1, 1, 'co77ck8', '/images/profile/nltdtwchvhbxt8091045.jpg', '3182102407');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ferd', 'Padilla', 1, 1, 'ps80kn5', '/images/profile/wxcelvmaiirrz6757401.jpg', '3138545088');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Pietra', 'Eul', 1, 1, 'qh15wx0', '/images/profile/vsjexxihklxzo8818663.jpg', '3199544545');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Teresita', 'de Merida', 1, 1, 'ny83sl3', '/images/profile/cpchkxheozdcr6248582.jpg', '3109562891');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Natalya', 'Polleye', 1, 1, 'wb55wd6', '/images/profile/zwvldbrtkdxrz4063886.jpg', '3104174646');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Benson', 'Norrington', 1, 1, 'hv58ty9', '/images/profile/dcmbwakzhdzyb9988104.jpg', '3145727688');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hayden', 'Harroway', 1, 1, 'oy35lo7', '/images/profile/xewigbalhmnhp0238363.jpg', '3104599272');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Thacher', 'Kippling', 1, 1, 'sv58je6', '/images/profile/ifceurjnhrrch9066937.jpg', '3125519069');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Donny', 'Keattch', 1, 1, 'ld01ls5', '/images/profile/ldrckeqfkcdwx9924617.jpg', '3128615075');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Austine', 'Barcke', 1, 1, 'gd21dy1', '/images/profile/ziuxsbhbpltdd4631685.jpg', '3184462437');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hewet', 'Lineham', 1, 1, 'wd96qj2', '/images/profile/hhyyifiqrjict1967726.jpg', '3126737138');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nicky', 'Brandino', 1, 1, 've72lz5', '/images/profile/raujkmymjvtyf8967850.jpg', '3164866828');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Obadiah', 'Aggus', 1, 1, 'ji38yr9', '/images/profile/ergynauzamceu0138619.jpg', '3109685702');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jerrie', 'Stickles', 1, 1, 'pu05gy4', '/images/profile/zcmkltynvwzly3186198.jpg', '3119116889');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tamqrah', 'Macklam', 1, 1, 'he69kd5', '/images/profile/bvuqvzqqaolze1602891.jpg', '3147073844');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jacinthe', 'Coultar', 1, 1, 'gv21nr4', '/images/profile/qwtxtwrzglamd8352534.jpg', '3122013755');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Selma', 'Magrannell', 1, 1, 'rv99lz2', '/images/profile/nesflqrmmbbhs1916949.jpg', '3109700535');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Anjanette', 'Attride', 1, 1, 'qk58zo1', '/images/profile/souvmsniwzhzm6018767.jpg', '3149327257');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jorge', 'Sprules', 1, 1, 'bi85zy2', '/images/profile/lgzoarlfnscgq2214623.jpg', '3110200268');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Stormi', 'Bassil', 1, 1, 'rt83bo4', '/images/profile/wdetgowjgxqtf9642606.jpg', '3103418994');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Charmian', 'Brash', 1, 1, 'js84ti9', '/images/profile/rxxmyhufwnsbu0277685.jpg', '3100933780');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cortie', 'Corde', 1, 1, 'fz27ei1', '/images/profile/szruxaufiunby1165154.jpg', '3118979635');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Madelene', 'Sisland', 1, 1, 'hc79zz3', '/images/profile/ialzsoosgdlcs3189668.jpg', '3199422547');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Portie', 'Shemmans', 1, 1, 'ut16ko0', '/images/profile/bjtljbvfssdog1833548.jpg', '3197554326');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ted', 'Hildrew', 1, 1, 'vq96el7', '/images/profile/ffgvwnuzwpggg1842998.jpg', '3173267440');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vladamir', 'Hentzeler', 1, 1, 'zo38sy8', '/images/profile/hpfonlgtryxyx2741371.jpg', '3170718990');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kennett', 'Eastmead', 1, 1, 'vl70st2', '/images/profile/vvnatlhikfwsq8095630.jpg', '3181617217');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Royal', 'Sipson', 1, 1, 'cv86fe9', '/images/profile/jowvyvrzhsiow7756313.jpg', '3179211072');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Damita', 'Yemm', 1, 1, 'eb52ai2', '/images/profile/yyedebykashha8066564.jpg', '3102594640');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rea', 'Heijnen', 1, 1, 'sf01bk8', '/images/profile/ytikdksryugjx1565959.jpg', '3158328106');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jorge', 'Hubberstey', 1, 1, 'lo01fd4', '/images/profile/pbqbfjuxohicw7961000.jpg', '3177780161');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alejoa', 'd''Escoffier', 1, 1, 'po82um1', '/images/profile/cuojnomwofjnl9684752.jpg', '3153788195');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Astrix', 'More', 1, 1, 'nm36gf4', '/images/profile/dvqfjbrerpeeg5144091.jpg', '3104650827');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Abraham', 'Prestage', 1, 1, 'ld21ee3', '/images/profile/wjoxouxwizmms3178880.jpg', '3172608689');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Josy', 'Lemary', 1, 1, 'kq82tt6', '/images/profile/lnjouxtmpzxxu9155271.jpg', '3137920037');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Yetty', 'Danielot', 1, 1, 'pr65uj0', '/images/profile/vlyghnafxfbdi7125650.jpg', '3162284425');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Pamella', 'Birchenhead', 1, 1, 'zj55lu1', '/images/profile/bpazrtagivuuo5153134.jpg', '3109239249');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vinita', 'Sheldon', 1, 1, 'qo94dv7', '/images/profile/ahvyjxvowwenm5195148.jpg', '3185499891');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lela', 'Shoppee', 1, 1, 'pk06ns4', '/images/profile/fcyqsqcawgxgi9260220.jpg', '3183379247');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Corny', 'O''Fihillie', 1, 1, 'zk87tk8', '/images/profile/nioyuwqyzgcdc0648495.jpg', '3172675891');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Meredith', 'Moors', 1, 1, 'aj06nz0', '/images/profile/jmhwlvjdwhmrr9182333.jpg', '3106513177');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Emerson', 'Utridge', 1, 1, 'ji79nh9', '/images/profile/ngmhfsgoekxss1671681.jpg', '3169583498');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ewen', 'Dimitrie', 1, 1, 'gw49cl2', '/images/profile/tsjltyjknworf7508487.jpg', '3178300556');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dorthy', 'Catterill', 1, 1, 'ss35dc2', '/images/profile/ygwxtlbvcbdho2246782.jpg', '3119379584');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bird', 'Giron', 1, 1, 'of47zh4', '/images/profile/ohpojjantslsg8276918.jpg', '3150505049');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Juliet', 'Fruchon', 1, 1, 'xs75mo1', '/images/profile/bkjnqjqjgyxxf9945643.jpg', '3180125689');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Yovonnda', 'Bernholt', 1, 1, 'xp32uo2', '/images/profile/ubytfuqplpypq3731551.jpg', '3197015721');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Annamarie', 'Warbys', 1, 1, 'zr18ed6', '/images/profile/snynkxomknyne1058330.jpg', '3176010642');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Daisie', 'Borges', 1, 1, 'vr64ql8', '/images/profile/grncfpfkddqgw4133408.jpg', '3153640953');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tabby', 'Longthorne', 1, 1, 'hx10ct0', '/images/profile/vdromdotsqmol0280296.jpg', '3166813380');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hannie', 'Kopfen', 1, 1, 'rb45bk9', '/images/profile/xxrrnjsydowpk6981515.jpg', '3165496532');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jule', 'Calabry', 1, 1, 'cj21bd5', '/images/profile/ptejkqkbzzihd0884352.jpg', '3129002082');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dorolisa', 'Longmore', 1, 1, 'hy80ti8', '/images/profile/niwqgbrgoirro7341619.jpg', '3155852581');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Denver', 'MacAndie', 1, 1, 'av93aj2', '/images/profile/svptlnyqxpsqx1814914.jpg', '3197422725');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Giustino', 'Elby', 1, 1, 'yi91mu1', '/images/profile/hfpbwukyfvfeb3023702.jpg', '3116612610');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Elli', 'Kann', 1, 1, 'uu54ra7', '/images/profile/zlbfietjwokrv1297552.jpg', '3146883701');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Westbrook', 'Mathis', 1, 1, 'gc53cd7', '/images/profile/iiaxmtljzqxnh3262548.jpg', '3192355754');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lanette', 'Dommerque', 1, 1, 'qe32ha2', '/images/profile/fqrckzwlcbewy0995720.jpg', '3168909624');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jacklin', 'Loblie', 1, 1, 'yu66cm9', '/images/profile/sbcnaockjjoyh4725917.jpg', '3153859759');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Stephine', 'Piggens', 1, 1, 'by61qs6', '/images/profile/fqkzezokkwrct7123104.jpg', '3172972947');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Freedman', 'Gobourn', 1, 1, 'aw37td9', '/images/profile/wlhyhfjnodvxx7882240.jpg', '3151880233');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Christyna', 'Frarey', 1, 1, 'aq90tt9', '/images/profile/lthstdhbcmoiu6837042.jpg', '3186336152');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Abner', 'McLukie', 1, 1, 'yt58aj8', '/images/profile/ptlycfwzwgwxj5046937.jpg', '3162513912');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Donnajean', 'Itzak', 1, 1, 'ka57bw7', '/images/profile/cpcfchwbbzglp9134441.jpg', '3127825530');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Diahann', 'Buller', 1, 1, 'ft66yw3', '/images/profile/bwgximbppfrgb1678700.jpg', '3136538272');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Devland', 'Jacombs', 1, 1, 'bn43cv6', '/images/profile/poovpxzjzaczm0135959.jpg', '3102007296');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hubie', 'Poizer', 1, 1, 'fg98je7', '/images/profile/iazlmgrftqnqh6771851.jpg', '3145149754');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Maude', 'MacCoughen', 1, 1, 'gd91jp2', '/images/profile/ptcytgdojuruq4413976.jpg', '3175898691');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lorrie', 'Jerrard', 1, 1, 'jh43ej8', '/images/profile/lxnqwpqgcdpnx7124527.jpg', '3129408788');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Laura', 'Hugonet', 1, 1, 'lv87xs4', '/images/profile/dltsikiuakkys1569675.jpg', '3145523434');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Erhart', 'Theurer', 1, 1, 'vz33ov9', '/images/profile/husllvfzvmrhd4080604.jpg', '3173205722');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Eden', 'Muro', 1, 1, 'cs53vw1', '/images/profile/ziulzyqpgotqr7151168.jpg', '3158845799');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Anastasie', 'Clout', 1, 1, 'au10lx4', '/images/profile/szsonvkhlsunv4862592.jpg', '3147824049');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Eileen', 'Moses', 1, 1, 'th90pn5', '/images/profile/ysbsqdnimtutk9736564.jpg', '3156510703');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Annabal', 'Peacop', 1, 1, 'fh35aq0', '/images/profile/vgaivozuzackt2002550.jpg', '3199206859');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Allyn', 'McQuade', 1, 1, 'fp06wv5', '/images/profile/yypbvdcxoeylr6748785.jpg', '3157804142');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dun', 'Dargie', 1, 1, 'so00ol4', '/images/profile/biwiterwmnmrx2456270.jpg', '3118019373');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gertruda', 'Gammett', 1, 1, 'ac75ex1', '/images/profile/tkpmphlirckux0418306.jpg', '3107629071');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jeri', 'Trolley', 1, 1, 'yi15hd0', '/images/profile/lwlmpchednsqj0476408.jpg', '3107216370');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Augustine', 'Gerrit', 1, 1, 'lr78ai5', '/images/profile/awlxfkflsegqi9423876.jpg', '3102869823');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ulla', 'Duff', 1, 1, 'cj30ig2', '/images/profile/hsblflmpturpy7475090.jpg', '3163871902');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rolph', 'Seif', 1, 1, 'ke33vw2', '/images/profile/bhctpeebnqxbj4188601.jpg', '3184520072');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Angelia', 'Dungay', 1, 1, 'ja23xx8', '/images/profile/jadnaddqfoopw7491589.jpg', '3108012143');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Onfroi', 'Raun', 1, 1, 'rz62qc5', '/images/profile/tyqtofibrdlnr8706844.jpg', '3100134233');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vick', 'Hourihan', 1, 1, 'ua61pa8', '/images/profile/ampmppocxjiwn4730647.jpg', '3112368610');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Barbette', 'Tschirasche', 1, 1, 'dh00qo1', '/images/profile/ibxuyvrmzjrhe5515243.jpg', '3174108761');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Terrie', 'Braban', 1, 1, 'xz06bu6', '/images/profile/hwrofnqolwhba4032880.jpg', '3123511953');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sherie', 'Ferschke', 1, 1, 'tq50nj3', '/images/profile/qitvckzsekyvq1245063.jpg', '3142697775');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cale', 'Cowoppe', 1, 1, 'oo09xc4', '/images/profile/crjicklygxzae9509395.jpg', '3184786870');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hernando', 'Dalloway', 1, 1, 'cg38nd0', '/images/profile/izivnbqmqprdj0797324.jpg', '3102698936');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vladamir', 'Cess', 1, 1, 'jz11pb5', '/images/profile/wkxtpmefvenoj2813144.jpg', '3172167337');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Niki', 'Janssens', 1, 1, 'ab84cs9', '/images/profile/xftplrpyclknf9951377.jpg', '3112528076');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ernie', 'Rack', 1, 1, 'rx45gy6', '/images/profile/bsjbueupyotmo8094749.jpg', '3147239424');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Yankee', 'Hellicar', 1, 1, 'fs45zo4', '/images/profile/dsmarwfjtiycg5848818.jpg', '3161811645');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tedra', 'Glaisner', 1, 1, 'zb60rq7', '/images/profile/rbeirhkveoxfc3941208.jpg', '3134379133');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Adel', 'Bright', 1, 1, 'wq27er7', '/images/profile/xfpxctaazogkr3112390.jpg', '3191036389');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sherill', 'Stribling', 1, 1, 'rp54jn4', '/images/profile/ugdqleemujaoi0696620.jpg', '3144550829');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bronnie', 'Esley', 1, 1, 'wn26dp4', '/images/profile/nerjetadotadz6219849.jpg', '3153327317');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Davita', 'Arthurs', 1, 1, 'uh45ir0', '/images/profile/xgqwlnxneutix6589909.jpg', '3124654222');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Domenico', 'Poor', 1, 1, 'op32pk1', '/images/profile/dutgdwvoguvuh0044743.jpg', '3129449125');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Emlen', 'Brasner', 1, 1, 'np28vm1', '/images/profile/qzbuqxmayggxv4192578.jpg', '3161793629');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aubrey', 'Tennet', 1, 1, 'oy43nq0', '/images/profile/zybbonvocnudi0869975.jpg', '3134539946');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ashleigh', 'Dablin', 1, 1, 'zd59al1', '/images/profile/rlpdrxqpersft0776814.jpg', '3105982024');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kelila', 'Normaville', 1, 1, 'fh42vg1', '/images/profile/pyikjtjjdgbio6164794.jpg', '3120442192');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Corny', 'Quare', 1, 1, 'hx77ab1', '/images/profile/sikzznmigbpfm9794929.jpg', '3106016008');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Odell', 'Tomaszewski', 1, 1, 'vi65rk1', '/images/profile/xkatnrtfopyiw3219352.jpg', '3167159499');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hermia', 'Praton', 1, 1, 'id69hm8', '/images/profile/ktgryuhqtlwuo0754849.jpg', '3133104511');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Teddy', 'Whelan', 1, 1, 'ai62vt0', '/images/profile/qdcxlayhnjdch6264293.jpg', '3116834438');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Germain', 'Donn', 1, 1, 'mb51nk0', '/images/profile/dwwtmbbkxgcpz8354204.jpg', '3141001986');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Wenonah', 'Bastistini', 1, 1, 'zu84lw3', '/images/profile/uebahrilaeqee3106043.jpg', '3137126118');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kare', 'Slocombe', 1, 1, 'sh21kq0', '/images/profile/ptjtmzcxviwgm2182520.jpg', '3101723369');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mil', 'Taillant', 1, 1, 'cx59eq8', '/images/profile/rpzmdkdgyxuao2055104.jpg', '3109214407');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Derrek', 'Laxtonne', 1, 1, 'yt75qd6', '/images/profile/rkgtgepapdsxp0457081.jpg', '3146583017');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Essie', 'Mieville', 1, 1, 'gt71gn0', '/images/profile/axoktlokniytf0798375.jpg', '3132586065');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Neale', 'Plumtree', 1, 1, 'zc70rg5', '/images/profile/pttoaauuocyql3691486.jpg', '3187946551');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Arther', 'Lentsch', 1, 1, 'od54od7', '/images/profile/qbdidkzdbfgco0500097.jpg', '3183804197');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sophronia', 'Tiesman', 1, 1, 'ae32ey0', '/images/profile/mkaozznkwyfgv4156260.jpg', '3151346770');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Timothy', 'Woollends', 1, 1, 'ul39zx9', '/images/profile/ibpymycakhndl0572154.jpg', '3150903638');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ezekiel', 'Bruineman', 1, 1, 'pa99ay3', '/images/profile/otivqonpbpzww9217937.jpg', '3122983779');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gabrila', 'Oke', 1, 1, 'xk33vp1', '/images/profile/juludvbydyshj1680990.jpg', '3121768774');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Geri', 'Batha', 1, 1, 'dv51as9', '/images/profile/gjbehxbfkwdgs8735935.jpg', '3188173194');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alanah', 'Symcoxe', 1, 1, 'pc97uk8', '/images/profile/zcfhpuxniljtj0779824.jpg', '3151609351');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dorise', 'Woollends', 1, 1, 'aa90vj7', '/images/profile/oituztfkpdrbw3899665.jpg', '3112562332');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lydie', 'Bourton', 1, 1, 'bz87zb1', '/images/profile/rcmnnsmcyupwi6842725.jpg', '3123822598');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Eb', 'Lebourn', 1, 1, 'si53ge4', '/images/profile/jguieacoksbru6586063.jpg', '3184210712');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gus', 'Flasby', 1, 1, 'nx14kc9', '/images/profile/voaqbgtlzykpp6747244.jpg', '3130138634');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lazarus', 'Jarmain', 1, 1, 'tc15mq3', '/images/profile/iishviaufhlis8673184.jpg', '3181644472');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kassie', 'Noore', 1, 1, 'wj79yr6', '/images/profile/sfpnhcopiolsi1145456.jpg', '3105939595');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mitch', 'Muckian', 1, 1, 'gd99fh8', '/images/profile/auugxelqkzopv2124305.jpg', '3111794004');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Oona', 'Strong', 1, 1, 'ce44rd6', '/images/profile/vekzoxbmgqmqa0505644.jpg', '3188111201');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Base', 'McKechnie', 1, 1, 'zz38xa5', '/images/profile/fvitygyixmecv6166646.jpg', '3113810619');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Evvy', 'Stanton', 1, 1, 'kp30mn5', '/images/profile/xevljsbccsybj3467396.jpg', '3166329703');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Colan', 'Svanini', 1, 1, 'tj33hr8', '/images/profile/zrdfgwlmznbfl5164296.jpg', '3143238233');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Creight', 'Reckus', 1, 1, 'qm35fe6', '/images/profile/xpbyvltwkzbfa2489687.jpg', '3118767514');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Shane', 'Galtone', 1, 1, 'jt08is0', '/images/profile/xqlsqpqigoduu9983181.jpg', '3120664405');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Niels', 'Kemery', 1, 1, 'vd58dk1', '/images/profile/zrbtpjesfdboo7702800.jpg', '3142301264');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rodd', 'Lacotte', 1, 1, 'jx05bs3', '/images/profile/uiplbsnmnfoyi7785472.jpg', '3103571091');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sammie', 'Annandale', 1, 1, 'jq43vv8', '/images/profile/ftuibqblcwwix2958559.jpg', '3169429316');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Finley', 'Rodda', 1, 1, 'cf74cv0', '/images/profile/mxnvxelsikvab7975711.jpg', '3102943531');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ase', 'Hardingham', 1, 1, 'ra97xp3', '/images/profile/okpjfcwjclwse2820960.jpg', '3141157944');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Glynis', 'Ovitts', 1, 1, 'ed02yy1', '/images/profile/odzppkbpqmmbs9022652.jpg', '3105563555');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Holden', 'Lenin', 1, 1, 'fh51yo5', '/images/profile/nqqrjxjhyhcku8709549.jpg', '3116217062');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bill', 'Wellbeloved', 1, 1, 'gx34sy6', '/images/profile/anwocmavaheik6641456.jpg', '3139107985');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Curtis', 'Dudleston', 1, 1, 'iu94jy4', '/images/profile/iktzjwodulhzi8448256.jpg', '3127201879');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Philis', 'Lowth', 1, 1, 'yj75fs3', '/images/profile/olkqdswmnhqkv5950764.jpg', '3171714118');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sonya', 'Ouchterlony', 1, 1, 'rs20uh9', '/images/profile/mfbtppxesowfr2666423.jpg', '3175712820');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Padriac', 'Fairlie', 1, 1, 'pe37fg6', '/images/profile/zvojzpludxzsl1878306.jpg', '3107273640');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Goldi', 'Fahy', 1, 1, 'fe17gm4', '/images/profile/mzhzcddrphhwq1502429.jpg', '3130209549');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cornelius', 'MacNeish', 1, 1, 'jb74eq8', '/images/profile/qgrfwqofegurm7994372.jpg', '3100955319');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Korney', 'Notton', 1, 1, 'jj60hs1', '/images/profile/rvrhygxbhqdag9922236.jpg', '3110931719');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gaylene', 'Le Monnier', 1, 1, 'sq84uh3', '/images/profile/rmwvjlqbrsuol9507183.jpg', '3138155028');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cherie', 'Driffe', 1, 1, 'fs16un8', '/images/profile/yyljzaqzkdhmx8462582.jpg', '3143671660');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Eula', 'Heenan', 1, 1, 'nk28cw1', '/images/profile/vhkzicxgxjopn6741227.jpg', '3130081668');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Candace', 'Allin', 1, 1, 'id39wc6', '/images/profile/abejhlthaprsj3519080.jpg', '3164400179');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Junette', 'MacConchie', 1, 1, 'st43je5', '/images/profile/fecxpngqveptv4380980.jpg', '3168911539');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bobbee', 'Rosenberger', 1, 1, 'ji20rp6', '/images/profile/hnswuksodkykh5413884.jpg', '3137647243');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mikkel', 'Domke', 1, 1, 'ps10vg9', '/images/profile/ekibjgirqyqkx9391145.jpg', '3195301850');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Daren', 'Flintoff', 1, 1, 'bk70fj9', '/images/profile/gudeniwhopwru5550626.jpg', '3104327507');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Krista', 'Diggar', 1, 1, 'hy57ko2', '/images/profile/vyqrhfexpslfj0720487.jpg', '3131998469');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Siegfried', 'Forsyde', 1, 1, 'jx08aj9', '/images/profile/pwfepxclxlwby4438456.jpg', '3170391244');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hammad', 'Antecki', 1, 1, 'et59ao0', '/images/profile/pabxwngjvffeg2662765.jpg', '3136415342');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bourke', 'Belford', 1, 1, 'ku82kh8', '/images/profile/hfavbzuutxhta3780949.jpg', '3160621015');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Conroy', 'Willers', 1, 1, 'oh89ng2', '/images/profile/besidzvezgpta8628297.jpg', '3198405467');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rosy', 'Semarke', 1, 1, 'on46zs9', '/images/profile/iyhnjitgmgfrx6771085.jpg', '3192692226');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Robers', 'Bunnell', 1, 1, 'na12kg2', '/images/profile/yxrlpytyjxnio1570310.jpg', '3142970104');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Allistir', 'Fanstone', 1, 1, 'ty74er9', '/images/profile/urflghmzrwrai8146267.jpg', '3161560201');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Donnie', 'Cahan', 1, 1, 'hi42ky1', '/images/profile/argxtxmpxxiew9963049.jpg', '3189236421');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Karilynn', 'Warren', 1, 1, 'ur43fz5', '/images/profile/fsmekpqqxcugi7919774.jpg', '3109491662');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nevil', 'Rolingson', 1, 1, 'lx08zu9', '/images/profile/kxynfujsgirqp1245815.jpg', '3153222241');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Indira', 'Selvester', 1, 1, 'jj43ak2', '/images/profile/cadmmyxqozccj4789370.jpg', '3109200318');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hervey', 'Jobling', 1, 1, 'lx11ck2', '/images/profile/ctmyjdkxbavyw1337669.jpg', '3177834526');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hoyt', 'Shadfourth', 1, 1, 'kf84fs6', '/images/profile/grshxrespzcib6589166.jpg', '3133601289');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Raimund', 'Fitt', 1, 1, 'rb44rj6', '/images/profile/fuoxbahkkruzf7341860.jpg', '3118411411');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lindy', 'Langrish', 1, 1, 'pr56vf9', '/images/profile/iriqodviuxwbc8400620.jpg', '3136991874');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nikolai', 'Digg', 1, 1, 'gf07ms5', '/images/profile/moslhsrbvayoh6939390.jpg', '3116178695');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Diego', 'Humm', 1, 1, 'zl69ep2', '/images/profile/xpioovybnnecq4563042.jpg', '3180274960');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Maximilian', 'Smeall', 1, 1, 'cd19yq2', '/images/profile/taupmbgmldkmk6333532.jpg', '3198492052');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dene', 'Wotton', 1, 1, 'lw16yy2', '/images/profile/jiyarmrpfhhrv8415892.jpg', '3109359306');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Trixie', 'Eminson', 1, 1, 'ck18uc3', '/images/profile/xcaiwapczrcwc6421319.jpg', '3194362083');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jaime', 'Sans', 1, 1, 'tc42vh4', '/images/profile/pnvtuyfsohvho1357032.jpg', '3179938162');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Geraldine', 'Merit', 1, 1, 'jj51lu0', '/images/profile/ylcvagagvsnno9034134.jpg', '3157962931');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kory', 'Marrill', 1, 1, 'mk72lh1', '/images/profile/qqohlroqdrbho0281817.jpg', '3106653223');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Essy', 'Puttergill', 1, 1, 'cb82li2', '/images/profile/fdiafgdkvkhvo2230952.jpg', '3109313043');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Christi', 'Semeradova', 1, 1, 'pp20xz4', '/images/profile/kdwbpkrtsslde2946673.jpg', '3148289220');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ariana', 'Bodham', 1, 1, 'jg57xy4', '/images/profile/jispgtdikjhzo4051298.jpg', '3145689739');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Reider', 'West', 1, 1, 'vu04iz3', '/images/profile/yurajttyxdupi4443003.jpg', '3126623541');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kilian', 'Rekes', 1, 1, 'wr77za5', '/images/profile/pubdkwvsxnkoe7534979.jpg', '3172756739');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Roxi', 'Creelman', 1, 1, 'ql16fs9', '/images/profile/gyutuhreonyqn5508622.jpg', '3166306789');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Eleen', 'Kike', 1, 1, 'xe53ou8', '/images/profile/usufmwecmgipl1647043.jpg', '3129078246');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bobette', 'Treece', 1, 1, 'cg68ky8', '/images/profile/dghypumvnhkmf3596227.jpg', '3138076761');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Devon', 'Maliffe', 1, 1, 'wz47db1', '/images/profile/zjgvtqiazwxtj2189050.jpg', '3161828088');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Allyn', 'Ramel', 1, 1, 'gi54ej0', '/images/profile/rczhqkqrzvdfb6677109.jpg', '3193734117');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Betty', 'Finlator', 1, 1, 'zb30qs6', '/images/profile/ntiokjgzfvydd1799989.jpg', '3193647359');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Isadore', 'Klimochkin', 1, 1, 'xu79fg8', '/images/profile/qsiqfcbfougok4120197.jpg', '3132146258');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Marwin', 'Cumber', 1, 1, 'bw06bu0', '/images/profile/kdlycydyepkrn2637643.jpg', '3101985069');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bear', 'Johl', 1, 1, 'fr89fm4', '/images/profile/rewmfwnvpgmon7587858.jpg', '3118368683');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Payton', 'Spencock', 1, 1, 'ym99ty5', '/images/profile/iljhhoaywvfta6622519.jpg', '3132682201');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Stoddard', 'Fries', 1, 1, 'ox39pw1', '/images/profile/smcurrnbytepp1501413.jpg', '3192477708');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Reeva', 'Gebuhr', 1, 1, 'ly06fm0', '/images/profile/thxrtygvacfni1541300.jpg', '3159905095');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cristina', 'Clapperton', 1, 1, 'xz31eh5', '/images/profile/iighuiaggjrkg3759439.jpg', '3114808510');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Claybourne', 'Tallent', 1, 1, 'jb65gi2', '/images/profile/cbknjufwthhiz1551652.jpg', '3147396623');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kipp', 'Nestle', 1, 1, 'vc11uk2', '/images/profile/gyptqjmkkjuld5390034.jpg', '3175517546');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mill', 'Marris', 1, 1, 'hr08nt4', '/images/profile/ydtionjamiqdx1211760.jpg', '3192035416');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Chery', 'Reffe', 1, 1, 'wm51pw3', '/images/profile/tabjyjmuklewq9600524.jpg', '3191613541');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sayer', 'Moss', 1, 1, 'lw46gg2', '/images/profile/ufjvavaimtokr6737666.jpg', '3195443405');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sterne', 'Brookbank', 1, 1, 'nx95ir2', '/images/profile/giyxtneemwlex4741537.jpg', '3195437669');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Onfre', 'Foort', 1, 1, 'hm24bx1', '/images/profile/apadrdibbroal6479444.jpg', '3197892401');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Birgitta', 'Dinzey', 1, 1, 'ur97eb5', '/images/profile/jbbkkfmetymui5038735.jpg', '3124401026');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Toddy', 'Giorgietto', 1, 1, 'cs42xl2', '/images/profile/ikfepjdsbofdc3628999.jpg', '3108935429');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Penn', 'Fydo', 1, 1, 'br24qn6', '/images/profile/wuihpzqsptozb8419485.jpg', '3118463641');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jermaine', 'Hansana', 1, 1, 'qq19mo7', '/images/profile/wybfegquhmoha9070693.jpg', '3127656238');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Iggy', 'Loghan', 1, 1, 'vg48ke1', '/images/profile/ynvsysxdlgils1295403.jpg', '3125734305');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Thomas', 'Belchamp', 1, 1, 'cb57ix6', '/images/profile/ivmuuananacil9037582.jpg', '3139788175');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Stafani', 'Skirven', 1, 1, 'xf88yj5', '/images/profile/nbcgljjaezvqk2704948.jpg', '3157395211');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vic', 'Riccardini', 1, 1, 'av95oe7', '/images/profile/fnmobvxpvbojk4435094.jpg', '3121376153');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Onfre', 'Malyan', 1, 1, 'og35an3', '/images/profile/mlulepitsnhgj9950302.jpg', '3161342311');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Obie', 'Rasor', 1, 1, 'zg27qk7', '/images/profile/vahepcchodalb7537207.jpg', '3172449123');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dore', 'Postle', 1, 1, 'ue86no2', '/images/profile/zlvosxckkzcdu0496719.jpg', '3152243625');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jessie', 'Yard', 1, 1, 'cj78li0', '/images/profile/mfkuexovonvpi6252586.jpg', '3186626667');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sophey', 'Gebby', 1, 1, 'ze82rm6', '/images/profile/idlnrxwudtner4788082.jpg', '3179347575');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nevin', 'California', 1, 1, 'sm18ky8', '/images/profile/enrnuylslqzbr3054409.jpg', '3112261981');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lotta', 'Vigus', 1, 1, 'lc55qr9', '/images/profile/xhvlkkwlugere3258335.jpg', '3134759454');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Crosby', 'Perryman', 1, 1, 'js97gf6', '/images/profile/qtnvmjaptglab1252462.jpg', '3138952563');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ciro', 'Pena', 1, 1, 'mq62cz3', '/images/profile/lielbrqudewjl2486976.jpg', '3111340466');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Edmund', 'Challener', 1, 1, 'ka31bc9', '/images/profile/apqnilapyhmsu2229374.jpg', '3116214023');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Amalea', 'Brunini', 1, 1, 'my35zv1', '/images/profile/cimktebokvwyc7936468.jpg', '3199223616');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kenneth', 'Stovine', 1, 1, 'tx34ci0', '/images/profile/ktbmjcvsqcyap4444984.jpg', '3147432940');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Stacia', 'Kobiera', 1, 1, 'eu19wm4', '/images/profile/qhpgfesyarbnh4965405.jpg', '3175833852');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mic', 'Smithen', 1, 1, 'go60xy7', '/images/profile/rxafdlzxrlpln3342674.jpg', '3158511382');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tamarah', 'Lesor', 1, 1, 'rk34pv9', '/images/profile/wcboqpufljyue9744333.jpg', '3185580307');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dex', 'Oswald', 1, 1, 'qh70ku8', '/images/profile/jxkxxooabtqoa6987831.jpg', '3138948976');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Patrizius', 'Rudiger', 1, 1, 'jh98ex2', '/images/profile/opjlfdezaelsp4070812.jpg', '3156162388');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jodie', 'Stodit', 1, 1, 'nw77zy4', '/images/profile/pswqlvkhdujim1571524.jpg', '3124502633');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Layton', 'Cleeve', 1, 1, 'nm39az5', '/images/profile/scuvqtpdmnxtd5987643.jpg', '3100633425');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Reena', 'Skeates', 1, 1, 'bq00da1', '/images/profile/yrpwtdmrppume3734374.jpg', '3187841721');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Marlo', 'Tichner', 1, 1, 'ta06nm3', '/images/profile/lkcdwazjqozmo7144275.jpg', '3135292431');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aaron', 'Chazotte', 1, 1, 'da37fm2', '/images/profile/utwonxyjmzldn2756811.jpg', '3100820615');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Saudra', 'Mellmer', 1, 1, 'qt46ov1', '/images/profile/qpsdnirfaphzz7322530.jpg', '3122653626');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rufe', 'Stebbins', 1, 1, 'ie94dw5', '/images/profile/mjdeauwxxtusv6426411.jpg', '3143655722');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Traci', 'Bedin', 1, 1, 'uj04rg0', '/images/profile/tprjdrhgwotmb3727418.jpg', '3186985475');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Donal', 'Hovert', 1, 1, 'dr25pd7', '/images/profile/poqulptyhlhev7229342.jpg', '3168317816');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Keely', 'Simounet', 1, 1, 'lr72lb4', '/images/profile/dlumvrzeafzuu4242237.jpg', '3126342616');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Juan', 'Linch', 1, 1, 'ol96gg2', '/images/profile/jnywbbvwselli3221273.jpg', '3117446446');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Leesa', 'Schutte', 1, 1, 'jr51cl0', '/images/profile/eiurepquqqnun9365310.jpg', '3101577756');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alden', 'Jotcham', 1, 1, 'lt10ef9', '/images/profile/hveksmgszurge6761721.jpg', '3132895379');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lek', 'Nixon', 1, 1, 'fh74fc9', '/images/profile/okdvmyocprlla0406264.jpg', '3199438420');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Caria', 'Toffoloni', 1, 1, 'ma45nq6', '/images/profile/mcdybdhlfhhcc3308576.jpg', '3195371605');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Monica', 'Bucklee', 1, 1, 'pd41hu6', '/images/profile/liriinoimbtel1154075.jpg', '3133410214');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Zorina', 'Paradis', 1, 1, 'qn27oo5', '/images/profile/cgmvofdbwwisw7491190.jpg', '3199540828');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cyb', 'Yard', 1, 1, 'rz83vz0', '/images/profile/tstzinoljnzyt5590834.jpg', '3136737920');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Holly-anne', 'Keegan', 1, 1, 'zy66cg3', '/images/profile/tuxfvaahzezsa2776666.jpg', '3162345626');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vivie', 'Barroux', 1, 1, 'tm88is7', '/images/profile/kjhfysgizvnrc1707892.jpg', '3129591179');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kristine', 'Verma', 1, 1, 'cj47pd7', '/images/profile/wrnpzslaudqey0620931.jpg', '3161547929');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Arluene', 'Lochead', 1, 1, 'ke30kl6', '/images/profile/wafemgsryhrxa2501865.jpg', '3120377806');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Leicester', 'Demchen', 1, 1, 'xu61ce9', '/images/profile/giegclwxgwtmj4059687.jpg', '3165966356');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Man', 'Langfitt', 1, 1, 'ha46mu5', '/images/profile/fbbabpasldein9534022.jpg', '3176955596');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Christabella', 'Signe', 1, 1, 'ne32wi7', '/images/profile/fgtnfhrhwhmtr6043169.jpg', '3152808387');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Davita', 'Stickells', 1, 1, 'tw16rh2', '/images/profile/nqkjqauffkwkj5990739.jpg', '3155708804');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Melessa', 'Chastang', 1, 1, 'we13gl2', '/images/profile/faqhmdhkonamq7022143.jpg', '3131897934');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nerissa', 'Thurske', 1, 1, 'ug78wg0', '/images/profile/ptszlossvinrt8636721.jpg', '3151327225');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Wainwright', 'Sherreard', 1, 1, 'xd07ir7', '/images/profile/hgisyryeatimg6522085.jpg', '3169978588');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lorrie', 'Ethridge', 1, 1, 'pi27er2', '/images/profile/rddcpngwudtot8350612.jpg', '3193365345');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Harland', 'Jeanesson', 1, 1, 'et01aj4', '/images/profile/dvuyrebzsnjeq6267054.jpg', '3115994120');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Angeli', 'Strank', 1, 1, 'xv42wy4', '/images/profile/upjdtnvnogyhr2813822.jpg', '3195555436');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Stesha', 'Dellenbrok', 1, 1, 'oa19el3', '/images/profile/qtlhfqtumvtkw4915296.jpg', '3118406157');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Adolphe', 'Southers', 1, 1, 'tf96os8', '/images/profile/yocuhqiywfntb0711542.jpg', '3151263228');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Karalee', 'Pleming', 1, 1, 'jz56zi2', '/images/profile/nihwnnpnvjagh1848106.jpg', '3159958783');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Toni', 'Illesley', 1, 1, 'db98oy5', '/images/profile/jjwbkwpcyooxq2963703.jpg', '3117951168');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Carver', 'Flinn', 1, 1, 'qi37aj0', '/images/profile/nygvaltmywxxs3751979.jpg', '3113774068');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Priscella', 'Eck', 1, 1, 'zy59bc1', '/images/profile/wwuqfauiyrwks7560264.jpg', '3170314319');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aili', 'Woolis', 1, 1, 'pi20kk1', '/images/profile/jucvqqidnkoco5942180.jpg', '3106952514');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Natty', 'Wormleighton', 1, 1, 'xe90cg6', '/images/profile/sdpujycmlgdzy2228489.jpg', '3199826313');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dennie', 'Sanderson', 1, 1, 'qv15om4', '/images/profile/hxbmnkdjamzxn0648371.jpg', '3106171110');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hallsy', 'Pile', 1, 1, 'ev76hg0', '/images/profile/udtbzqeclhqsi3731784.jpg', '3184179322');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alica', 'Weymouth', 1, 1, 'th19ws1', '/images/profile/xvplwcgktoiqs1966345.jpg', '3133213279');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Duff', 'Dickerline', 1, 1, 'ks93yy6', '/images/profile/snsmsytjwcjtt1904178.jpg', '3151476946');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mimi', 'Lauritsen', 1, 1, 'vc71hg5', '/images/profile/vbmxopyxvshzg9586177.jpg', '3172094251');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Laughton', 'Perillio', 1, 1, 'ak51au9', '/images/profile/vmipjvixkrgmg0869581.jpg', '3154325287');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Udell', 'Mesant', 1, 1, 'td20ul2', '/images/profile/hbfrpysiqdtmq3015168.jpg', '3141077607');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Frasquito', 'Hugonet', 1, 1, 'wl10zb2', '/images/profile/ffljhzurpsjra4084825.jpg', '3158740598');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Christiana', 'Peters', 1, 1, 'gv24tz3', '/images/profile/qtmmfdqjyuvrk2957672.jpg', '3126416458');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Moe', 'Lowrance', 1, 1, 'pt22ng0', '/images/profile/nhwxmuannjmhn0991077.jpg', '3147755606');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Renata', 'Broadhead', 1, 1, 'rj07pr3', '/images/profile/dgqgwmrhscpbp8056972.jpg', '3182838830');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Everard', 'Gribble', 1, 1, 'er18ns5', '/images/profile/avnluwukvbjnw2844499.jpg', '3178091058');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ivory', 'Peedell', 1, 1, 'cd51rv7', '/images/profile/mgdwnuxiljuqj7871137.jpg', '3123217384');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Torrance', 'Frederick', 1, 1, 'zj18pt4', '/images/profile/upmhrhlecchli4953067.jpg', '3104791040');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Katharyn', 'Philcock', 1, 1, 'mn55ew5', '/images/profile/mzhczolmvsuya2148272.jpg', '3171854673');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Burgess', 'Prester', 1, 1, 'bp74of0', '/images/profile/garwfzoicdmrd9506671.jpg', '3113187880');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Isobel', 'Joly', 1, 1, 'mq99xw3', '/images/profile/vaojfmubnfypy0838834.jpg', '3145686824');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lonnard', 'Raselles', 1, 1, 'on92ob3', '/images/profile/dybaieahgryka7604419.jpg', '3152107174');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Pat', 'Reuben', 1, 1, 'vs89sv4', '/images/profile/ozanepehzkcdd1125182.jpg', '3180959096');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jonell', 'Buttwell', 1, 1, 'mh75za8', '/images/profile/zavncqslxqbve2610520.jpg', '3139194172');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dael', 'Guierre', 1, 1, 'jb84tu6', '/images/profile/uvkjrwcykdacs4461081.jpg', '3155148997');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Raul', 'Sandeson', 1, 1, 'nq69vy6', '/images/profile/vhmkokhcmhews4965175.jpg', '3141168591');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Penelope', 'Coon', 1, 1, 'pj61bs7', '/images/profile/eohhuenwqlgsj9368405.jpg', '3185055555');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Manfred', 'Huitt', 1, 1, 've05hv1', '/images/profile/hqvdmgzlrsgsa2742429.jpg', '3142117740');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Georgetta', 'Gaymar', 1, 1, 'ip07pg7', '/images/profile/rvjhchpscffsz1613965.jpg', '3132626935');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nahum', 'Sanders', 1, 1, 'wl01fa4', '/images/profile/jevjzhtdxlyex7893306.jpg', '3127680085');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Arlana', 'Boys', 1, 1, 'qo57by1', '/images/profile/nkopbplpesuuj9583115.jpg', '3157460718');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Abbey', 'Jacquet', 1, 1, 'wm12qr5', '/images/profile/radjdwnizzdlt5048986.jpg', '3160445320');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lindy', 'MacKeig', 1, 1, 'oa46wk0', '/images/profile/nsfsongbdrmrr6443333.jpg', '3116853936');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Claudetta', 'Ducarel', 1, 1, 'jm85wd5', '/images/profile/qtrhwzaxaiozk0746306.jpg', '3183338545');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Angelia', 'Fishbourn', 1, 1, 'jc26ip4', '/images/profile/mpqvvtyxvlzrg2387744.jpg', '3159204575');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ainsley', 'Garbutt', 1, 1, 'kt69av1', '/images/profile/oriycwkrtwbkn8664836.jpg', '3152881631');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Waneta', 'Van Hault', 1, 1, 'kk80yo2', '/images/profile/szhmruvrqsyzs3777322.jpg', '3170361016');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gaylor', 'Blaker', 1, 1, 'si55yt8', '/images/profile/vifbzmihdcozf8017137.jpg', '3154468480');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Silvio', 'Permain', 1, 1, 'dj92yw1', '/images/profile/vthixtjojjebx9386406.jpg', '3153422632');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ken', 'Awdry', 1, 1, 'zz88ug9', '/images/profile/qnrtuajseshdx9456832.jpg', '3188312346');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Blanche', 'Cornu', 1, 1, 'ix17tw8', '/images/profile/dglxfkqdiietl9024526.jpg', '3198406153');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Darrick', 'Crampsey', 1, 1, 'co03hy3', '/images/profile/nsbusrqgqoemb5872266.jpg', '3140906812');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mil', 'Bidewel', 1, 1, 'sw78pc5', '/images/profile/lmyifixbsojxt1797223.jpg', '3114976671');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jess', 'Rosie', 1, 1, 'cg18ij2', '/images/profile/rekocoonevnqz9643153.jpg', '3143933388');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Antonella', 'Tures', 1, 1, 'bc32tj2', '/images/profile/zraklbzfdvwlt4704384.jpg', '3184088158');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Becki', 'Polleye', 1, 1, 'eh72oe9', '/images/profile/jqoupjetajgml4290669.jpg', '3174500611');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aguistin', 'MacAllen', 1, 1, 'mr45zv7', '/images/profile/pnczvkpdflilc8296549.jpg', '3146961900');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lynett', 'Chapleo', 1, 1, 'on55li5', '/images/profile/xwnyqnzxptsnm2103696.jpg', '3195531313');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Forster', 'Halburton', 1, 1, 'je00pp5', '/images/profile/ieudiripsuawz0172452.jpg', '3156239379');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dulsea', 'Stefanovic', 1, 1, 'va74mo0', '/images/profile/zwzbhjjrpkzxi4058596.jpg', '3196195236');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hunfredo', 'Hardisty', 1, 1, 'jl31ap9', '/images/profile/enjusccapvgjw3197986.jpg', '3169420456');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Klaus', 'Chastan', 1, 1, 'mz85xy6', '/images/profile/mhnltttonqeoz0402992.jpg', '3115785603');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Estele', 'Evason', 1, 1, 'bz46mi6', '/images/profile/hzyiibckarqzd3351946.jpg', '3137337735');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Farrel', 'Maunders', 1, 1, 'gk03lc2', '/images/profile/qiamyvrcpsqek2518306.jpg', '3128682626');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alair', 'Gaudon', 1, 1, 'kb64ju3', '/images/profile/wplicjqlmxkqd9351326.jpg', '3115783184');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Port', 'O''Hagerty', 1, 1, 'cu27eu7', '/images/profile/mmewbxtdlucil6019597.jpg', '3127841974');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mile', 'Slinger', 1, 1, 'fa12bw3', '/images/profile/jongpjjrveljo3980817.jpg', '3187820879');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ferdinande', 'Aleksandrov', 1, 1, 'ic40az3', '/images/profile/nfkupgvrhyicv2970975.jpg', '3178748712');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jeffry', 'Tonepohl', 1, 1, 'ad09ya8', '/images/profile/utcdefcyrsrfu4330411.jpg', '3112978843');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Edgard', 'Jesper', 1, 1, 'cw10kz4', '/images/profile/gowbujlmwxgew9421723.jpg', '3184720505');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jourdan', 'Benesevich', 1, 1, 'jn25ko7', '/images/profile/bbpwkhabshpla6328725.jpg', '3180539218');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kelsi', 'Holdin', 1, 1, 'ur23ub8', '/images/profile/hnhrqbaccgwvf1923379.jpg', '3122748013');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jocelyn', 'Bordessa', 1, 1, 'wc32gt9', '/images/profile/ibxuteufrngpj9945987.jpg', '3151312986');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Genevra', 'Salmoni', 1, 1, 'gc13zf3', '/images/profile/ijaxfekxsaeur2960643.jpg', '3168303010');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Shir', 'Hartley', 1, 1, 'lc43mo5', '/images/profile/fbflexzyujgiw6241496.jpg', '3161645196');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nichol', 'Tees', 1, 1, 'tf92eh4', '/images/profile/lthbdfaksnnos0794944.jpg', '3152809856');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Arne', 'Faltin', 1, 1, 'ry11yn7', '/images/profile/ozoqpmbmdkjyg1198762.jpg', '3139913327');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Husein', 'Capsey', 1, 1, 'jq52qn5', '/images/profile/rmrhxyaddzsbl7566409.jpg', '3136675461');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jeane', 'Stainton - Skinn', 1, 1, 'wn75ic2', '/images/profile/evlinynmcpbqb1136013.jpg', '3131924969');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Martica', 'Shopcott', 1, 1, 'jm43xz4', '/images/profile/yfsxhdzgiftil3404060.jpg', '3142851181');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mile', 'Hanbridge', 1, 1, 'zo56pr0', '/images/profile/jaejcxsywvjhh6200556.jpg', '3110976870');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Glennie', 'Rispin', 1, 1, 'og02bj4', '/images/profile/ostrwcrqvybto2088607.jpg', '3184363116');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Katee', 'Mathet', 1, 1, 'ks30qy7', '/images/profile/iwtivsyjyhpqz3612918.jpg', '3173861128');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ezequiel', 'Billinge', 1, 1, 'lz23ft0', '/images/profile/godyiwobphkob9237255.jpg', '3124494508');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kaila', 'Stringman', 1, 1, 'md56be5', '/images/profile/pafyxcopjsltz8177977.jpg', '3129259388');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cordie', 'Freestone', 1, 1, 'fd38cg4', '/images/profile/ijkzzpzdkvwek7381245.jpg', '3128649692');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Welch', 'Hammon', 1, 1, 'ep54gr1', '/images/profile/utekcloxaudyy5691210.jpg', '3188784870');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ellen', 'Liff', 1, 1, 'us33kt9', '/images/profile/drlgetzcvgciq6840060.jpg', '3139939152');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hendrik', 'Sherewood', 1, 1, 'ev13hb9', '/images/profile/emvwoszxmwmea7577115.jpg', '3181090831');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Danie', 'Goodridge', 1, 1, 'ai57oc2', '/images/profile/tphzijsxkphcj6678386.jpg', '3117024368');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Preston', 'Sobey', 1, 1, 'gk41hx2', '/images/profile/xfmskpnheshdw3230363.jpg', '3142434669');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dene', 'Sandes', 1, 1, 'ih62wj7', '/images/profile/fqwaneqbodonm3698139.jpg', '3163477340');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jonah', 'Adhams', 1, 1, 'al73kv5', '/images/profile/wyonvysyjjzvw4795024.jpg', '3196766245');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alix', 'Cutmare', 1, 1, 'tm73gu5', '/images/profile/ynqkgageyzkkd2947542.jpg', '3153722695');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aldin', 'Hennington', 1, 1, 'xd24tw1', '/images/profile/ifcgfmjdzwezr3280262.jpg', '3194845959');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Atlante', 'Shurville', 1, 1, 'wk29pc0', '/images/profile/avtuwfcqmijgg5828857.jpg', '3147602129');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nowell', 'Reede', 1, 1, 'dn48dr8', '/images/profile/hcjbxfkmggbfp5469249.jpg', '3143424057');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ignazio', 'Pittway', 1, 1, 'pq62wh9', '/images/profile/fsbdguwqjndhh5411483.jpg', '3169978927');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Roda', 'McPhail', 1, 1, 'zp48rp5', '/images/profile/zvgqqzookosjb4625548.jpg', '3140157571');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Charis', 'Hattrick', 1, 1, 'kk06qa5', '/images/profile/icjbrucwjamxf2022201.jpg', '3199638707');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Barbette', 'Allworthy', 1, 1, 'iq24pw3', '/images/profile/lrokhximqiqse7242833.jpg', '3103494681');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Walther', 'Arlt', 1, 1, 'ek71bs6', '/images/profile/yffvhoeadahtc5017742.jpg', '3188650974');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Chrisy', 'Digwood', 1, 1, 'aj38uq0', '/images/profile/vnbwdqnzbuiwb3908144.jpg', '3127570470');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jim', 'Waddington', 1, 1, 'ej46iz2', '/images/profile/dxanvupcrajpr9511108.jpg', '3173780874');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Olivie', 'Downton', 1, 1, 'rb01ui1', '/images/profile/yfovuasiefpsq7449892.jpg', '3104957991');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Germain', 'Halworth', 1, 1, 'wb97fs0', '/images/profile/awvtcmzfqpjje9770776.jpg', '3176406797');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Goldina', 'Langthorn', 1, 1, 'dg74qn8', '/images/profile/lrzfwcvmjdfct5166360.jpg', '3149899192');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Merrill', 'Houseley', 1, 1, 'mc54yl7', '/images/profile/hpmgnqmtbdmsg5948351.jpg', '3147182330');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nomi', 'Andrichak', 1, 1, 'pq13sh0', '/images/profile/zkwnkbnjfgvcl4980391.jpg', '3115297191');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Doyle', 'Devenport', 1, 1, 'ol64uh0', '/images/profile/azfuzhahniqho9113323.jpg', '3124846175');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rolph', 'Cansdill', 1, 1, 'pf85rr4', '/images/profile/fhlrslckltjzl4833844.jpg', '3195508502');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Orville', 'Gerring', 1, 1, 'pi72ql0', '/images/profile/goeuaxnalsjti5434700.jpg', '3164854681');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Herc', 'Maly', 1, 1, 'ee60qm1', '/images/profile/npbqszxuvfmhp4665861.jpg', '3174120905');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gibb', 'Volant', 1, 1, 'pl36mt0', '/images/profile/oaaxvmecopmaz2972055.jpg', '3107354056');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alfie', 'Eagar', 1, 1, 'zw82gp2', '/images/profile/tjwormpfwphgw5705168.jpg', '3182554152');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kynthia', 'MacNeely', 1, 1, 'au61ga2', '/images/profile/wmdrgvyrytnyi9212407.jpg', '3143123861');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Moise', 'McGennis', 1, 1, 'ny14fp0', '/images/profile/nozqtbmrqhhet1087476.jpg', '3189264163');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Fred', 'Enocksson', 1, 1, 'uz78bm2', '/images/profile/tytlqdgnyiwol4325891.jpg', '3108318517');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Clevey', 'Akeherst', 1, 1, 'is54st5', '/images/profile/itaqnlqojiqel5691369.jpg', '3168963231');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Miltie', 'Ollie', 1, 1, 'ny78es2', '/images/profile/bfyyqqxuilkxi9802113.jpg', '3176559793');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Julianne', 'Strowthers', 1, 1, 'zq77pq3', '/images/profile/csirkajvulnzj2148274.jpg', '3123670384');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Celene', 'Gogarty', 1, 1, 're26uh8', '/images/profile/ebndhqrwfmfxi8903710.jpg', '3140298971');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cristian', 'Swinburn', 1, 1, 'mx49qx7', '/images/profile/nhptyhmjeegcc0281644.jpg', '3173766276');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Blondie', 'Fulk', 1, 1, 'he39ht7', '/images/profile/xwnhmuawkeqnt5426771.jpg', '3187507899');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sharona', 'Ostridge', 1, 1, 'wc84bx2', '/images/profile/ihntsvzexuwuw9443056.jpg', '3169786681');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'De', 'Garlant', 1, 1, 'sb80if9', '/images/profile/gfdkqngkdolau8270521.jpg', '3155025598');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nada', 'Martusewicz', 1, 1, 'as57uk1', '/images/profile/ccgsgjhsboxto6794902.jpg', '3191801219');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ludvig', 'Avramovich', 1, 1, 'wq61lh6', '/images/profile/dhcdwmxbibzxi6661483.jpg', '3166745052');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Andres', 'Pahler', 1, 1, 'bv33fd0', '/images/profile/adcyyejbfyatd8717904.jpg', '3160319460');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Othelia', 'Insall', 1, 1, 'pv92ql8', '/images/profile/ksyrytmofpyki3983223.jpg', '3109020385');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Flora', 'Yarranton', 1, 1, 'yh33ts4', '/images/profile/wrtpmizeplxfi6752043.jpg', '3159152942');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jennee', 'Altofts', 1, 1, 'jk95yq4', '/images/profile/bhgwdkvyictau2018456.jpg', '3107747024');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lorianna', 'Baudry', 1, 1, 'we04zt1', '/images/profile/yecqmebtfjxva3609663.jpg', '3100331332');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dilan', 'Fessier', 1, 1, 'zy36jf5', '/images/profile/hezysjgawhwur5946070.jpg', '3146986941');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nils', 'Maidstone', 1, 1, 'hc37pm6', '/images/profile/gfvueyxtmaoou9550294.jpg', '3115030227');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Evyn', 'Seares', 1, 1, 'wh06do0', '/images/profile/bxhheksfhdwxk4243573.jpg', '3127057334');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Waverley', 'Kilfeather', 1, 1, 'pu12bd6', '/images/profile/dspeizxubdibm8411799.jpg', '3103074428');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Allianora', 'Heathcott', 1, 1, 'tw08pd4', '/images/profile/glfflowvvjwsm2332525.jpg', '3175413166');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Thadeus', 'Fibbings', 1, 1, 'tz67nb1', '/images/profile/ahjduelcawuck8567806.jpg', '3138902437');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Clemence', 'Praton', 1, 1, 'sl17eq1', '/images/profile/koybxsyznfean0579338.jpg', '3170253039');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Giuseppe', 'Wedmore', 1, 1, 'bs35ik6', '/images/profile/aoblnuflndjxq7362938.jpg', '3153609159');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Waldemar', 'Doughty', 1, 1, 'ro21qa8', '/images/profile/tcfijtodihixx0504356.jpg', '3152545886');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Buddy', 'Brigden', 1, 1, 'vc03go5', '/images/profile/rekomydylkljr9015521.jpg', '3123909373');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ashleigh', 'Scohier', 1, 1, 'wf92xv0', '/images/profile/seuqemhnlhbgj3265956.jpg', '3147370381');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Saba', 'Lavens', 1, 1, 'fj98yc2', '/images/profile/pkysjpyhsaicu1242951.jpg', '3175941847');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Karlene', 'Cleal', 1, 1, 'bp41au7', '/images/profile/zimgbzrxorshj2257767.jpg', '3198383720');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Patti', 'Pattemore', 1, 1, 'vh17ld7', '/images/profile/eairuhccvluau6194314.jpg', '3166523157');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Brinn', 'Grestie', 1, 1, 'dt56ko1', '/images/profile/ctvloktqchdtt7681555.jpg', '3110662873');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Alysa', 'Dahler', 1, 1, 'gt00sk7', '/images/profile/qetfnxbaivpsx4345910.jpg', '3193042310');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Michel', 'Chazette', 1, 1, 'lh10ue1', '/images/profile/bfoavcdbyngco7956560.jpg', '3168597583');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jeanie', 'Cripps', 1, 1, 'zg11uu8', '/images/profile/gzgvlkkkycbub4814597.jpg', '3170154789');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Beck', 'Feaver', 1, 1, 'ny47qc8', '/images/profile/vrroyjzsnkcdr4514768.jpg', '3152657404');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bryanty', 'Fuzzens', 1, 1, 'lp53px7', '/images/profile/xwioqccxvhtqb4231653.jpg', '3165140639');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Steffi', 'Abbot', 1, 1, 'ec61it7', '/images/profile/pebnzlivpetlx4877137.jpg', '3143102566');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Christoffer', 'Tidcomb', 1, 1, 'bh82ub1', '/images/profile/fylrgvjliqlca3647307.jpg', '3175314902');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Colman', 'Giggs', 1, 1, 'hk93mg5', '/images/profile/jtjevtagyycnv0229162.jpg', '3179816626');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Skippie', 'Duding', 1, 1, 'th30ux2', '/images/profile/ukktkhipwfewx8569227.jpg', '3145829683');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Arielle', 'Dowdell', 1, 1, 'md04oc7', '/images/profile/yyhmxitnwuqpt8694308.jpg', '3117266228');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lucila', 'Malam', 1, 1, 'qt96vu4', '/images/profile/iueardkfmkmpk5011888.jpg', '3198949595');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Retha', 'Najera', 1, 1, 'tj50cf3', '/images/profile/hcdjgetjvegnz8806437.jpg', '3157425060');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Doralynne', 'Canning', 1, 1, 'jj02ge4', '/images/profile/qzqntcptywivk2702249.jpg', '3159086606');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cart', 'Haycox', 1, 1, 'jg08kq8', '/images/profile/jnuxczrgzznme4497804.jpg', '3180786020');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Carlene', 'Grassin', 1, 1, 'wp42hd3', '/images/profile/gxmdnheyoiffr2846119.jpg', '3121444384');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jennine', 'Baud', 1, 1, 'ig97xq4', '/images/profile/edzkietytdffe5964045.jpg', '3114322495');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cathryn', 'Smaile', 1, 1, 'te98fl0', '/images/profile/xxnypqliekhhw2488104.jpg', '3190570897');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Duky', 'Burford', 1, 1, 'bf17no9', '/images/profile/zddbbxhrkwebh3384000.jpg', '3160335018');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tera', 'York', 1, 1, 'pn54gh3', '/images/profile/zvyybhyrecrvx3630335.jpg', '3179277649');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Skippy', 'Delcastel', 1, 1, 'lh41ou8', '/images/profile/prqxhabamdrjm5065600.jpg', '3182738753');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Odelinda', 'Lippatt', 1, 1, 'hy20yc8', '/images/profile/zhcsfzosbmltk4056835.jpg', '3129031849');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Madella', 'Joint', 1, 1, 'kd74qs5', '/images/profile/shtbtstyclptt6789081.jpg', '3139935488');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Melisse', 'Fermer', 1, 1, 'jz59gj0', '/images/profile/ilxrebbszflng5576629.jpg', '3132463680');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Buddy', 'Shackel', 1, 1, 'ph29me9', '/images/profile/mcurutxllisdc0695589.jpg', '3169452317');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Zora', 'Yewdall', 1, 1, 'sb24yy4', '/images/profile/agqqkaqpcheeo4935912.jpg', '3192905848');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tara', 'Chew', 1, 1, 'ol04xa0', '/images/profile/sjdorozlisgws6176331.jpg', '3118939765');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Walton', 'Goligher', 1, 1, 'so14eu9', '/images/profile/xmpvsncywzzrd7229982.jpg', '3199109819');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Chelsea', 'Safhill', 1, 1, 'ic30gt9', '/images/profile/jnhdinfmwamih7717135.jpg', '3141970383');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bernice', 'Smewings', 1, 1, 'ri61nj9', '/images/profile/gjnuhaldukxqu7635411.jpg', '3126638764');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sherie', 'Rohfsen', 1, 1, 'vn08bg5', '/images/profile/rnnkyxbhkotlu8925327.jpg', '3152878447');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Clarine', 'Perutto', 1, 1, 'si23kw9', '/images/profile/yawpwnptfnkuf2843779.jpg', '3159804656');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'De witt', 'Johann', 1, 1, 'll78as4', '/images/profile/rlryveemyufho0764038.jpg', '3199301760');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Deina', 'Durant', 1, 1, 'ak09sk8', '/images/profile/auhxggdlzgfve3180322.jpg', '3152913120');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Mohandis', 'Brigman', 1, 1, 'cu06vo9', '/images/profile/ghexhmhxmhwhn6757819.jpg', '3111021169');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Isaac', 'Mannooch', 1, 1, 'bd59dv0', '/images/profile/cxvlnpazqqfpr9724330.jpg', '3119933922');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Swen', 'Blueman', 1, 1, 'ms63ol0', '/images/profile/mtgwvpcfpdtpa0847645.jpg', '3108397474');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Tuesday', 'MacSharry', 1, 1, 'yu01qx2', '/images/profile/elbokjxzwyqlc2558605.jpg', '3132576071');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Eachelle', 'Jeyes', 1, 1, 'jh49gn0', '/images/profile/ildvrmnufcdba3450573.jpg', '3139388251');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Johnath', 'Gamett', 1, 1, 'kp46dj0', '/images/profile/emeodgkhistcf5532992.jpg', '3157617866');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Melvyn', 'Fiddeman', 1, 1, 'pm43be9', '/images/profile/sgazhicxddlwr4165053.jpg', '3182034533');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Karena', 'Danat', 1, 1, 'vl99yy9', '/images/profile/mglknxhjaxaun8168177.jpg', '3158596388');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kirby', 'Frankcombe', 1, 1, 'vz27bc8', '/images/profile/glwvxecgeqcpg3976175.jpg', '3102255366');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Shayna', 'Winfindale', 1, 1, 'nj73ng7', '/images/profile/tidmsxlftrsot5735706.jpg', '3114826244');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Dalila', 'Grundell', 1, 1, 'oq90nw7', '/images/profile/zsyijvelengbw7715665.jpg', '3145526252');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aggy', 'Goodridge', 1, 1, 'nv60qx7', '/images/profile/ifmvdxsvcmhkh3503130.jpg', '3141476063');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Marven', 'Knevit', 1, 1, 'it00xa5', '/images/profile/vtbaydwltnofk0368266.jpg', '3105153264');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Hamlen', 'Stockell', 1, 1, 'dx73fu7', '/images/profile/bidnriqsacuge3355780.jpg', '3188769384');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Lowe', 'Muslim', 1, 1, 'in70tv3', '/images/profile/cuxwjsfhftqqi1709121.jpg', '3159864053');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Davy', 'Barritt', 1, 1, 'qq14jv4', '/images/profile/xsqkjtrzxojjz2436349.jpg', '3193220968');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Flossie', 'Snalham', 1, 1, 'pe53yo6', '/images/profile/pbfzoawycnsnr5375647.jpg', '3109372986');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Steffen', 'Sisley', 1, 1, 'qx22me6', '/images/profile/uoghqkphqpvlv3966529.jpg', '3192698432');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Baily', 'Palfrey', 1, 1, 'jg98wp1', '/images/profile/xwmmdocrxjbik7081955.jpg', '3192013757');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Cathy', 'Pettyfer', 1, 1, 'py58hu5', '/images/profile/oquvzjtduhnib9879199.jpg', '3134912657');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Daron', 'McElvogue', 1, 1, 'id38ln9', '/images/profile/mvonnllitojqw6274774.jpg', '3166277978');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Constantine', 'Hedden', 1, 1, 'rq06kw7', '/images/profile/treuyryqgrike9429207.jpg', '3101839257');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ashli', 'De Witt', 1, 1, 'nk06kd6', '/images/profile/wihoqllybqhbq8355289.jpg', '3122048945');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Diann', 'Lighton', 1, 1, 'ev04io4', '/images/profile/mvqabecivppzo4772943.jpg', '3132327617');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Worthington', 'Edleston', 1, 1, 'oj11uf9', '/images/profile/nisbciugtledr4606771.jpg', '3167568165');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Gay', 'Hufton', 1, 1, 'zc91vw1', '/images/profile/qlwqnqqnakfmr7053709.jpg', '3174604952');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Schuyler', 'Tearny', 1, 1, 'cm69ez2', '/images/profile/gukjewydlpknl1788711.jpg', '3106082022');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kerrin', 'Burchell', 1, 1, 'mg00ge7', '/images/profile/cvvxqcuiujatl3369945.jpg', '3182022200');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Danika', 'Callaway', 1, 1, 'jq96gi2', '/images/profile/sdxbistgimhzy1077440.jpg', '3177983501');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Karol', 'Warmington', 1, 1, 'wx71rq3', '/images/profile/mkogwlewbsdkl1984365.jpg', '3104642690');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Urbain', 'Hyndley', 1, 1, 'rs20yg6', '/images/profile/xfaetzpkqejls5694020.jpg', '3100004387');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Fan', 'Vernham', 1, 1, 'xo92lv9', '/images/profile/myvdqyanbrxsq3905593.jpg', '3173331694');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Rafi', 'Luetkemeyers', 1, 1, 'ae96lp4', '/images/profile/hkibrnhqzcibd5017316.jpg', '3185188296');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aloin', 'Mably', 1, 1, 'qi28dx7', '/images/profile/uatigevocklip5286972.jpg', '3156307704');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Babs', 'Alesbrook', 1, 1, 'da78mw2', '/images/profile/uhwsjajwkvyns2793540.jpg', '3180819790');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jackqueline', 'Woodwind', 1, 1, 'xy10uh2', '/images/profile/eiuuhrffyotcf3192337.jpg', '3194484177');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Izak', 'Harfoot', 1, 1, 'na19wr2', '/images/profile/rkniwletvdlmu9505424.jpg', '3101325025');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Vinny', 'Ferran', 1, 1, 'we00tu3', '/images/profile/lxxpiecyfzvnd1799023.jpg', '3129554518');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Almeta', 'Glen', 1, 1, 'kl52ce6', '/images/profile/guihwjwrigcuq3404649.jpg', '3179941434');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Carrissa', 'Rowbottom', 1, 1, 'yt75za0', '/images/profile/aetuqlmsbggcu8470844.jpg', '3167380583');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Elayne', 'Casale', 1, 1, 'is03vj5', '/images/profile/miweffzkgvefa1854982.jpg', '3110436979');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Branden', 'Toffts', 1, 1, 'is17sx9', '/images/profile/cjmlaugcdfrms1150694.jpg', '3123884023');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Catherina', 'Hurlston', 1, 1, 'px57tz8', '/images/profile/jxzirhpxonqgf2479624.jpg', '3185118252');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Aarika', 'O''Boyle', 1, 1, 'og49xr6', '/images/profile/wllqdvlunkmjy8120628.jpg', '3139652815');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Velvet', 'Castelijn', 1, 1, 'ez42po2', '/images/profile/vukryxnugvjgm4622134.jpg', '3163320335');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Bonnee', 'Weymouth', 1, 1, 'lr04km1', '/images/profile/aihayfixmuwmo0006055.jpg', '3157336639');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Ginger', 'Hurdman', 1, 1, 'vr00qf4', '/images/profile/awmpwfqwtfgrq5979091.jpg', '3101525002');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Denys', 'Rentalll', 1, 1, 'me86ri8', '/images/profile/yseglpfrenxup4496509.jpg', '3130230155');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Jocelin', 'Lissimore', 1, 1, 'ig51un0', '/images/profile/rshbziohphigz2066724.jpg', '3132032361');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Berty', 'Magnay', 1, 1, 'me74hz2', '/images/profile/zjprvcyfurofo1279650.jpg', '3181918272');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Sonia', 'Dewes', 1, 1, 'wl31yx0', '/images/profile/nqducoakgwqgv9625407.jpg', '3103673346');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Nataline', 'Petche', 1, 1, 'ng78gd2', '/images/profile/cagzaniordfax8000116.jpg', '3103374542');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Selestina', 'Kanwell', 1, 1, 'lw33fe1', '/images/profile/qzodvrerhjefm8185134.jpg', '3102383011');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Larry', 'Garm', 1, 1, 'ab36nm1', '/images/profile/uqbfgeqhcewdq1914129.jpg', '3138396896');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Saraann', 'Schapero', 1, 1, 'aa88hr3', '/images/profile/ytemhfkubmicw4568342.jpg', '3123808021');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Arly', 'Trevethan', 1, 1, 'rt61ll3', '/images/profile/dtppcivdkqzzg6155631.jpg', '3108870804');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Kriste', 'Waiton', 1, 1, 'ea06qb0', '/images/profile/todmaxmbthesq3243792.jpg', '3164403548');
insert into users (id, name, last_name, city_id, language_id, invite_code, profile_photo, mobile) values (users_sec.NEXTVAL, 'Reginald', 'Kenen', 1, 1, 'tr70xo6', '/images/profile/axgxakpcknygv7841228.jpg', '3157788565');

insert into payment_methods (id, name) values (payment_methods_sec.NEXTVAL, 'Credito Mastercard');

insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 1, 1, '6294-4849-3264-5509', 1, TO_TIMESTAMP('2020-01-17 12:09:04', 'YYYY-MM-DD HH24:MI:SS'), '37839a82a79b5136cf9e70c0ac6fb624');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 2, 1, '7067-2426-8200-8700', 1, TO_TIMESTAMP('2020-11-27 08:02:53', 'YYYY-MM-DD HH24:MI:SS'), '81c9127f4eb53818f73d1b1248f7d3d1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 3, 1, '5281-4583-1751-2257', 1, TO_TIMESTAMP('2021-03-20 09:12:06', 'YYYY-MM-DD HH24:MI:SS'), 'd898dd562f30bb1e055d9f542be6184c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 4, 1, '1069-6785-8116-6703', 1, TO_TIMESTAMP('2019-11-09 19:43:41', 'YYYY-MM-DD HH24:MI:SS'), '477c0711ecd35c6e4386305cd8781c19');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 5, 1, '7414-0523-7721-6711', 1, TO_TIMESTAMP('2021-02-12 21:06:17', 'YYYY-MM-DD HH24:MI:SS'), 'aad56ebe39ffd2e2d45788964f3ae427');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 6, 1, '7079-5954-5205-9238', 1, TO_TIMESTAMP('2021-01-16 11:33:18', 'YYYY-MM-DD HH24:MI:SS'), '56e0c1b6e712ac80e003de1f96fd9268');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 7, 1, '4082-9410-7839-7991', 1, TO_TIMESTAMP('2019-08-25 09:24:46', 'YYYY-MM-DD HH24:MI:SS'), '5c616a9e8186bff1c710090d09a154bc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 8, 1, '4609-4779-2712-5053', 1, TO_TIMESTAMP('2019-09-02 17:06:43', 'YYYY-MM-DD HH24:MI:SS'), '4ecbbb45c2101417829f3083cdebb25f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 9, 1, '8981-4518-4197-5329', 1, TO_TIMESTAMP('2020-12-21 19:02:54', 'YYYY-MM-DD HH24:MI:SS'), '6aaa2c0491140680838fe4af5d8fee09');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 10, 1, '2108-0185-1250-9085', 1, TO_TIMESTAMP('2020-10-15 22:33:03', 'YYYY-MM-DD HH24:MI:SS'), 'fc1b6b50816d6bfb4138567148c9a3f3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 11, 1, '0525-5861-0909-3345', 1, TO_TIMESTAMP('2020-11-14 05:17:41', 'YYYY-MM-DD HH24:MI:SS'), 'ebf1ce03c82fc33e47ef08c83d79630e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 12, 1, '8658-4083-3666-5946', 1, TO_TIMESTAMP('2019-09-29 03:11:21', 'YYYY-MM-DD HH24:MI:SS'), 'ad86957a7e2b2c3c3c2a13dbe22120ae');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 13, 1, '3855-9761-2900-2717', 1, TO_TIMESTAMP('2020-01-15 12:17:07', 'YYYY-MM-DD HH24:MI:SS'), 'b5881d725ccc80f86891e83fbe9696e5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 14, 1, '9239-4305-2247-9137', 1, TO_TIMESTAMP('2020-11-17 10:44:31', 'YYYY-MM-DD HH24:MI:SS'), 'c7f1a48904ffe408c6a6140583843541');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 15, 1, '7821-4851-8564-3467', 1, TO_TIMESTAMP('2020-09-13 00:35:17', 'YYYY-MM-DD HH24:MI:SS'), 'c498d07f2f7aa7a7c456100313f4d2c5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 16, 1, '3569-3719-6714-6046', 1, TO_TIMESTAMP('2020-03-09 04:57:25', 'YYYY-MM-DD HH24:MI:SS'), '8a1ba9a93870f4685474a6e5b4650abf');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 17, 1, '6627-3690-3707-0895', 1, TO_TIMESTAMP('2020-05-12 07:34:37', 'YYYY-MM-DD HH24:MI:SS'), 'a6eef2e9cbba67ad8189060bb1c2147d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 18, 1, '0982-8306-1833-0680', 1, TO_TIMESTAMP('2019-08-30 05:37:44', 'YYYY-MM-DD HH24:MI:SS'), '4b6a0c2735d8feccf722c5117e7009ef');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 19, 1, '5139-8444-2940-3840', 1, TO_TIMESTAMP('2020-11-05 08:29:31', 'YYYY-MM-DD HH24:MI:SS'), '310918522fb53b024ab2521aa579b9ff');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 20, 1, '4900-6733-3505-3411', 1, TO_TIMESTAMP('2020-07-12 22:47:09', 'YYYY-MM-DD HH24:MI:SS'), '1808458636c28fe0614e880930586f1a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 21, 1, '6374-4533-2077-6232', 1, TO_TIMESTAMP('2020-06-17 05:00:18', 'YYYY-MM-DD HH24:MI:SS'), '28b7bc47937f9276bea62c2066414417');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 22, 1, '8857-8835-8046-0967', 1, TO_TIMESTAMP('2021-03-11 08:39:43', 'YYYY-MM-DD HH24:MI:SS'), 'de80e488ee952dc7e5994a2f41ffee3d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 23, 1, '1311-7508-2415-3622', 1, TO_TIMESTAMP('2019-08-24 23:15:30', 'YYYY-MM-DD HH24:MI:SS'), 'a06e679c57f41a94cc74512ca60093da');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 24, 1, '3825-4752-5850-3784', 1, TO_TIMESTAMP('2020-07-16 21:53:57', 'YYYY-MM-DD HH24:MI:SS'), '08ff220f063aca57126951a020573835');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 25, 1, '6058-7564-0282-7693', 1, TO_TIMESTAMP('2020-11-30 00:34:16', 'YYYY-MM-DD HH24:MI:SS'), '8c01efa9c1d617716e12f0050e97b421');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 26, 1, '8292-3865-5935-6514', 1, TO_TIMESTAMP('2020-07-04 23:46:07', 'YYYY-MM-DD HH24:MI:SS'), 'f00c2a8b4492098cdb901c0f6eaed513');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 27, 1, '1995-6905-1401-4370', 1, TO_TIMESTAMP('2020-04-27 17:15:12', 'YYYY-MM-DD HH24:MI:SS'), '8db345a35928f498be3ea80220f825db');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 28, 1, '6355-4703-4241-6692', 1, TO_TIMESTAMP('2019-11-07 08:55:34', 'YYYY-MM-DD HH24:MI:SS'), '2d0c4278a77b3775e4b05a078654cd2c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 29, 1, '4182-0727-1547-2659', 1, TO_TIMESTAMP('2019-12-28 02:31:37', 'YYYY-MM-DD HH24:MI:SS'), '6da5882234b988d8c9a1199615615799');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 30, 1, '6053-3439-6394-4118', 1, TO_TIMESTAMP('2019-08-04 03:25:17', 'YYYY-MM-DD HH24:MI:SS'), 'b3a15a73383dd020bbb54fa656fe1aeb');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 31, 1, '3529-8750-8431-3790', 1, TO_TIMESTAMP('2020-04-19 02:36:52', 'YYYY-MM-DD HH24:MI:SS'), '4d3e2cfa2455f10f6c018457e87db709');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 32, 1, '2214-1032-7878-7222', 1, TO_TIMESTAMP('2019-10-18 05:17:37', 'YYYY-MM-DD HH24:MI:SS'), 'e944d217ecf4f4473b38a44a6ebc5100');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 33, 1, '2151-5207-3774-2276', 1, TO_TIMESTAMP('2020-04-04 16:00:38', 'YYYY-MM-DD HH24:MI:SS'), '93c6372ecb950834171c094c8c2a67fa');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 34, 1, '6635-5792-4652-9215', 1, TO_TIMESTAMP('2020-10-03 15:52:06', 'YYYY-MM-DD HH24:MI:SS'), '4d82ff26e2e73580c7880d11843a17d1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 35, 1, '2473-0048-6732-6156', 1, TO_TIMESTAMP('2020-05-06 19:05:05', 'YYYY-MM-DD HH24:MI:SS'), '25c9853f54defe7a78e82e42aa9d8175');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 36, 1, '5936-4292-4972-5209', 1, TO_TIMESTAMP('2019-12-29 16:42:19', 'YYYY-MM-DD HH24:MI:SS'), '1f813148858a663cd05812d209a17e3c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 37, 1, '2660-2724-2571-7113', 1, TO_TIMESTAMP('2019-08-11 02:10:15', 'YYYY-MM-DD HH24:MI:SS'), 'fcca7b6fb65bb226cace05b0ac8bce33');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 38, 1, '8639-3729-4095-0042', 1, TO_TIMESTAMP('2019-08-28 23:23:21', 'YYYY-MM-DD HH24:MI:SS'), 'f12b4cbbd6c57a44a7aa9e20bbbdaa05');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 39, 1, '1673-4166-3955-5472', 1, TO_TIMESTAMP('2020-06-17 14:35:24', 'YYYY-MM-DD HH24:MI:SS'), '12bd6b739f90007030935be9d264274b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 40, 1, '1059-4026-2807-1204', 1, TO_TIMESTAMP('2020-04-03 01:43:29', 'YYYY-MM-DD HH24:MI:SS'), 'deb38ba9d3eed298ce7e2a54a12fc4fd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 41, 1, '9285-6469-0685-8940', 1, TO_TIMESTAMP('2020-09-10 00:02:28', 'YYYY-MM-DD HH24:MI:SS'), 'd7b17b33ecd5a4d272c2d393ff4d6bc6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 42, 1, '7642-8870-7058-8104', 1, TO_TIMESTAMP('2020-10-01 12:14:50', 'YYYY-MM-DD HH24:MI:SS'), 'a627516fe04d1f2f60db93af0b865448');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 43, 1, '5911-6316-0270-8381', 1, TO_TIMESTAMP('2019-12-09 22:49:06', 'YYYY-MM-DD HH24:MI:SS'), '4305f945fcbd058d319f489b6052290a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 44, 1, '7964-4446-4867-1971', 1, TO_TIMESTAMP('2019-08-02 09:39:03', 'YYYY-MM-DD HH24:MI:SS'), '59a95ca9fadba285041871c0b18b0f82');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 45, 1, '6206-9587-9056-7597', 1, TO_TIMESTAMP('2020-03-16 11:39:56', 'YYYY-MM-DD HH24:MI:SS'), '3a5ec0945ec0c7e0aad3e3b84064ba60');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 46, 1, '8190-6881-8858-9039', 1, TO_TIMESTAMP('2020-05-29 07:14:05', 'YYYY-MM-DD HH24:MI:SS'), '228a699e07188c1d8f4ff5ad5b175d27');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 47, 1, '9091-6793-1212-4907', 1, TO_TIMESTAMP('2021-01-29 20:16:46', 'YYYY-MM-DD HH24:MI:SS'), '39b0ed30b999e8ae390e03d24043149f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 48, 1, '2133-1955-7631-3377', 1, TO_TIMESTAMP('2019-10-03 13:47:10', 'YYYY-MM-DD HH24:MI:SS'), 'a436dd8ac0b9487d64cc57d10c682c53');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 49, 1, '4182-5232-9703-4500', 1, TO_TIMESTAMP('2020-02-29 23:28:17', 'YYYY-MM-DD HH24:MI:SS'), '5683d66db512baad743374af56dc3291');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 50, 1, '4136-6675-0812-1709', 1, TO_TIMESTAMP('2019-08-05 18:03:54', 'YYYY-MM-DD HH24:MI:SS'), '6d74f0090f14997f46200b623c513980');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 51, 1, '9761-3864-2156-0621', 1, TO_TIMESTAMP('2020-07-13 08:04:39', 'YYYY-MM-DD HH24:MI:SS'), '903e0e450505112e88e5de081481ac60');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 52, 1, '9170-7051-8516-2119', 1, TO_TIMESTAMP('2020-09-11 18:56:58', 'YYYY-MM-DD HH24:MI:SS'), '737d26a190549a530bd7e7eac4025835');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 53, 1, '5736-2553-5864-8004', 1, TO_TIMESTAMP('2021-03-26 07:12:10', 'YYYY-MM-DD HH24:MI:SS'), '9af0cffd33dc21c26eca09234406e4f2');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 54, 1, '8293-5913-2330-4334', 1, TO_TIMESTAMP('2021-02-21 14:03:37', 'YYYY-MM-DD HH24:MI:SS'), '09d89d5d21e06f9fac51923b0415adee');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 55, 1, '7498-8812-7300-3316', 1, TO_TIMESTAMP('2020-04-10 15:52:24', 'YYYY-MM-DD HH24:MI:SS'), '2cc150e7639114d5e9f48d631681bd07');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 56, 1, '3451-6474-8396-8002', 1, TO_TIMESTAMP('2020-09-26 13:04:37', 'YYYY-MM-DD HH24:MI:SS'), 'd38f4f135731a950a9e53e1ef84b0e88');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 57, 1, '0928-8454-3649-1678', 1, TO_TIMESTAMP('2020-06-24 04:44:53', 'YYYY-MM-DD HH24:MI:SS'), 'b127db0d0e0a3d58bd1efea49cb56efc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 58, 1, '1355-4285-9730-6821', 1, TO_TIMESTAMP('2019-09-02 12:50:47', 'YYYY-MM-DD HH24:MI:SS'), '165515a0c65088d4621dc38ac635e918');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 59, 1, '6118-7244-6153-7267', 1, TO_TIMESTAMP('2019-11-03 22:42:18', 'YYYY-MM-DD HH24:MI:SS'), '5ed851ef560a4a9cf8f034902a41fe18');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 60, 1, '3861-8167-9675-0102', 1, TO_TIMESTAMP('2020-05-06 13:31:37', 'YYYY-MM-DD HH24:MI:SS'), 'a06a2056b4be41432dc5e81448f419c7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 61, 1, '1142-2118-8943-6725', 1, TO_TIMESTAMP('2019-10-06 06:28:06', 'YYYY-MM-DD HH24:MI:SS'), '9198df2644f01e1ec8038931a6b301a5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 62, 1, '5075-2793-9551-2415', 1, TO_TIMESTAMP('2020-05-21 09:13:30', 'YYYY-MM-DD HH24:MI:SS'), 'b7b2688f544913730fe8141dd1d37d68');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 63, 1, '6651-2041-2939-9764', 1, TO_TIMESTAMP('2020-09-01 01:49:15', 'YYYY-MM-DD HH24:MI:SS'), '45b5293b1e52246ed02dc52406157e37');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 64, 1, '1678-6934-3069-3992', 1, TO_TIMESTAMP('2020-04-02 12:34:04', 'YYYY-MM-DD HH24:MI:SS'), 'a3d6990dd2d641ec64dd275c197ef8e3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 65, 1, '6037-7761-8912-2730', 1, TO_TIMESTAMP('2019-08-08 05:07:53', 'YYYY-MM-DD HH24:MI:SS'), '26bd896c37a60c9fd9f9ed001c08bb3b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 66, 1, '9691-8524-4791-0791', 1, TO_TIMESTAMP('2021-02-06 14:50:12', 'YYYY-MM-DD HH24:MI:SS'), '1d7cfaf6fcdd15031e5d21196fa15a1a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 67, 1, '7217-0982-2260-3568', 1, TO_TIMESTAMP('2020-03-12 18:23:47', 'YYYY-MM-DD HH24:MI:SS'), '2a4539459dfb1b1eb18b0e0e2d665e57');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 68, 1, '4920-5547-1104-3662', 1, TO_TIMESTAMP('2019-10-16 08:59:27', 'YYYY-MM-DD HH24:MI:SS'), '3f744f49bdcc25ac8f5f9431696af2ed');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 69, 1, '1632-2801-1174-1811', 1, TO_TIMESTAMP('2020-03-05 08:00:05', 'YYYY-MM-DD HH24:MI:SS'), 'f29ba4235685d753f60945f85fe971db');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 70, 1, '6490-4552-4188-8867', 1, TO_TIMESTAMP('2019-08-22 04:57:55', 'YYYY-MM-DD HH24:MI:SS'), '288bae9cb8fac27c32cfa144a741e47b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 71, 1, '4763-7891-7291-6559', 1, TO_TIMESTAMP('2020-02-18 03:00:34', 'YYYY-MM-DD HH24:MI:SS'), '562f1eec6d69e4a364ac8f6101b12e66');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 72, 1, '7742-2678-1306-9412', 1, TO_TIMESTAMP('2020-11-27 10:36:34', 'YYYY-MM-DD HH24:MI:SS'), '572406b95ecfa414c17e4084413f31e3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 73, 1, '8716-4030-5472-5280', 1, TO_TIMESTAMP('2019-09-04 22:52:57', 'YYYY-MM-DD HH24:MI:SS'), '3d52dfd71f958cbcb13a5d2bd3a48b50');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 74, 1, '8146-8859-1640-3762', 1, TO_TIMESTAMP('2020-06-23 20:18:19', 'YYYY-MM-DD HH24:MI:SS'), '039993d8eb91c522e4d81e7f16c74cde');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 75, 1, '8441-8300-9625-3252', 1, TO_TIMESTAMP('2020-04-22 18:50:15', 'YYYY-MM-DD HH24:MI:SS'), 'c78314bbcd64a56bd5af4503d987cc4a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 76, 1, '7026-9191-7478-2281', 1, TO_TIMESTAMP('2020-09-05 16:51:36', 'YYYY-MM-DD HH24:MI:SS'), '6140ede7b7c47ccb5f866bf35b0e3d5a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 77, 1, '4109-7182-1465-7915', 1, TO_TIMESTAMP('2020-10-21 08:00:37', 'YYYY-MM-DD HH24:MI:SS'), '96d681dd47ab2ffc7922bd0b4dd64732');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 78, 1, '6435-3429-6134-0667', 1, TO_TIMESTAMP('2021-03-23 04:57:48', 'YYYY-MM-DD HH24:MI:SS'), '97351dcca59ec3534b46ee1cbe0d0c77');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 79, 1, '3691-1872-0123-9602', 1, TO_TIMESTAMP('2019-10-12 07:16:29', 'YYYY-MM-DD HH24:MI:SS'), 'f49279a4e5d7e18836298b7212e3e408');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 80, 1, '0285-2035-5876-7027', 1, TO_TIMESTAMP('2020-02-12 07:43:22', 'YYYY-MM-DD HH24:MI:SS'), 'b6a3f7fd4a2941fdd10b52a8f80fbd3d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 81, 1, '2697-8868-6030-5101', 1, TO_TIMESTAMP('2021-03-19 02:03:50', 'YYYY-MM-DD HH24:MI:SS'), '44ff857c1170e84f889a15421d61904e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 82, 1, '4461-4254-3449-7291', 1, TO_TIMESTAMP('2020-09-17 18:14:35', 'YYYY-MM-DD HH24:MI:SS'), '40589203b2de3d64f46fb745cb1874c9');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 83, 1, '8543-5753-6083-8927', 1, TO_TIMESTAMP('2021-03-26 04:17:51', 'YYYY-MM-DD HH24:MI:SS'), 'faa547dca1b38ec981fabdfc3b1579a1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 84, 1, '0676-9528-5615-1821', 1, TO_TIMESTAMP('2020-10-09 12:59:11', 'YYYY-MM-DD HH24:MI:SS'), '157ef59496e89c005fce1d42621577a6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 85, 1, '8739-4554-7454-2327', 1, TO_TIMESTAMP('2021-01-29 16:57:58', 'YYYY-MM-DD HH24:MI:SS'), '30de4205c359ecfc8c696dae7cba13cd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 86, 1, '2543-0050-5218-7654', 1, TO_TIMESTAMP('2019-12-10 06:03:55', 'YYYY-MM-DD HH24:MI:SS'), '18cf2362e875eaa167976c1033f8ff85');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 87, 1, '5242-9392-7482-5106', 1, TO_TIMESTAMP('2020-05-12 09:20:27', 'YYYY-MM-DD HH24:MI:SS'), 'dde8c880db8137b1237c605a79da600e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 88, 1, '8972-6971-9761-0765', 1, TO_TIMESTAMP('2019-12-28 03:45:23', 'YYYY-MM-DD HH24:MI:SS'), '247d2430cb95ab0ad7cf127adcd128dd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 89, 1, '4361-8406-9177-7518', 1, TO_TIMESTAMP('2020-02-22 21:57:31', 'YYYY-MM-DD HH24:MI:SS'), '271727a48fb7e0a31e8b2747a6e43f43');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 90, 1, '8696-3214-8760-5362', 1, TO_TIMESTAMP('2020-10-09 05:32:13', 'YYYY-MM-DD HH24:MI:SS'), '010be1cbb6d0701e206815fda44adbd3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 91, 1, '4193-3498-7607-3717', 1, TO_TIMESTAMP('2020-12-04 16:56:54', 'YYYY-MM-DD HH24:MI:SS'), '1b5118b3c3e0732a9fc2e24ada3fc550');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 92, 1, '8778-0280-8907-9039', 1, TO_TIMESTAMP('2020-12-22 18:44:55', 'YYYY-MM-DD HH24:MI:SS'), 'f0d5cc523c13bb8ad38f11e9704dd354');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 93, 1, '7167-4556-7627-2445', 1, TO_TIMESTAMP('2020-10-09 08:35:21', 'YYYY-MM-DD HH24:MI:SS'), 'bc54eaf8326e0f344834385e6ec4fd6e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 94, 1, '6530-1798-9204-0775', 1, TO_TIMESTAMP('2019-08-12 12:25:29', 'YYYY-MM-DD HH24:MI:SS'), '25d07de25deaa3bfcf13c5aeab3c6bba');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 95, 1, '4592-5369-4647-0365', 1, TO_TIMESTAMP('2020-07-05 12:46:24', 'YYYY-MM-DD HH24:MI:SS'), '18a4475b1d6102b3623511ebc2ef825f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 96, 1, '1564-8476-0071-3773', 1, TO_TIMESTAMP('2020-08-14 07:57:24', 'YYYY-MM-DD HH24:MI:SS'), '92c68f6b60caee174f2f09fbdd89fdbc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 97, 1, '6087-2204-0688-6898', 1, TO_TIMESTAMP('2020-08-09 16:39:11', 'YYYY-MM-DD HH24:MI:SS'), '85fd99e1af1a53430eb534c280c8222f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 98, 1, '9359-1808-9083-6126', 1, TO_TIMESTAMP('2021-03-19 02:48:36', 'YYYY-MM-DD HH24:MI:SS'), '86912ae90be8b0e7b845bc8ab84a019d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 99, 1, '1247-1320-5937-0068', 1, TO_TIMESTAMP('2019-07-21 13:03:02', 'YYYY-MM-DD HH24:MI:SS'), '1d7dbf2ed168358185e619de96f27886');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 100, 1, '5159-4848-2364-9633', 1, TO_TIMESTAMP('2020-05-31 13:34:21', 'YYYY-MM-DD HH24:MI:SS'), '77ab84e9381850757ccbae441fd05edf');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 101, 1, '1647-6864-1132-4413', 1, TO_TIMESTAMP('2019-10-19 04:30:39', 'YYYY-MM-DD HH24:MI:SS'), 'ac04dcd73b096d8809cf9e1e35300e22');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 102, 1, '9168-4303-3108-5709', 1, TO_TIMESTAMP('2019-08-04 02:29:56', 'YYYY-MM-DD HH24:MI:SS'), '04dda2fe78693ac7e5f37cbd26e8d289');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 103, 1, '5541-2212-0183-9677', 1, TO_TIMESTAMP('2021-01-17 17:48:35', 'YYYY-MM-DD HH24:MI:SS'), 'a0afe5f9bb63b49c03783a1269907e8d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 104, 1, '5328-1111-3709-8916', 1, TO_TIMESTAMP('2020-07-31 09:15:58', 'YYYY-MM-DD HH24:MI:SS'), '8e3db8919d60a7a0caab9845ca4b3364');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 105, 1, '2475-7121-1894-4265', 1, TO_TIMESTAMP('2019-10-09 00:04:46', 'YYYY-MM-DD HH24:MI:SS'), '63fc6b71345358699e58c42c6f4f9c73');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 106, 1, '6727-8177-7267-3751', 1, TO_TIMESTAMP('2020-12-23 22:57:07', 'YYYY-MM-DD HH24:MI:SS'), 'b6b1e9280669614f6a168a576d54b2e7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 107, 1, '3660-0442-0938-7430', 1, TO_TIMESTAMP('2020-10-10 06:08:18', 'YYYY-MM-DD HH24:MI:SS'), '15e1bc24ac228df6413a04aca72e9350');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 108, 1, '7282-1760-7272-6256', 1, TO_TIMESTAMP('2019-09-10 08:22:26', 'YYYY-MM-DD HH24:MI:SS'), 'b50ee990ab94e5b3af82117fa646e894');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 109, 1, '2891-6926-5723-1752', 1, TO_TIMESTAMP('2020-08-27 07:13:48', 'YYYY-MM-DD HH24:MI:SS'), 'ae24630b82865652c6ae2015bd9e611e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 110, 1, '2072-9189-3502-2968', 1, TO_TIMESTAMP('2020-06-28 23:49:23', 'YYYY-MM-DD HH24:MI:SS'), '9bd5eef1656077858b4f5e7597918492');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 111, 1, '4142-5833-0165-8936', 1, TO_TIMESTAMP('2020-10-23 17:59:35', 'YYYY-MM-DD HH24:MI:SS'), 'c364f1f5e0898f9ca2bfc9ef4c01d5c1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 112, 1, '1852-0782-2490-8571', 1, TO_TIMESTAMP('2020-09-10 16:48:54', 'YYYY-MM-DD HH24:MI:SS'), '0eefebb31e8e24f2d2f4e49bd3ae59b6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 113, 1, '5879-7274-0451-4427', 1, TO_TIMESTAMP('2021-02-19 12:11:18', 'YYYY-MM-DD HH24:MI:SS'), 'a8b17fa2d480d5ba3a92dcdfebffd217');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 114, 1, '2619-7917-8478-7043', 1, TO_TIMESTAMP('2021-03-01 19:37:19', 'YYYY-MM-DD HH24:MI:SS'), 'b116a8d226e423c4e215e09be89e73ba');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 115, 1, '4610-1595-2315-5233', 1, TO_TIMESTAMP('2020-06-12 23:17:05', 'YYYY-MM-DD HH24:MI:SS'), '167fd82bd082c8ea0889a072a2ecec14');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 116, 1, '2580-1746-4971-8465', 1, TO_TIMESTAMP('2019-08-22 07:02:41', 'YYYY-MM-DD HH24:MI:SS'), '543f209769c1e792dd99ef1e6ab8d9f6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 117, 1, '8779-9969-0985-1896', 1, TO_TIMESTAMP('2019-09-08 11:41:54', 'YYYY-MM-DD HH24:MI:SS'), 'e4ff7ed3867bd06cec380b987c43e338');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 118, 1, '8597-5504-1973-2253', 1, TO_TIMESTAMP('2019-12-13 13:59:40', 'YYYY-MM-DD HH24:MI:SS'), 'b6ef8ca925762a8ca2049fbee7a526ab');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 119, 1, '6080-3994-8773-5434', 1, TO_TIMESTAMP('2020-08-13 19:18:28', 'YYYY-MM-DD HH24:MI:SS'), '4996bbd4c5729decc47ba85930ad0566');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 120, 1, '3748-2926-0250-9210', 1, TO_TIMESTAMP('2020-06-15 11:49:39', 'YYYY-MM-DD HH24:MI:SS'), 'd9aeac3d2595e07289ad9fd5268ac0de');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 121, 1, '3127-5055-4042-2666', 1, TO_TIMESTAMP('2019-08-22 09:30:06', 'YYYY-MM-DD HH24:MI:SS'), '26163578a27f9341931ba8dc086bb15a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 122, 1, '8269-0362-2713-3403', 1, TO_TIMESTAMP('2019-09-04 06:42:17', 'YYYY-MM-DD HH24:MI:SS'), '5048ba658550537399ea9fdfa6bff980');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 123, 1, '0633-1933-5925-6021', 1, TO_TIMESTAMP('2019-12-20 10:13:42', 'YYYY-MM-DD HH24:MI:SS'), 'a6fda1542334a13bb78351fad9a72c92');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 124, 1, '8795-9402-6880-4591', 1, TO_TIMESTAMP('2020-08-18 08:06:16', 'YYYY-MM-DD HH24:MI:SS'), '594bec362d8129ae813444ad6dd95de7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 125, 1, '6430-6862-6978-6445', 1, TO_TIMESTAMP('2021-03-18 14:53:33', 'YYYY-MM-DD HH24:MI:SS'), '078febb3f6c132630db388d621a45f96');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 126, 1, '5797-0740-3526-4386', 1, TO_TIMESTAMP('2020-12-09 03:55:07', 'YYYY-MM-DD HH24:MI:SS'), '7028b50a200d78f6ff3c23877eba38d6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 127, 1, '5715-9370-7068-0340', 1, TO_TIMESTAMP('2020-12-27 04:48:44', 'YYYY-MM-DD HH24:MI:SS'), 'd7a9df84450c228a973aab1d544bc71d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 128, 1, '2354-1639-8205-1981', 1, TO_TIMESTAMP('2020-08-07 01:57:15', 'YYYY-MM-DD HH24:MI:SS'), '581ef86641d1202d030fe989c0cab595');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 129, 1, '4648-3500-4948-4649', 1, TO_TIMESTAMP('2019-12-14 11:16:05', 'YYYY-MM-DD HH24:MI:SS'), 'ac12d450df7d0b620642cf4e02bdf779');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 130, 1, '1586-0070-3163-1352', 1, TO_TIMESTAMP('2019-11-03 09:43:22', 'YYYY-MM-DD HH24:MI:SS'), 'c9978e927d8153986528571f8171c5b0');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 131, 1, '0488-7968-5696-6999', 1, TO_TIMESTAMP('2020-12-23 12:51:31', 'YYYY-MM-DD HH24:MI:SS'), '0b7c3336a64428ec00f9d57620f21409');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 132, 1, '4426-5551-4479-9414', 1, TO_TIMESTAMP('2019-12-08 13:33:42', 'YYYY-MM-DD HH24:MI:SS'), 'dc54fcfa7a09963762d2dc40a623552c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 133, 1, '4599-9730-8620-9593', 1, TO_TIMESTAMP('2019-10-17 00:11:54', 'YYYY-MM-DD HH24:MI:SS'), '5de80f523020c4751d4f001072104913');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 134, 1, '1213-4555-7620-5498', 1, TO_TIMESTAMP('2020-09-04 16:16:44', 'YYYY-MM-DD HH24:MI:SS'), 'a8699c1a32e4a1c27526e1c3547e4640');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 135, 1, '8355-7371-1849-1633', 1, TO_TIMESTAMP('2020-03-24 07:46:06', 'YYYY-MM-DD HH24:MI:SS'), 'e78e1fb553a8b39589e9482448a521b0');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 136, 1, '4907-7590-8299-1442', 1, TO_TIMESTAMP('2019-08-04 02:30:56', 'YYYY-MM-DD HH24:MI:SS'), '054c0c0ae0512407e65e3d015833fe76');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 137, 1, '9675-3308-5015-3845', 1, TO_TIMESTAMP('2019-08-22 03:26:45', 'YYYY-MM-DD HH24:MI:SS'), 'e5995b91594b0b445155dcf87dcbde7a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 138, 1, '6730-4786-1619-6286', 1, TO_TIMESTAMP('2020-08-30 22:50:35', 'YYYY-MM-DD HH24:MI:SS'), 'a4f19918cf4e673d29db65879445671b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 139, 1, '4345-2400-9112-6165', 1, TO_TIMESTAMP('2020-04-06 06:56:02', 'YYYY-MM-DD HH24:MI:SS'), 'a305d60d61b7a0b2409604ed0908874f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 140, 1, '4286-3483-5704-4525', 1, TO_TIMESTAMP('2020-04-26 01:48:34', 'YYYY-MM-DD HH24:MI:SS'), 'f94bb27fc437514facb77f2462ab0d73');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 141, 1, '6829-7892-4179-6311', 1, TO_TIMESTAMP('2020-03-02 23:36:51', 'YYYY-MM-DD HH24:MI:SS'), '80f10240beaceb752cc1a8b333c768e4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 142, 1, '0601-6035-5894-2330', 1, TO_TIMESTAMP('2020-08-17 15:59:54', 'YYYY-MM-DD HH24:MI:SS'), 'be189b296038cea516b8c9f615d9624e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 143, 1, '7958-0537-1298-3087', 1, TO_TIMESTAMP('2020-01-22 19:04:21', 'YYYY-MM-DD HH24:MI:SS'), '4e1b324cf12009e6d02caa562682f40c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 144, 1, '3592-0253-1038-7759', 1, TO_TIMESTAMP('2020-06-26 21:56:25', 'YYYY-MM-DD HH24:MI:SS'), '5ceacef6b192a25dfc918bf724d61206');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 145, 1, '2731-4914-8585-3309', 1, TO_TIMESTAMP('2019-10-26 13:35:18', 'YYYY-MM-DD HH24:MI:SS'), '09c5216158baa0d886a4528a46cb0408');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 146, 1, '5989-4546-6571-1989', 1, TO_TIMESTAMP('2020-09-15 07:18:17', 'YYYY-MM-DD HH24:MI:SS'), '50fae5f4c4d2b9eb9273b9bc51a1fbe4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 147, 1, '8505-4937-1312-8760', 1, TO_TIMESTAMP('2020-06-06 22:21:34', 'YYYY-MM-DD HH24:MI:SS'), 'b920d05474cf4588c08c81b4f985edc2');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 148, 1, '6661-8526-2862-9399', 1, TO_TIMESTAMP('2020-10-11 09:32:18', 'YYYY-MM-DD HH24:MI:SS'), 'b56b0704fbf466cbc3577d830d21d0a7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 149, 1, '9250-4378-8572-8381', 1, TO_TIMESTAMP('2020-03-20 12:59:29', 'YYYY-MM-DD HH24:MI:SS'), '7b32a31bad07e1d31e7a52de347882d9');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 150, 1, '7613-0652-4742-5620', 1, TO_TIMESTAMP('2019-08-30 19:24:30', 'YYYY-MM-DD HH24:MI:SS'), 'a47f9a210e23672d3a824a45d98e792f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 151, 1, '5681-9131-1600-6118', 1, TO_TIMESTAMP('2020-10-13 02:10:37', 'YYYY-MM-DD HH24:MI:SS'), '7fd31444c9b47d146dc72091ea6dff77');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 152, 1, '0300-7906-0626-1471', 1, TO_TIMESTAMP('2020-01-21 11:49:11', 'YYYY-MM-DD HH24:MI:SS'), '33ce85b1e2a67262f3bf86858e391e60');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 153, 1, '9633-8819-8255-0481', 1, TO_TIMESTAMP('2019-09-04 23:47:30', 'YYYY-MM-DD HH24:MI:SS'), 'b15b6f3aa7fa99721e72ca38e7144945');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 154, 1, '2256-9329-6163-3395', 1, TO_TIMESTAMP('2020-12-27 06:12:11', 'YYYY-MM-DD HH24:MI:SS'), '30d5e91b33a8fffffa45d730c8a71e06');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 155, 1, '3532-7866-0805-3144', 1, TO_TIMESTAMP('2020-01-27 21:22:50', 'YYYY-MM-DD HH24:MI:SS'), '8c88c4690608ec5616d2636ac80cd388');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 156, 1, '5304-0607-0785-5063', 1, TO_TIMESTAMP('2020-03-13 07:54:13', 'YYYY-MM-DD HH24:MI:SS'), '498083b74c97e46565cb3a58649c80db');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 157, 1, '7528-1798-7358-7630', 1, TO_TIMESTAMP('2020-10-06 11:08:49', 'YYYY-MM-DD HH24:MI:SS'), 'ae9ffb2d4058c7c31b50f6f55806a65e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 158, 1, '1152-8913-9765-2375', 1, TO_TIMESTAMP('2020-09-26 05:07:13', 'YYYY-MM-DD HH24:MI:SS'), '4be415a1ebf68038ef59785ed26cb027');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 159, 1, '8003-8137-6657-5687', 1, TO_TIMESTAMP('2020-09-19 19:29:27', 'YYYY-MM-DD HH24:MI:SS'), '344f182e493ff981676b0adcf85718cf');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 160, 1, '7070-6468-7730-4483', 1, TO_TIMESTAMP('2019-12-21 06:55:30', 'YYYY-MM-DD HH24:MI:SS'), '46f98e0669c9574e7494d87ca4dfa86e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 161, 1, '6872-7429-0944-7908', 1, TO_TIMESTAMP('2020-09-27 23:10:27', 'YYYY-MM-DD HH24:MI:SS'), 'fceb1c5dd37a9dcd11850dab899f55bd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 162, 1, '8025-9013-0937-1186', 1, TO_TIMESTAMP('2019-08-02 08:02:53', 'YYYY-MM-DD HH24:MI:SS'), 'd5d26f55f950deebe2f58b140f64660a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 163, 1, '5243-5614-0129-1947', 1, TO_TIMESTAMP('2019-10-23 11:28:32', 'YYYY-MM-DD HH24:MI:SS'), '3b2b02529d595369803dbbfb033bcf97');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 164, 1, '0951-6760-6998-0097', 1, TO_TIMESTAMP('2020-06-07 23:26:34', 'YYYY-MM-DD HH24:MI:SS'), 'e5a5a516658206750d13686ea1106a6a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 165, 1, '7988-0118-7277-6933', 1, TO_TIMESTAMP('2021-02-28 07:16:06', 'YYYY-MM-DD HH24:MI:SS'), 'ad3b5d85671961eb269fd5489efc0b46');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 166, 1, '8779-4490-3606-3865', 1, TO_TIMESTAMP('2020-08-11 03:55:17', 'YYYY-MM-DD HH24:MI:SS'), '0912a2378a7819a75514b981519f1e2e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 167, 1, '4317-9295-4313-0155', 1, TO_TIMESTAMP('2019-09-14 13:20:03', 'YYYY-MM-DD HH24:MI:SS'), 'f4e3fda20143bc97ed634d28f26fed0c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 168, 1, '7864-3817-5378-4913', 1, TO_TIMESTAMP('2021-03-26 14:21:46', 'YYYY-MM-DD HH24:MI:SS'), 'a03ab1557a4fc792d1bf949f5031c17e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 169, 1, '2967-0958-1497-4063', 1, TO_TIMESTAMP('2019-07-21 07:10:36', 'YYYY-MM-DD HH24:MI:SS'), '48b89c6c1600ff53c5e26fe7e17c53ec');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 170, 1, '0120-4083-4687-0487', 1, TO_TIMESTAMP('2019-11-01 02:29:00', 'YYYY-MM-DD HH24:MI:SS'), '86f79e94f30f84de1e81a9fca98bbe1b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 171, 1, '0554-0398-4728-9690', 1, TO_TIMESTAMP('2019-12-18 15:23:21', 'YYYY-MM-DD HH24:MI:SS'), '47c9fdc5db4ac86bb73b70df1934bb44');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 172, 1, '9534-3997-7941-6039', 1, TO_TIMESTAMP('2019-12-07 12:54:25', 'YYYY-MM-DD HH24:MI:SS'), 'ccbf2e0c0ba8dbcb88673ca6674dc67a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 173, 1, '2167-2640-6655-1490', 1, TO_TIMESTAMP('2019-10-09 03:11:58', 'YYYY-MM-DD HH24:MI:SS'), '63a55d10480c6a0bbc383a7a46b2868f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 174, 1, '3071-6988-7844-0646', 1, TO_TIMESTAMP('2020-05-18 01:38:14', 'YYYY-MM-DD HH24:MI:SS'), '1470ee7dd392863cd702d3a0a8eeecb7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 175, 1, '5622-0533-5108-5590', 1, TO_TIMESTAMP('2020-11-05 04:19:43', 'YYYY-MM-DD HH24:MI:SS'), '17dcfd9a226f82dfc1bf4f4f3e99a204');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 176, 1, '6419-7865-6979-2772', 1, TO_TIMESTAMP('2020-09-17 21:45:22', 'YYYY-MM-DD HH24:MI:SS'), '13cd92a66581f356bf3f03b20457c983');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 177, 1, '4375-4906-8211-9488', 1, TO_TIMESTAMP('2020-07-23 20:18:33', 'YYYY-MM-DD HH24:MI:SS'), '584c9e3e97f82ab2e06d4095e42f6fe3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 178, 1, '3864-0136-1663-2231', 1, TO_TIMESTAMP('2021-03-19 11:27:10', 'YYYY-MM-DD HH24:MI:SS'), '8e85afe65ff03f2a5bf300a4fc3d8ffd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 179, 1, '6029-9261-5942-9953', 1, TO_TIMESTAMP('2019-09-30 12:09:07', 'YYYY-MM-DD HH24:MI:SS'), '7b32b987fb5af7d0990c7ae1a1f8ae07');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 180, 1, '9569-1269-1231-7461', 1, TO_TIMESTAMP('2019-07-27 20:36:45', 'YYYY-MM-DD HH24:MI:SS'), '81d0f6cbbad862e906dcd177ef858cdd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 181, 1, '0316-8339-2597-4451', 1, TO_TIMESTAMP('2020-02-25 23:13:17', 'YYYY-MM-DD HH24:MI:SS'), 'b438eab724f7f18a2fc215c338b47946');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 182, 1, '8409-9991-1964-1059', 1, TO_TIMESTAMP('2019-10-31 14:55:02', 'YYYY-MM-DD HH24:MI:SS'), '203f7441c56a48af1258d684298aac8b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 183, 1, '3962-5956-0954-0512', 1, TO_TIMESTAMP('2021-03-23 14:39:19', 'YYYY-MM-DD HH24:MI:SS'), '817ebb3f367d7cfa3c5983d81c0b831f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 184, 1, '8663-6393-0152-9838', 1, TO_TIMESTAMP('2019-12-20 18:03:54', 'YYYY-MM-DD HH24:MI:SS'), 'f67dc153e5a152b3a05af95797666a02');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 185, 1, '2747-3718-9164-5394', 1, TO_TIMESTAMP('2020-05-27 00:30:12', 'YYYY-MM-DD HH24:MI:SS'), 'daaf13959ef281d73c4fcafcf1f5f5da');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 186, 1, '4511-6243-9461-8909', 1, TO_TIMESTAMP('2019-11-19 00:29:03', 'YYYY-MM-DD HH24:MI:SS'), 'e4ae681bde8aeb40741b32386aced86f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 187, 1, '1080-9530-4460-3109', 1, TO_TIMESTAMP('2020-03-16 23:31:38', 'YYYY-MM-DD HH24:MI:SS'), '3e6513c74c1af970da6a698008e2cb5c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 188, 1, '7732-4027-7060-2100', 1, TO_TIMESTAMP('2020-03-04 06:01:42', 'YYYY-MM-DD HH24:MI:SS'), '09d59c09795327263fc9fb6e150e02d6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 189, 1, '8788-8908-4883-6130', 1, TO_TIMESTAMP('2021-02-23 16:17:15', 'YYYY-MM-DD HH24:MI:SS'), '8be0dce0ea308fef05c058dc8dd2f6d4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 190, 1, '2143-6539-1548-4575', 1, TO_TIMESTAMP('2020-02-07 07:55:16', 'YYYY-MM-DD HH24:MI:SS'), '3eddf83e6692b0dde5e2f0e21db05b8a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 191, 1, '8766-9369-6498-4951', 1, TO_TIMESTAMP('2020-12-06 15:31:49', 'YYYY-MM-DD HH24:MI:SS'), '17e0463f43d2d791a98fc775d94fcab0');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 192, 1, '2601-5465-4827-5592', 1, TO_TIMESTAMP('2019-09-09 16:40:25', 'YYYY-MM-DD HH24:MI:SS'), '355ba3382485614c23eee68ae88301fb');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 193, 1, '3909-4933-8264-8102', 1, TO_TIMESTAMP('2020-10-19 06:49:19', 'YYYY-MM-DD HH24:MI:SS'), '3f7e64dbbf45b5ea51dc460bca34a116');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 194, 1, '0404-2250-5208-4227', 1, TO_TIMESTAMP('2020-01-31 06:15:44', 'YYYY-MM-DD HH24:MI:SS'), 'ca0c0cd065e3b3fefcaa91d947215374');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 195, 1, '5630-3959-6478-7332', 1, TO_TIMESTAMP('2020-08-06 11:55:37', 'YYYY-MM-DD HH24:MI:SS'), '24441ca7f28479471d32454ce22bdcfe');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 196, 1, '2664-3110-8926-7244', 1, TO_TIMESTAMP('2020-01-21 11:08:08', 'YYYY-MM-DD HH24:MI:SS'), '83ac39b3316fa9ba555c6e6aeaf54087');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 197, 1, '8439-5959-1991-7838', 1, TO_TIMESTAMP('2020-04-01 11:14:27', 'YYYY-MM-DD HH24:MI:SS'), 'a99eb8244bc859b169feaf82125cab40');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 198, 1, '3163-1575-7835-0047', 1, TO_TIMESTAMP('2019-12-06 16:49:28', 'YYYY-MM-DD HH24:MI:SS'), '8ce1357e0bff6e526df52d01f4c71df5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 199, 1, '1968-4404-9287-9079', 1, TO_TIMESTAMP('2021-02-06 01:42:05', 'YYYY-MM-DD HH24:MI:SS'), 'c6d673b6e7ee556a3da8d9473a1d3e23');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 200, 1, '4250-0151-4008-1476', 1, TO_TIMESTAMP('2021-03-02 07:36:21', 'YYYY-MM-DD HH24:MI:SS'), '8a1f691bf93b91d6ee067044c8db4920');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 201, 1, '1920-5452-2390-3043', 1, TO_TIMESTAMP('2019-07-30 17:13:08', 'YYYY-MM-DD HH24:MI:SS'), '69eef71214222d11a36606807af63bd3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 202, 1, '5787-1255-1230-3217', 1, TO_TIMESTAMP('2019-10-19 00:31:55', 'YYYY-MM-DD HH24:MI:SS'), '621a538ee76c299a1d6fd6b846729e7e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 203, 1, '4252-4673-3294-2865', 1, TO_TIMESTAMP('2019-10-11 18:18:19', 'YYYY-MM-DD HH24:MI:SS'), 'bc1b4aa9b21d025274406ef70955a85e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 204, 1, '5296-1779-1583-3524', 1, TO_TIMESTAMP('2020-04-06 08:32:32', 'YYYY-MM-DD HH24:MI:SS'), '103a7cdef01b33d1c4a0dea15d1a5a59');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 205, 1, '6544-1929-9554-5312', 1, TO_TIMESTAMP('2020-01-24 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'a18e893fd29cb8a0e1759f6733042d46');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 206, 1, '3663-4653-0435-8223', 1, TO_TIMESTAMP('2020-05-02 14:00:33', 'YYYY-MM-DD HH24:MI:SS'), 'fba41741b8e47eb11756ed416d845b8b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 207, 1, '8397-3538-8624-4278', 1, TO_TIMESTAMP('2019-10-07 20:19:12', 'YYYY-MM-DD HH24:MI:SS'), '9825e554b9309e388c4acf3071db7033');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 208, 1, '7316-6021-4921-3985', 1, TO_TIMESTAMP('2021-01-22 02:26:44', 'YYYY-MM-DD HH24:MI:SS'), '7f799431896b6bb36bdf8d44719d971b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 209, 1, '8468-6165-4994-0600', 1, TO_TIMESTAMP('2020-02-22 07:52:16', 'YYYY-MM-DD HH24:MI:SS'), 'e23b6953c47f430410a2a11ca391c3a3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 210, 1, '1177-7069-8792-1632', 1, TO_TIMESTAMP('2019-09-03 13:50:00', 'YYYY-MM-DD HH24:MI:SS'), '14799b16181d9723590bff8ee57f1487');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 211, 1, '5783-3435-0104-0351', 1, TO_TIMESTAMP('2020-09-10 16:52:22', 'YYYY-MM-DD HH24:MI:SS'), '78e4f9c069c31953100e80cb60296a25');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 212, 1, '4335-4762-1959-1711', 1, TO_TIMESTAMP('2019-12-23 13:48:56', 'YYYY-MM-DD HH24:MI:SS'), 'a737b6841433d579928b5fbc2147e160');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 213, 1, '9046-6049-8811-8039', 1, TO_TIMESTAMP('2019-10-06 18:15:44', 'YYYY-MM-DD HH24:MI:SS'), '4050204056d82330b3283c292c866d6d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 214, 1, '5465-4906-1809-0697', 1, TO_TIMESTAMP('2019-10-16 16:34:21', 'YYYY-MM-DD HH24:MI:SS'), 'a715f991e2f009516cb1f53ca22de15e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 215, 1, '7819-0185-7857-4041', 1, TO_TIMESTAMP('2019-10-17 14:21:15', 'YYYY-MM-DD HH24:MI:SS'), '153868a686b09c126448f453e1ac843a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 216, 1, '8048-5603-7261-6307', 1, TO_TIMESTAMP('2020-07-22 21:17:07', 'YYYY-MM-DD HH24:MI:SS'), 'ae15aa060869f8b06ad57ec289e18171');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 217, 1, '8425-4942-8197-4586', 1, TO_TIMESTAMP('2020-03-12 07:10:46', 'YYYY-MM-DD HH24:MI:SS'), 'f6a405501152ef9983c28bcea4fa5b96');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 218, 1, '7329-2515-1214-6752', 1, TO_TIMESTAMP('2020-10-08 16:12:32', 'YYYY-MM-DD HH24:MI:SS'), '0de6d5a876eb32f76059e0a293578ad5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 219, 1, '8388-6581-6919-8401', 1, TO_TIMESTAMP('2021-03-20 18:18:52', 'YYYY-MM-DD HH24:MI:SS'), '8508dbab9615c007d82e0545c8dd5753');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 220, 1, '5179-3333-4607-6748', 1, TO_TIMESTAMP('2020-09-15 21:28:15', 'YYYY-MM-DD HH24:MI:SS'), 'f59566d3001f1be7b27f70f60f89aecf');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 221, 1, '4629-8573-2909-4604', 1, TO_TIMESTAMP('2020-05-21 03:18:03', 'YYYY-MM-DD HH24:MI:SS'), '3b081c20bcfa809b76b8bdaa1eb32efd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 222, 1, '5985-7980-0493-9342', 1, TO_TIMESTAMP('2019-10-06 05:36:43', 'YYYY-MM-DD HH24:MI:SS'), '4fd78027e038db0746aa6b795666c33d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 223, 1, '1146-5073-7608-9956', 1, TO_TIMESTAMP('2020-04-03 10:19:31', 'YYYY-MM-DD HH24:MI:SS'), '0d80de749d5ce9b03589b342a95b5a14');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 224, 1, '2189-6005-6971-3822', 1, TO_TIMESTAMP('2020-01-26 18:42:14', 'YYYY-MM-DD HH24:MI:SS'), '832de3eb3bdfb01f27d3fc5cdfea7e8d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 225, 1, '1779-0930-7949-5428', 1, TO_TIMESTAMP('2019-09-10 00:55:33', 'YYYY-MM-DD HH24:MI:SS'), 'cd606a82f1c1187b382552c4e9e97f63');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 226, 1, '7432-2249-1626-0656', 1, TO_TIMESTAMP('2019-10-27 09:56:06', 'YYYY-MM-DD HH24:MI:SS'), 'bbc80ad7dd40762c48a338a7eaae541a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 227, 1, '8362-7486-0283-2896', 1, TO_TIMESTAMP('2020-09-07 17:50:51', 'YYYY-MM-DD HH24:MI:SS'), '796965fa59dfd31633c65bb56d25731c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 228, 1, '3210-6109-3120-9099', 1, TO_TIMESTAMP('2020-07-08 14:32:51', 'YYYY-MM-DD HH24:MI:SS'), 'bc6447095417f5d8721d2ffbfd978f7f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 229, 1, '8862-7517-2114-8605', 1, TO_TIMESTAMP('2020-01-23 03:51:58', 'YYYY-MM-DD HH24:MI:SS'), 'fb2c99d491c0819dca6533cf4b285281');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 230, 1, '8292-9332-4933-5474', 1, TO_TIMESTAMP('2019-12-04 00:54:12', 'YYYY-MM-DD HH24:MI:SS'), 'd30c7d4720d6bd5e796c026b277d04ca');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 231, 1, '0121-4541-6554-9147', 1, TO_TIMESTAMP('2019-11-18 04:54:19', 'YYYY-MM-DD HH24:MI:SS'), '59c1a7f8ec982c4b90aaa53f4967f4bd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 232, 1, '8334-2219-9122-4346', 1, TO_TIMESTAMP('2021-01-16 04:38:27', 'YYYY-MM-DD HH24:MI:SS'), '106ce11f75647db5b27c4195b529f962');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 233, 1, '3461-2828-5467-6488', 1, TO_TIMESTAMP('2020-11-22 01:59:53', 'YYYY-MM-DD HH24:MI:SS'), 'f021a3804b3c988d16a7a33d73f4f429');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 234, 1, '1495-1321-0329-3463', 1, TO_TIMESTAMP('2021-01-03 02:13:21', 'YYYY-MM-DD HH24:MI:SS'), 'a4f1b7c0931362aa20f82ef59e0a12f3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 235, 1, '5746-4059-8477-8165', 1, TO_TIMESTAMP('2019-10-18 21:40:12', 'YYYY-MM-DD HH24:MI:SS'), 'df031f69ca9ece2c5996f8398904853e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 236, 1, '7662-3555-0936-7078', 1, TO_TIMESTAMP('2020-11-10 15:54:09', 'YYYY-MM-DD HH24:MI:SS'), '79179d0d8c290d3261e623ecc222132d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 237, 1, '1037-4173-5010-1844', 1, TO_TIMESTAMP('2019-08-23 19:19:57', 'YYYY-MM-DD HH24:MI:SS'), 'd3b00678af61383c3a2383a1d06cbeb6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 238, 1, '9542-0200-8504-7263', 1, TO_TIMESTAMP('2020-07-11 13:37:48', 'YYYY-MM-DD HH24:MI:SS'), 'cfa0af118c67ceb5e0eb6c8a88289a93');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 239, 1, '2658-8218-8739-5112', 1, TO_TIMESTAMP('2019-10-06 16:22:46', 'YYYY-MM-DD HH24:MI:SS'), '8ef6cb3efd7ee9d425bb7e3c4d14555d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 240, 1, '3967-3419-7451-3917', 1, TO_TIMESTAMP('2019-11-20 05:01:20', 'YYYY-MM-DD HH24:MI:SS'), '5aad73f2e0daf88d8aa56eef89be2069');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 241, 1, '0235-1871-8340-0515', 1, TO_TIMESTAMP('2020-08-26 01:50:33', 'YYYY-MM-DD HH24:MI:SS'), '2144ecc3981c8bbaac4e153a76e50b27');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 242, 1, '1591-0317-2830-8142', 1, TO_TIMESTAMP('2020-08-20 08:52:00', 'YYYY-MM-DD HH24:MI:SS'), '8d97c248fc28a264b98927a474557019');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 243, 1, '2525-5602-8793-9026', 1, TO_TIMESTAMP('2020-11-24 17:00:46', 'YYYY-MM-DD HH24:MI:SS'), '34c0522167ec23f7843d7da144442750');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 244, 1, '2040-3160-7451-1188', 1, TO_TIMESTAMP('2020-02-17 06:25:03', 'YYYY-MM-DD HH24:MI:SS'), 'b109cc1d6c4bf58406e74f3f4e9af3b4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 245, 1, '9995-6619-1464-4608', 1, TO_TIMESTAMP('2020-09-04 22:30:26', 'YYYY-MM-DD HH24:MI:SS'), 'b8ab960a3c2d2ab45873976e15a868c2');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 246, 1, '8008-3709-7862-0350', 1, TO_TIMESTAMP('2019-11-01 19:54:49', 'YYYY-MM-DD HH24:MI:SS'), '65b246d9d74cebc9dfc7e73861ddbd03');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 247, 1, '4275-6905-8048-1530', 1, TO_TIMESTAMP('2020-12-21 01:46:38', 'YYYY-MM-DD HH24:MI:SS'), 'bcdd4b979ef519ce7ddf7287a19754bc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 248, 1, '9806-9976-3363-9221', 1, TO_TIMESTAMP('2020-07-29 10:25:40', 'YYYY-MM-DD HH24:MI:SS'), 'bfb525e94035384434f6b3ca6bfcf2af');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 249, 1, '8763-6289-0311-5964', 1, TO_TIMESTAMP('2020-03-06 23:32:44', 'YYYY-MM-DD HH24:MI:SS'), 'eb0a8052d570509009726699e7404927');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 250, 1, '1266-3489-7792-1917', 1, TO_TIMESTAMP('2021-01-03 11:21:10', 'YYYY-MM-DD HH24:MI:SS'), '227111a74c92af9942a13654bb0ca1b5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 251, 1, '7281-1759-2456-9087', 1, TO_TIMESTAMP('2020-03-16 14:13:30', 'YYYY-MM-DD HH24:MI:SS'), '8d3c66b4743dca11e903ace60c5ad921');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 252, 1, '7065-9424-6512-9144', 1, TO_TIMESTAMP('2020-03-02 02:43:50', 'YYYY-MM-DD HH24:MI:SS'), 'ed62614e0584a7514d47a8ac3056bfd4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 253, 1, '0860-6596-6188-8474', 1, TO_TIMESTAMP('2020-07-01 20:58:23', 'YYYY-MM-DD HH24:MI:SS'), 'a14e9f9189d5496a559de8430ca6dfcd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 254, 1, '9938-0975-6526-9782', 1, TO_TIMESTAMP('2019-11-12 15:55:33', 'YYYY-MM-DD HH24:MI:SS'), '927b8b22c6473811812e30aed27bd45a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 255, 1, '5616-0515-8595-8239', 1, TO_TIMESTAMP('2019-10-12 04:04:29', 'YYYY-MM-DD HH24:MI:SS'), '25b3687a2abbe3cdf18c2ff41afc3827');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 256, 1, '6614-1012-1292-4065', 1, TO_TIMESTAMP('2020-01-10 09:41:46', 'YYYY-MM-DD HH24:MI:SS'), '8fa0b3bed73c8a76bad35a9e20ae7415');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 257, 1, '1137-4653-2287-5068', 1, TO_TIMESTAMP('2020-07-27 07:56:49', 'YYYY-MM-DD HH24:MI:SS'), '8d9738db5d995890f90c99d4d311e48d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 258, 1, '8474-3501-5208-0290', 1, TO_TIMESTAMP('2020-12-21 21:39:21', 'YYYY-MM-DD HH24:MI:SS'), '923af2e36b390920489858066ee90df5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 259, 1, '0691-4569-3207-0411', 1, TO_TIMESTAMP('2019-12-18 06:54:40', 'YYYY-MM-DD HH24:MI:SS'), '48613fac868085db9dd910f184585fd3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 260, 1, '2166-9145-4155-8023', 1, TO_TIMESTAMP('2020-04-29 06:13:59', 'YYYY-MM-DD HH24:MI:SS'), '87aed36cb965467f78e5bbb2d40fc898');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 261, 1, '8442-5453-9840-8663', 1, TO_TIMESTAMP('2021-01-21 08:54:44', 'YYYY-MM-DD HH24:MI:SS'), '9df79522b9325fd57f46cddd9e7118d6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 262, 1, '3359-7850-4180-2404', 1, TO_TIMESTAMP('2020-05-03 16:52:37', 'YYYY-MM-DD HH24:MI:SS'), '71d014cf503eefc3dea665898903986d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 263, 1, '8469-3111-6014-7335', 1, TO_TIMESTAMP('2020-03-30 19:15:25', 'YYYY-MM-DD HH24:MI:SS'), '7f8dc7a0230709978788dc59c5c1ccf6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 264, 1, '7469-2330-0322-4230', 1, TO_TIMESTAMP('2020-11-03 08:28:53', 'YYYY-MM-DD HH24:MI:SS'), '53e7d072f3ebfe651aa49ce9ddb711cd');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 265, 1, '7887-0599-2451-4067', 1, TO_TIMESTAMP('2019-12-10 09:10:13', 'YYYY-MM-DD HH24:MI:SS'), '958dd5b779bebc4696ef86ec1dc03d78');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 266, 1, '6995-1423-0510-2463', 1, TO_TIMESTAMP('2020-08-03 10:38:02', 'YYYY-MM-DD HH24:MI:SS'), '2d174c8f2ac1845001ac48e04e62c4e7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 267, 1, '1524-4582-2510-8499', 1, TO_TIMESTAMP('2020-03-29 18:31:42', 'YYYY-MM-DD HH24:MI:SS'), '3bfc9be36542eab00a214640326abd3b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 268, 1, '3694-8265-9982-5009', 1, TO_TIMESTAMP('2020-12-26 17:50:28', 'YYYY-MM-DD HH24:MI:SS'), '59952f30873a59ae9211886ab98c0928');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 269, 1, '3899-3875-0449-0345', 1, TO_TIMESTAMP('2020-12-10 22:49:27', 'YYYY-MM-DD HH24:MI:SS'), '87b6054040a5d8e20dffd89d5e573553');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 270, 1, '3799-1450-6980-2579', 1, TO_TIMESTAMP('2020-10-12 09:10:31', 'YYYY-MM-DD HH24:MI:SS'), '83457afe3ea4f30699bb5e56fd915bc5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 271, 1, '2166-2723-1328-2591', 1, TO_TIMESTAMP('2020-12-29 23:22:28', 'YYYY-MM-DD HH24:MI:SS'), '549db24a65c729de7dab5c466c5527a3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 272, 1, '1214-0006-0997-2699', 1, TO_TIMESTAMP('2019-12-19 16:48:57', 'YYYY-MM-DD HH24:MI:SS'), '98372207f1158c9ad1b794c31e0d5271');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 273, 1, '7780-0176-4456-4163', 1, TO_TIMESTAMP('2020-05-09 03:56:27', 'YYYY-MM-DD HH24:MI:SS'), 'a09a34699b081758a8ed364cd80805fc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 274, 1, '2579-4241-6732-3236', 1, TO_TIMESTAMP('2020-12-07 03:26:43', 'YYYY-MM-DD HH24:MI:SS'), '7e6b49b0ca54fc1c0c3e318039e6fbff');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 275, 1, '5865-6693-9768-4412', 1, TO_TIMESTAMP('2020-09-03 11:56:43', 'YYYY-MM-DD HH24:MI:SS'), 'ecf65789c12d657596b9e827afb31411');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 276, 1, '6926-2341-5058-8687', 1, TO_TIMESTAMP('2019-08-28 01:59:41', 'YYYY-MM-DD HH24:MI:SS'), '477e898467b73d0481d54adfad3f6124');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 277, 1, '6003-6274-1426-3669', 1, TO_TIMESTAMP('2020-02-17 18:10:07', 'YYYY-MM-DD HH24:MI:SS'), 'b76e5fa8c3cab9b23d6aa9f93844c80e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 278, 1, '8957-2071-3317-9345', 1, TO_TIMESTAMP('2021-01-15 23:44:41', 'YYYY-MM-DD HH24:MI:SS'), 'f358dc862ede198ebdc04eb4512ab7fb');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 279, 1, '1895-6789-1075-0102', 1, TO_TIMESTAMP('2020-03-29 19:27:17', 'YYYY-MM-DD HH24:MI:SS'), 'fec9cca1ec3fa6d52cf6c9a73fc77cff');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 280, 1, '3375-8931-4158-1324', 1, TO_TIMESTAMP('2019-09-18 01:08:16', 'YYYY-MM-DD HH24:MI:SS'), '9e9fed4798d463fbceae11139ac4d58b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 281, 1, '3475-9916-5456-6224', 1, TO_TIMESTAMP('2020-08-20 21:13:24', 'YYYY-MM-DD HH24:MI:SS'), '1274bd8c23aca96ca82d03820a56d315');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 282, 1, '9914-6456-9516-6057', 1, TO_TIMESTAMP('2019-09-05 00:47:33', 'YYYY-MM-DD HH24:MI:SS'), 'c3f1089f81f40c38624d0cfb24b11ce2');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 283, 1, '5237-0515-8034-6307', 1, TO_TIMESTAMP('2020-05-30 20:16:55', 'YYYY-MM-DD HH24:MI:SS'), '0b7f389a343b721d5b9683d35d6b2142');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 284, 1, '6265-7152-2322-9008', 1, TO_TIMESTAMP('2020-08-21 10:56:43', 'YYYY-MM-DD HH24:MI:SS'), '96c2b9c2c466081ad9d8d5b86dbb1c66');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 285, 1, '8666-0453-4698-7686', 1, TO_TIMESTAMP('2020-03-12 22:08:23', 'YYYY-MM-DD HH24:MI:SS'), '2f2b3021fdaf48b9cef1affaebdf0c71');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 286, 1, '3904-2900-2932-1363', 1, TO_TIMESTAMP('2020-11-13 02:42:23', 'YYYY-MM-DD HH24:MI:SS'), '8a57068a895bc947da24531d3fd6461a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 287, 1, '4634-5477-1442-0022', 1, TO_TIMESTAMP('2019-08-21 07:41:29', 'YYYY-MM-DD HH24:MI:SS'), '6563ae019109ffaf2bcbe0f0a58571ff');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 288, 1, '5224-7003-9557-7393', 1, TO_TIMESTAMP('2020-11-22 07:06:27', 'YYYY-MM-DD HH24:MI:SS'), '036cefa0007da257c79082fd6b799077');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 289, 1, '8784-6143-9117-2788', 1, TO_TIMESTAMP('2021-01-17 00:22:30', 'YYYY-MM-DD HH24:MI:SS'), '0b1dbfd038050faf7684697b2da8a0ae');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 290, 1, '8598-3871-8851-6368', 1, TO_TIMESTAMP('2021-01-24 20:50:10', 'YYYY-MM-DD HH24:MI:SS'), '10660526fe852624a6dea66a42c1f3d2');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 291, 1, '7987-3327-8189-3600', 1, TO_TIMESTAMP('2020-11-29 17:42:12', 'YYYY-MM-DD HH24:MI:SS'), '221ddca84c9739ecf3a31c7d4c0e9b3a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 292, 1, '6486-9474-5435-8363', 1, TO_TIMESTAMP('2019-09-03 03:38:03', 'YYYY-MM-DD HH24:MI:SS'), '1b5c834bba7e92fc63da1730e6053363');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 293, 1, '4366-9887-2698-0503', 1, TO_TIMESTAMP('2020-07-16 10:14:25', 'YYYY-MM-DD HH24:MI:SS'), '433a6568dec296000d29a465cd836e5f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 294, 1, '4454-5601-6347-1677', 1, TO_TIMESTAMP('2020-07-27 01:04:33', 'YYYY-MM-DD HH24:MI:SS'), '3f276ee3a8950ac6f9379a0897e1bd2b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 295, 1, '2777-7406-6006-7351', 1, TO_TIMESTAMP('2020-01-28 23:45:41', 'YYYY-MM-DD HH24:MI:SS'), '664bdf1e14e94e21eb80118ec1751606');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 296, 1, '2586-1334-6920-4691', 1, TO_TIMESTAMP('2020-06-20 10:20:40', 'YYYY-MM-DD HH24:MI:SS'), 'd505147dcc7b6462040baa26f7ab545e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 297, 1, '4131-0919-0044-9475', 1, TO_TIMESTAMP('2021-02-04 07:20:18', 'YYYY-MM-DD HH24:MI:SS'), '79b292849eb99c568bb6d13c31eeca61');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 298, 1, '5016-9228-8620-9481', 1, TO_TIMESTAMP('2019-10-18 08:40:40', 'YYYY-MM-DD HH24:MI:SS'), '22aae4284b80ff252f3a2988c844f68e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 299, 1, '3597-8177-5918-4423', 1, TO_TIMESTAMP('2020-06-30 19:52:50', 'YYYY-MM-DD HH24:MI:SS'), '3a082f8f14a4ce5fed7692c256655f78');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 300, 1, '6951-4670-4315-1469', 1, TO_TIMESTAMP('2021-01-13 07:00:02', 'YYYY-MM-DD HH24:MI:SS'), 'a749185704c9d0ae55e6aac13d05b39c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 301, 1, '9658-0055-8846-7060', 1, TO_TIMESTAMP('2021-02-01 11:25:21', 'YYYY-MM-DD HH24:MI:SS'), 'dc61ce9d863a47f8c1dc655cf8886c66');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 302, 1, '9740-5759-3356-9126', 1, TO_TIMESTAMP('2019-11-18 21:35:54', 'YYYY-MM-DD HH24:MI:SS'), '336487557adc368384243eb8bb77d98b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 303, 1, '9760-6816-3645-5899', 1, TO_TIMESTAMP('2020-02-19 09:01:17', 'YYYY-MM-DD HH24:MI:SS'), 'e0a6c6e9f2ff6756b0f22b75a8791325');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 304, 1, '0006-9280-5290-2987', 1, TO_TIMESTAMP('2020-11-17 04:01:38', 'YYYY-MM-DD HH24:MI:SS'), 'ac5cce231d8fabc9cacddbb8bb0b46af');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 305, 1, '5105-3070-1390-5927', 1, TO_TIMESTAMP('2019-10-18 19:43:55', 'YYYY-MM-DD HH24:MI:SS'), '70f6b2efe4262a3a7b81a0b89ae18338');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 306, 1, '1221-8170-8826-2269', 1, TO_TIMESTAMP('2021-02-28 08:39:44', 'YYYY-MM-DD HH24:MI:SS'), '261969db6d6933eee9fd38bff92065af');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 307, 1, '2326-6601-7723-0557', 1, TO_TIMESTAMP('2019-11-12 04:38:26', 'YYYY-MM-DD HH24:MI:SS'), '87ffba867bcf05f76fbc93a95b093a35');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 308, 1, '3762-7904-4492-6855', 1, TO_TIMESTAMP('2019-11-19 20:22:18', 'YYYY-MM-DD HH24:MI:SS'), '930e47503fd651db7df8ec2f81566f80');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 309, 1, '4323-4378-6073-3984', 1, TO_TIMESTAMP('2021-02-23 14:21:51', 'YYYY-MM-DD HH24:MI:SS'), '48dcf90df09dafad6200c414ba3a3bea');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 310, 1, '2423-6594-6224-3494', 1, TO_TIMESTAMP('2019-12-18 05:05:54', 'YYYY-MM-DD HH24:MI:SS'), 'fcbe7c153cb944e64f5e16e866d1c936');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 311, 1, '7290-7757-0110-9261', 1, TO_TIMESTAMP('2020-06-01 02:00:58', 'YYYY-MM-DD HH24:MI:SS'), 'ba0274b4feb308361b5e1c3e1aa4308d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 312, 1, '5540-7203-2189-8170', 1, TO_TIMESTAMP('2019-07-30 05:27:39', 'YYYY-MM-DD HH24:MI:SS'), '732a4289674e0911b937ff14b7090083');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 313, 1, '1343-5987-1618-1481', 1, TO_TIMESTAMP('2020-09-18 00:58:07', 'YYYY-MM-DD HH24:MI:SS'), '6518143ec009196d43884f1f46e65e99');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 314, 1, '0423-7417-4433-7396', 1, TO_TIMESTAMP('2020-09-25 05:39:44', 'YYYY-MM-DD HH24:MI:SS'), 'e66368053e7720a53e749e3a85ec8b8b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 315, 1, '6000-0250-4824-3756', 1, TO_TIMESTAMP('2019-08-11 18:07:06', 'YYYY-MM-DD HH24:MI:SS'), '314af1612adc554112d1fc7c55130d17');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 316, 1, '9025-2131-5044-7751', 1, TO_TIMESTAMP('2020-12-09 03:19:15', 'YYYY-MM-DD HH24:MI:SS'), '9d58080ea2cf6d52ebecb798500a99c8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 317, 1, '5036-2346-1819-2185', 1, TO_TIMESTAMP('2021-01-19 05:48:28', 'YYYY-MM-DD HH24:MI:SS'), 'fb859965db7b1808e5ebee397ede06ba');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 318, 1, '3227-4641-9600-4037', 1, TO_TIMESTAMP('2021-01-24 12:26:38', 'YYYY-MM-DD HH24:MI:SS'), 'b2649761679fc9d6cf2db0d6e55eecab');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 319, 1, '9119-4850-1784-2077', 1, TO_TIMESTAMP('2020-02-09 23:24:51', 'YYYY-MM-DD HH24:MI:SS'), 'de8ee266698f680455f731c664f5d77e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 320, 1, '2461-3993-2044-0141', 1, TO_TIMESTAMP('2019-12-03 19:18:15', 'YYYY-MM-DD HH24:MI:SS'), '4e10ed6553af176930c5d49f707a3584');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 321, 1, '2577-1252-8409-8910', 1, TO_TIMESTAMP('2020-05-05 15:49:03', 'YYYY-MM-DD HH24:MI:SS'), 'a61ac448cd9328fef73a592d3b76b6fb');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 322, 1, '4100-8094-1749-0719', 1, TO_TIMESTAMP('2021-02-06 21:06:18', 'YYYY-MM-DD HH24:MI:SS'), '6db0abe9533965539c93649df0eb5ee8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 323, 1, '9597-8091-8727-5566', 1, TO_TIMESTAMP('2020-05-28 17:29:23', 'YYYY-MM-DD HH24:MI:SS'), 'dff176e55d1dd2b066505a68392e3e20');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 324, 1, '5182-2493-3046-8278', 1, TO_TIMESTAMP('2020-09-15 08:14:43', 'YYYY-MM-DD HH24:MI:SS'), '13e1e8522c903cbef1f6577e831a2b06');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 325, 1, '4436-2189-2652-5670', 1, TO_TIMESTAMP('2020-08-03 13:18:07', 'YYYY-MM-DD HH24:MI:SS'), '4cfdcfdbcada62ca21ce719dfc091561');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 326, 1, '5485-5751-0302-6784', 1, TO_TIMESTAMP('2021-02-19 18:43:12', 'YYYY-MM-DD HH24:MI:SS'), 'da4cd535281c82c1e85098bf0aea5a9e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 327, 1, '6495-2108-0470-8744', 1, TO_TIMESTAMP('2020-03-11 10:59:13', 'YYYY-MM-DD HH24:MI:SS'), '6f17bcee48f62ebc8e78497ecc82aa7b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 328, 1, '0386-5442-4020-7734', 1, TO_TIMESTAMP('2019-07-28 21:08:50', 'YYYY-MM-DD HH24:MI:SS'), 'd38f8d36329881514b959e4c124e4881');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 329, 1, '6586-3424-0124-7897', 1, TO_TIMESTAMP('2021-03-04 14:17:57', 'YYYY-MM-DD HH24:MI:SS'), '365fa52fd4ea1b092b18cf0e84abc492');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 330, 1, '9802-7733-0969-8823', 1, TO_TIMESTAMP('2020-09-11 15:33:39', 'YYYY-MM-DD HH24:MI:SS'), 'b41883d69b16008f7b6dcaa18ad87e76');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 331, 1, '9822-9112-8546-3563', 1, TO_TIMESTAMP('2020-07-22 11:59:10', 'YYYY-MM-DD HH24:MI:SS'), '30db3a21c83ece16670f56117bde5a08');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 332, 1, '7549-2802-8171-1129', 1, TO_TIMESTAMP('2019-10-14 08:47:28', 'YYYY-MM-DD HH24:MI:SS'), 'c56f3c6f4237721709b235c93b148cd3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 333, 1, '6170-4628-3630-7962', 1, TO_TIMESTAMP('2021-01-20 23:06:36', 'YYYY-MM-DD HH24:MI:SS'), '8672c2c87d934069034bd44e488ad23e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 334, 1, '8108-2130-4895-3504', 1, TO_TIMESTAMP('2020-03-09 23:51:28', 'YYYY-MM-DD HH24:MI:SS'), 'f1fb89c64d9349b22faae9f75e5def1c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 335, 1, '7008-9634-9367-0357', 1, TO_TIMESTAMP('2021-03-13 03:57:43', 'YYYY-MM-DD HH24:MI:SS'), '1aa6439c8384031977712ca84ff3397d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 336, 1, '9175-4530-5507-7780', 1, TO_TIMESTAMP('2020-10-11 14:15:16', 'YYYY-MM-DD HH24:MI:SS'), '0a674ec5910037312bd1e6c2d161c565');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 337, 1, '3707-1630-6992-5091', 1, TO_TIMESTAMP('2020-07-02 12:42:26', 'YYYY-MM-DD HH24:MI:SS'), 'e58932057e0bcdbd9eea37fa19789015');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 338, 1, '4832-0790-5138-1249', 1, TO_TIMESTAMP('2019-07-27 17:36:28', 'YYYY-MM-DD HH24:MI:SS'), 'c9e39584211bc54ac9dcc9d21924677c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 339, 1, '3706-8516-7241-8068', 1, TO_TIMESTAMP('2021-03-11 16:48:56', 'YYYY-MM-DD HH24:MI:SS'), '842be3a89077833b2eb2b1615e8e4627');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 340, 1, '8990-6796-5598-3245', 1, TO_TIMESTAMP('2020-11-15 07:29:39', 'YYYY-MM-DD HH24:MI:SS'), '89bcae4dd34a48d4b2aa28c340c36c1c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 341, 1, '3794-9349-9023-4808', 1, TO_TIMESTAMP('2021-02-13 16:18:04', 'YYYY-MM-DD HH24:MI:SS'), '35b7079087a1bac348ed685c6e9090ad');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 342, 1, '0806-3342-0261-8845', 1, TO_TIMESTAMP('2020-09-29 00:08:10', 'YYYY-MM-DD HH24:MI:SS'), 'b27a32e3f641d31973deccb92052c6d3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 343, 1, '8209-8285-6086-8118', 1, TO_TIMESTAMP('2019-09-04 07:30:39', 'YYYY-MM-DD HH24:MI:SS'), '75d7eedcf834a9d3f744afc33cc0448f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 344, 1, '5126-0843-8555-8494', 1, TO_TIMESTAMP('2019-10-21 17:39:15', 'YYYY-MM-DD HH24:MI:SS'), '9924e7dcb6459bb6a74befac49e2791a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 345, 1, '5321-9082-7226-0936', 1, TO_TIMESTAMP('2020-08-21 02:36:32', 'YYYY-MM-DD HH24:MI:SS'), '256fe2eb8a5836b9fe38a9cc4d6aa5dc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 346, 1, '2685-7382-8421-9490', 1, TO_TIMESTAMP('2020-12-03 03:53:17', 'YYYY-MM-DD HH24:MI:SS'), '8a03e744a16063603a216e54c37c440e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 347, 1, '3166-7958-1982-8062', 1, TO_TIMESTAMP('2020-08-19 14:21:11', 'YYYY-MM-DD HH24:MI:SS'), '8896cc5a9ddd99b3b3b2a9edd7c6e4e5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 348, 1, '8812-1394-6158-0218', 1, TO_TIMESTAMP('2021-02-26 22:49:46', 'YYYY-MM-DD HH24:MI:SS'), 'dbb54a05f7b8ab146fa0d84899ccbee7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 349, 1, '7276-4134-0986-2872', 1, TO_TIMESTAMP('2020-05-14 22:51:56', 'YYYY-MM-DD HH24:MI:SS'), '722c72ec4bc095d44ed46c290d4ce559');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 350, 1, '1767-6357-0233-1850', 1, TO_TIMESTAMP('2020-10-21 08:47:24', 'YYYY-MM-DD HH24:MI:SS'), '6ea7ff69b884620dce2de949511812f1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 351, 1, '4658-5823-8267-3095', 1, TO_TIMESTAMP('2019-10-18 20:14:12', 'YYYY-MM-DD HH24:MI:SS'), '8caf302af32fcd6a90ddff4dae1389a4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 352, 1, '4504-5823-0324-6642', 1, TO_TIMESTAMP('2020-08-26 15:41:17', 'YYYY-MM-DD HH24:MI:SS'), '04f0ebf78a0302c61b0f1493c476bc5c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 353, 1, '0742-0474-9365-8973', 1, TO_TIMESTAMP('2019-10-05 04:55:11', 'YYYY-MM-DD HH24:MI:SS'), '6878e05e470b5b7ffa4b830a3ba3d4b1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 354, 1, '9324-4812-1755-4065', 1, TO_TIMESTAMP('2021-03-01 19:45:42', 'YYYY-MM-DD HH24:MI:SS'), '803019b25ceac293566d11c2a2564bc2');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 355, 1, '6787-5168-3632-2154', 1, TO_TIMESTAMP('2020-02-04 16:56:55', 'YYYY-MM-DD HH24:MI:SS'), '118d16fc2b364e99279ef5460a4944a5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 356, 1, '9579-6226-9358-1820', 1, TO_TIMESTAMP('2020-05-30 15:47:00', 'YYYY-MM-DD HH24:MI:SS'), '751ec3073a50044903ffa2c762dee9ad');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 357, 1, '9623-1388-7786-4056', 1, TO_TIMESTAMP('2020-02-11 19:34:57', 'YYYY-MM-DD HH24:MI:SS'), 'e266de5d692a2013898b24274d5a4fba');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 358, 1, '3526-1316-3761-7567', 1, TO_TIMESTAMP('2020-01-08 16:07:12', 'YYYY-MM-DD HH24:MI:SS'), '05f2133540a48bdc552c6783c50b5f1b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 359, 1, '4274-1422-7212-6690', 1, TO_TIMESTAMP('2020-07-19 12:44:03', 'YYYY-MM-DD HH24:MI:SS'), 'e7c2a535ace2e2a31c2dcaead8c1b320');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 360, 1, '9641-6292-3674-8255', 1, TO_TIMESTAMP('2020-02-28 17:58:03', 'YYYY-MM-DD HH24:MI:SS'), 'd0288f8b7e1c4cd89abf45db260ead74');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 361, 1, '8301-6927-9086-3935', 1, TO_TIMESTAMP('2019-08-16 08:41:51', 'YYYY-MM-DD HH24:MI:SS'), '7448ecc2092417777194f6f25f783e34');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 362, 1, '4978-6830-8886-5525', 1, TO_TIMESTAMP('2020-04-02 00:29:40', 'YYYY-MM-DD HH24:MI:SS'), 'e28f64d8582435f2f9efd6066d1113f1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 363, 1, '4057-0151-5183-2348', 1, TO_TIMESTAMP('2021-02-08 02:12:22', 'YYYY-MM-DD HH24:MI:SS'), '62e883c3de20c7356f2733e14f0ecc48');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 364, 1, '3173-8321-1482-9338', 1, TO_TIMESTAMP('2020-03-31 07:14:14', 'YYYY-MM-DD HH24:MI:SS'), 'daf773e5653c2a8098d75e20e3da38ae');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 365, 1, '1827-9303-4770-0641', 1, TO_TIMESTAMP('2020-10-06 05:56:28', 'YYYY-MM-DD HH24:MI:SS'), '8a69b4012530a0948d98eda729fbac96');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 366, 1, '3192-8193-2548-0658', 1, TO_TIMESTAMP('2021-01-31 16:41:03', 'YYYY-MM-DD HH24:MI:SS'), '08e15d1ea6b40c6757aaf2cee7103e61');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 367, 1, '2288-3245-5311-2764', 1, TO_TIMESTAMP('2020-12-25 19:43:51', 'YYYY-MM-DD HH24:MI:SS'), '9167795d59138b1f44e95dd76f703ec1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 368, 1, '8898-6330-7970-1510', 1, TO_TIMESTAMP('2019-09-11 10:29:05', 'YYYY-MM-DD HH24:MI:SS'), '5f4c0ed3fcad11b093ae49446bb247dc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 369, 1, '9492-1951-9081-8643', 1, TO_TIMESTAMP('2020-09-09 07:28:44', 'YYYY-MM-DD HH24:MI:SS'), '3a062fb0455bc3722dbd37d2761f0cd1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 370, 1, '7808-1072-3438-4876', 1, TO_TIMESTAMP('2021-03-21 13:33:37', 'YYYY-MM-DD HH24:MI:SS'), '6f6252db98376a51ae4ed52ce2c58ed7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 371, 1, '9717-4436-6627-4956', 1, TO_TIMESTAMP('2020-12-14 09:02:56', 'YYYY-MM-DD HH24:MI:SS'), '853f54035e8bb02a8ac940c0e3fc8eea');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 372, 1, '6756-5775-9820-4822', 1, TO_TIMESTAMP('2020-12-18 07:53:10', 'YYYY-MM-DD HH24:MI:SS'), '439870fe15db0be6379f43288ca43548');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 373, 1, '8158-1701-7601-5508', 1, TO_TIMESTAMP('2020-05-29 13:38:18', 'YYYY-MM-DD HH24:MI:SS'), 'ba2da95ea46fe9b098e7ee89be453053');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 374, 1, '5674-6928-6858-8525', 1, TO_TIMESTAMP('2019-12-10 18:53:02', 'YYYY-MM-DD HH24:MI:SS'), '9db2e78594a39fc50dd25fe938feeb49');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 375, 1, '3155-4229-2753-5103', 1, TO_TIMESTAMP('2020-10-09 14:38:54', 'YYYY-MM-DD HH24:MI:SS'), 'c42fe6ead2316a0cfcfcf7fdceeba965');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 376, 1, '2737-0307-7277-6015', 1, TO_TIMESTAMP('2020-08-29 18:30:35', 'YYYY-MM-DD HH24:MI:SS'), '42df2057747caf99cec3b63f052396c8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 377, 1, '1595-2497-1984-2983', 1, TO_TIMESTAMP('2020-07-26 22:37:51', 'YYYY-MM-DD HH24:MI:SS'), 'de4d94627e50e16be359b02af8587dca');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 378, 1, '9066-4809-1169-5552', 1, TO_TIMESTAMP('2021-03-20 01:02:20', 'YYYY-MM-DD HH24:MI:SS'), '8da399a428197ad97833081394da371b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 379, 1, '9292-0753-8424-0037', 1, TO_TIMESTAMP('2020-02-12 17:15:09', 'YYYY-MM-DD HH24:MI:SS'), 'dd8e0689ff835e87af9dcdf5ac02d9a4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 380, 1, '1163-8234-3247-7277', 1, TO_TIMESTAMP('2020-02-04 22:56:23', 'YYYY-MM-DD HH24:MI:SS'), 'ba933644fd93c34e87a3a4eaacced855');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 381, 1, '9479-7331-1162-2828', 1, TO_TIMESTAMP('2021-01-03 14:22:47', 'YYYY-MM-DD HH24:MI:SS'), '62c07d5874fbf42e9b9224298c9e97a1');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 382, 1, '2293-3200-5524-7224', 1, TO_TIMESTAMP('2019-09-27 06:35:49', 'YYYY-MM-DD HH24:MI:SS'), '03e28509ed7c012b276f15386fd90f02');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 383, 1, '0155-8708-9842-3970', 1, TO_TIMESTAMP('2019-11-01 03:28:32', 'YYYY-MM-DD HH24:MI:SS'), 'e1670d0ef5d4464df17f7a69a91ba842');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 384, 1, '4109-3856-1352-6516', 1, TO_TIMESTAMP('2020-04-08 09:07:41', 'YYYY-MM-DD HH24:MI:SS'), '07977791735101256ec430fd1341ff0a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 385, 1, '9192-7986-6706-9937', 1, TO_TIMESTAMP('2019-11-15 18:19:00', 'YYYY-MM-DD HH24:MI:SS'), 'c607e2aabf59bb6708815a190ded2c77');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 386, 1, '9135-2265-3052-1986', 1, TO_TIMESTAMP('2020-08-04 02:22:24', 'YYYY-MM-DD HH24:MI:SS'), '4de90809b07fc6fab4470e43cb0c0016');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 387, 1, '6159-7602-9411-0857', 1, TO_TIMESTAMP('2020-12-12 17:17:57', 'YYYY-MM-DD HH24:MI:SS'), 'fd761671c0b020a5200d7cbb3b19b751');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 388, 1, '8006-1652-1310-4515', 1, TO_TIMESTAMP('2020-03-06 02:30:54', 'YYYY-MM-DD HH24:MI:SS'), 'e064c068b3c058022f736c90e61c9c8d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 389, 1, '7741-9900-5066-9056', 1, TO_TIMESTAMP('2020-04-06 09:54:26', 'YYYY-MM-DD HH24:MI:SS'), 'fc514c78f1d8a08ec2c03e73858fb1ed');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 390, 1, '1298-6134-0933-2793', 1, TO_TIMESTAMP('2019-07-29 13:25:42', 'YYYY-MM-DD HH24:MI:SS'), 'a0797b6243915269950e23ef02df15f8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 391, 1, '8804-1016-5867-5491', 1, TO_TIMESTAMP('2021-02-22 13:47:42', 'YYYY-MM-DD HH24:MI:SS'), 'ebc83628b8f4c3eb5b06fb2b129adbb8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 392, 1, '1423-4894-4061-7368', 1, TO_TIMESTAMP('2021-02-22 14:20:10', 'YYYY-MM-DD HH24:MI:SS'), '5a52268a54f33c1b8ed55debdee63f0b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 393, 1, '1827-4563-0870-0993', 1, TO_TIMESTAMP('2020-09-21 17:47:28', 'YYYY-MM-DD HH24:MI:SS'), '69e6baeb5a9e612f492743c43986b247');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 394, 1, '8305-1467-1813-0800', 1, TO_TIMESTAMP('2020-12-19 21:36:46', 'YYYY-MM-DD HH24:MI:SS'), '64742552cd32428dd48bcd68e042a310');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 395, 1, '5304-4137-5500-2856', 1, TO_TIMESTAMP('2020-02-02 12:58:55', 'YYYY-MM-DD HH24:MI:SS'), 'aee8a3ac68553576bf04fb577891fec5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 396, 1, '3591-9797-5072-7169', 1, TO_TIMESTAMP('2020-06-14 10:29:20', 'YYYY-MM-DD HH24:MI:SS'), '86bceeb5a1f33e33f1f5b556bc0cc565');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 397, 1, '0313-6853-1903-1048', 1, TO_TIMESTAMP('2019-09-11 06:39:28', 'YYYY-MM-DD HH24:MI:SS'), '62c71ebe3e90503cb77e5e410b731c49');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 398, 1, '3668-1521-5927-6543', 1, TO_TIMESTAMP('2021-02-20 18:14:06', 'YYYY-MM-DD HH24:MI:SS'), '960e3c518766399ac4061f0b02608bf6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 399, 1, '4188-5069-6466-3996', 1, TO_TIMESTAMP('2021-02-07 09:54:22', 'YYYY-MM-DD HH24:MI:SS'), '78b8429877ab61a663a515beafe7415a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 400, 1, '8048-0218-0444-9280', 1, TO_TIMESTAMP('2021-01-13 14:00:45', 'YYYY-MM-DD HH24:MI:SS'), '0d68dc1ae69df6f03e9829f550d1cfee');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 401, 1, '4310-2105-8946-7773', 1, TO_TIMESTAMP('2020-02-22 03:50:44', 'YYYY-MM-DD HH24:MI:SS'), '5bd8c50bb1af996508fc56d488a59482');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 402, 1, '5136-6432-5316-3911', 1, TO_TIMESTAMP('2020-08-21 17:11:36', 'YYYY-MM-DD HH24:MI:SS'), '2e0866787c59ed64d2cc32da5bf50f7f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 403, 1, '6221-6242-0333-5234', 1, TO_TIMESTAMP('2019-09-06 00:24:03', 'YYYY-MM-DD HH24:MI:SS'), '23c39993e592e2ca5df74be1302741c5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 404, 1, '1660-9740-7853-1176', 1, TO_TIMESTAMP('2020-11-04 16:45:09', 'YYYY-MM-DD HH24:MI:SS'), '634d0a27fb64c7805af26c4df5846698');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 405, 1, '0597-1724-1732-2622', 1, TO_TIMESTAMP('2020-04-13 08:50:51', 'YYYY-MM-DD HH24:MI:SS'), 'f17a3666cb4b1b790ea72b466d630dbe');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 406, 1, '5047-1422-7303-0909', 1, TO_TIMESTAMP('2020-03-26 22:56:50', 'YYYY-MM-DD HH24:MI:SS'), '40154b08b7e16288bf4600c28a90c11f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 407, 1, '5007-9557-3727-3487', 1, TO_TIMESTAMP('2020-05-19 03:13:52', 'YYYY-MM-DD HH24:MI:SS'), '4adec3afe40af8de00711820f21f1e4d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 408, 1, '0592-7402-5722-0310', 1, TO_TIMESTAMP('2021-03-02 21:41:24', 'YYYY-MM-DD HH24:MI:SS'), '4b3ccaca8b678a53033ba0be76c70a43');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 409, 1, '4978-0774-5111-0801', 1, TO_TIMESTAMP('2019-08-05 18:59:23', 'YYYY-MM-DD HH24:MI:SS'), 'eaea0717ed0b68ad5d0f825a04487954');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 410, 1, '0690-3934-3101-0224', 1, TO_TIMESTAMP('2020-03-22 05:18:30', 'YYYY-MM-DD HH24:MI:SS'), '8b17fee62bc9a131bad34d980ac84d27');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 411, 1, '5802-9628-4268-5730', 1, TO_TIMESTAMP('2021-01-14 19:21:54', 'YYYY-MM-DD HH24:MI:SS'), 'cc7b6c1cf6e25ca858720a18053ed871');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 412, 1, '2756-6275-3618-2512', 1, TO_TIMESTAMP('2019-12-19 17:38:50', 'YYYY-MM-DD HH24:MI:SS'), '1cd8ae02e1f85557ee1185a1522b6459');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 413, 1, '7252-3530-8524-9327', 1, TO_TIMESTAMP('2020-12-19 00:43:02', 'YYYY-MM-DD HH24:MI:SS'), 'fefa2217ace8f976099d95b317d412ce');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 414, 1, '4627-2532-7804-0670', 1, TO_TIMESTAMP('2020-01-01 19:36:39', 'YYYY-MM-DD HH24:MI:SS'), 'e9dceb29386f9eb4552fe6422c79e467');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 415, 1, '0309-5216-4585-1900', 1, TO_TIMESTAMP('2021-01-11 08:06:52', 'YYYY-MM-DD HH24:MI:SS'), '04290bc58799d358efcd20dfb456ae5f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 416, 1, '2887-3419-0280-2267', 1, TO_TIMESTAMP('2019-09-10 18:44:20', 'YYYY-MM-DD HH24:MI:SS'), '58ac3d6a09dbfeaae3480b275bdfbc04');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 417, 1, '4275-5700-3614-2147', 1, TO_TIMESTAMP('2021-03-16 08:04:30', 'YYYY-MM-DD HH24:MI:SS'), '20ee518dc9e55e896077c9577cfd899d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 418, 1, '5689-3577-7524-9265', 1, TO_TIMESTAMP('2020-12-22 18:00:56', 'YYYY-MM-DD HH24:MI:SS'), 'fe63c140497bb4c209e8032421868ec5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 419, 1, '4582-6008-9718-1504', 1, TO_TIMESTAMP('2020-09-01 06:08:15', 'YYYY-MM-DD HH24:MI:SS'), 'a96f4213a6cb5a6e7e246bc1a3e0dd1c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 420, 1, '0802-2586-4013-7148', 1, TO_TIMESTAMP('2020-08-18 21:23:14', 'YYYY-MM-DD HH24:MI:SS'), '2536b218a88d362e9cf8f7f4cd892e1c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 421, 1, '5163-6277-7938-6621', 1, TO_TIMESTAMP('2020-04-24 07:41:27', 'YYYY-MM-DD HH24:MI:SS'), '377237a5a925af2683026e8b394afefc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 422, 1, '8424-6241-5948-6715', 1, TO_TIMESTAMP('2019-09-09 19:30:25', 'YYYY-MM-DD HH24:MI:SS'), 'b474a826f045f88b0c932e9d0dfbb2f7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 423, 1, '9140-3820-3945-5292', 1, TO_TIMESTAMP('2021-02-20 10:17:51', 'YYYY-MM-DD HH24:MI:SS'), '1086336861b826eb1872c2df289df24f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 424, 1, '9343-2077-7849-6368', 1, TO_TIMESTAMP('2020-09-01 10:26:15', 'YYYY-MM-DD HH24:MI:SS'), '8eac32207e501569d1b838a349a495be');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 425, 1, '7959-6676-6204-2809', 1, TO_TIMESTAMP('2019-12-15 11:39:03', 'YYYY-MM-DD HH24:MI:SS'), '24b67a1e5488915009e11b3a6726720a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 426, 1, '0239-6584-7386-9044', 1, TO_TIMESTAMP('2019-07-30 19:25:27', 'YYYY-MM-DD HH24:MI:SS'), '693b96018d27c048b20eb72dbb8b9ba7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 427, 1, '1222-4108-1446-3109', 1, TO_TIMESTAMP('2020-04-13 15:50:09', 'YYYY-MM-DD HH24:MI:SS'), 'e30dfa2f6b9b4aff35fc3af523254237');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 428, 1, '5345-9657-5176-7427', 1, TO_TIMESTAMP('2020-07-05 17:28:09', 'YYYY-MM-DD HH24:MI:SS'), 'c4c7928ff9c8888d222c564be87c9539');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 429, 1, '7340-4145-2754-2469', 1, TO_TIMESTAMP('2020-04-12 20:12:13', 'YYYY-MM-DD HH24:MI:SS'), 'dcb5958c4dac6d6286e02ddc03c5f1b3');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 430, 1, '6609-8012-6686-1092', 1, TO_TIMESTAMP('2019-07-21 13:21:50', 'YYYY-MM-DD HH24:MI:SS'), '3efaa381ee7283388bf96aa4f6a87653');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 431, 1, '7485-1324-7900-6205', 1, TO_TIMESTAMP('2019-10-07 04:40:20', 'YYYY-MM-DD HH24:MI:SS'), 'faf8f56328e2ee3dc6bab1c3d7f47d70');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 432, 1, '0634-5723-1730-4921', 1, TO_TIMESTAMP('2020-04-21 04:53:43', 'YYYY-MM-DD HH24:MI:SS'), 'e781eebcbe2d69f303ecb5acd78e6663');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 433, 1, '6433-5620-2916-4348', 1, TO_TIMESTAMP('2020-09-01 20:36:12', 'YYYY-MM-DD HH24:MI:SS'), '687b8e6b6174660f00888ea23a41bc7f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 434, 1, '3514-7874-7910-8555', 1, TO_TIMESTAMP('2020-09-12 13:12:14', 'YYYY-MM-DD HH24:MI:SS'), '4d7b5c94eac2b0d3928e66f99128cda8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 435, 1, '6939-7913-8762-7709', 1, TO_TIMESTAMP('2019-08-23 18:16:56', 'YYYY-MM-DD HH24:MI:SS'), '1265cdf58bf3d6525ea15ea1149abe67');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 436, 1, '2365-5542-6443-9859', 1, TO_TIMESTAMP('2019-09-11 18:38:14', 'YYYY-MM-DD HH24:MI:SS'), 'cac5572e3defbd0febd2ab83d09a650c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 437, 1, '6541-2303-2544-4839', 1, TO_TIMESTAMP('2021-01-29 09:08:05', 'YYYY-MM-DD HH24:MI:SS'), '51bd75859986d849e11789f0f0d60ea5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 438, 1, '0487-6920-3828-6316', 1, TO_TIMESTAMP('2020-01-18 00:14:25', 'YYYY-MM-DD HH24:MI:SS'), '7c44cf87c148a60fd4629d9f09ae3b03');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 439, 1, '7648-1876-0711-6710', 1, TO_TIMESTAMP('2020-07-28 14:06:44', 'YYYY-MM-DD HH24:MI:SS'), '389d4e02507431b7f133a2d627634dbc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 440, 1, '0277-2793-0934-6652', 1, TO_TIMESTAMP('2020-08-28 00:18:22', 'YYYY-MM-DD HH24:MI:SS'), '07d9635bb5e274bd43a5fcbf740d5614');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 441, 1, '8122-8723-9542-0457', 1, TO_TIMESTAMP('2020-04-07 03:24:06', 'YYYY-MM-DD HH24:MI:SS'), 'c1686de2382f2819f3fc7b421d82619a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 442, 1, '1496-9676-8650-6120', 1, TO_TIMESTAMP('2020-02-01 01:52:25', 'YYYY-MM-DD HH24:MI:SS'), '92c2c1cfcd1183635adca5dedf5215c9');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 443, 1, '9798-2361-0402-2840', 1, TO_TIMESTAMP('2020-08-25 10:23:32', 'YYYY-MM-DD HH24:MI:SS'), 'f54e11d849c0ef13158606a46e82e274');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 444, 1, '5873-1563-8414-4584', 1, TO_TIMESTAMP('2020-02-23 10:18:46', 'YYYY-MM-DD HH24:MI:SS'), '5291463f6bd63551d02f1c68f303c0d0');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 445, 1, '4980-1384-7752-9985', 1, TO_TIMESTAMP('2019-11-04 11:38:58', 'YYYY-MM-DD HH24:MI:SS'), '121ea2e306dea1cc93050e2a07e89ecc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 446, 1, '1967-8006-2901-3418', 1, TO_TIMESTAMP('2020-12-06 05:01:32', 'YYYY-MM-DD HH24:MI:SS'), '5aba0a5be6aa3c3f8c12f3850b38d2ef');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 447, 1, '7625-2489-0532-8774', 1, TO_TIMESTAMP('2020-09-29 03:22:19', 'YYYY-MM-DD HH24:MI:SS'), '2b5575f4fbbdc0a1e37d5564734b350b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 448, 1, '9064-3799-3156-8245', 1, TO_TIMESTAMP('2019-12-27 13:22:41', 'YYYY-MM-DD HH24:MI:SS'), '19163451d7f3ff23ac2ff6e7364c694e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 449, 1, '8539-1853-5148-2975', 1, TO_TIMESTAMP('2021-01-29 17:39:24', 'YYYY-MM-DD HH24:MI:SS'), 'cbac5b1b97056e17703a1bf5b8f50f57');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 450, 1, '9191-3726-4457-6531', 1, TO_TIMESTAMP('2019-09-22 22:42:21', 'YYYY-MM-DD HH24:MI:SS'), '419b67a739c075c8d55d2a8c794c5c04');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 451, 1, '1521-5519-5082-2838', 1, TO_TIMESTAMP('2020-05-18 08:11:29', 'YYYY-MM-DD HH24:MI:SS'), '10958616e024a2f38e838be0b62fb941');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 452, 1, '0664-4925-3317-2676', 1, TO_TIMESTAMP('2020-08-02 06:27:07', 'YYYY-MM-DD HH24:MI:SS'), '5de1e55a755ec5a9217487b3219d977a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 453, 1, '7246-8583-2309-2351', 1, TO_TIMESTAMP('2020-03-03 18:59:47', 'YYYY-MM-DD HH24:MI:SS'), 'c218f152fce22ed9b3e4bd2162acbdc7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 454, 1, '4896-0415-2114-1411', 1, TO_TIMESTAMP('2019-12-03 10:18:36', 'YYYY-MM-DD HH24:MI:SS'), '9eaaab77db7c67744907fe0be5c54f6b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 455, 1, '0289-0764-6296-5515', 1, TO_TIMESTAMP('2019-10-21 21:19:38', 'YYYY-MM-DD HH24:MI:SS'), '79a5de62ec231cc691572fa6f40a9914');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 456, 1, '5791-7328-3680-6131', 1, TO_TIMESTAMP('2019-10-21 15:14:07', 'YYYY-MM-DD HH24:MI:SS'), 'b07fdfc6abb6e993824d48a08235087f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 457, 1, '1884-7670-1434-8107', 1, TO_TIMESTAMP('2020-06-03 00:47:37', 'YYYY-MM-DD HH24:MI:SS'), '1abdd107b6fc39366903edebbe33c64a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 458, 1, '5555-5018-2903-2250', 1, TO_TIMESTAMP('2020-03-16 13:22:22', 'YYYY-MM-DD HH24:MI:SS'), '480676ad42fef6bac492eaa0b09768a8');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 459, 1, '2433-5872-6802-9897', 1, TO_TIMESTAMP('2019-08-24 00:10:19', 'YYYY-MM-DD HH24:MI:SS'), '3899d21ce4eb41596c940689fbf7bc19');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 460, 1, '6592-9423-9463-8207', 1, TO_TIMESTAMP('2020-10-14 07:24:37', 'YYYY-MM-DD HH24:MI:SS'), '20f59b658f8215a6724891a7f1231337');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 461, 1, '8762-8446-4850-8281', 1, TO_TIMESTAMP('2020-02-04 06:46:57', 'YYYY-MM-DD HH24:MI:SS'), 'c31de8dae2c421eed3849549bf6c0014');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 462, 1, '4652-2931-7060-2968', 1, TO_TIMESTAMP('2021-03-04 08:36:34', 'YYYY-MM-DD HH24:MI:SS'), 'cd6ab49236d135c379715c3108e4d0c7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 463, 1, '2744-1112-3662-4774', 1, TO_TIMESTAMP('2019-09-07 17:15:54', 'YYYY-MM-DD HH24:MI:SS'), 'eea9205ebdc37ddc7c616f73c68e15a7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 464, 1, '0824-9509-1180-9506', 1, TO_TIMESTAMP('2020-06-11 09:12:25', 'YYYY-MM-DD HH24:MI:SS'), 'eeeb5546f31b3765ab9b23f318a7b402');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 465, 1, '0401-9119-4253-1661', 1, TO_TIMESTAMP('2020-12-22 09:53:29', 'YYYY-MM-DD HH24:MI:SS'), 'eaa4b2365c201209a9b79b4c637c4dfc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 466, 1, '7399-5220-2769-2992', 1, TO_TIMESTAMP('2020-07-12 14:43:29', 'YYYY-MM-DD HH24:MI:SS'), '89717acb5dc441232eab6fd13920a1ad');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 467, 1, '7535-9720-6069-2271', 1, TO_TIMESTAMP('2021-01-07 13:05:30', 'YYYY-MM-DD HH24:MI:SS'), 'b3bda9bf1d6dedf42ed6b1c59884fa8f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 468, 1, '7596-2541-4221-2108', 1, TO_TIMESTAMP('2020-08-01 08:57:38', 'YYYY-MM-DD HH24:MI:SS'), '00b69533875257c602993093ff5c057e');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 469, 1, '5841-2397-1913-4784', 1, TO_TIMESTAMP('2019-10-04 05:12:03', 'YYYY-MM-DD HH24:MI:SS'), '21f9b6fabd3b4cc480f999f34164cf91');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 470, 1, '9681-1109-3684-3144', 1, TO_TIMESTAMP('2021-02-08 17:55:07', 'YYYY-MM-DD HH24:MI:SS'), '2dc961ca4f20bb88d52b2f6f0cb08347');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 471, 1, '5246-9853-2915-3092', 1, TO_TIMESTAMP('2019-08-22 17:52:53', 'YYYY-MM-DD HH24:MI:SS'), '8837ab325a03f388894396b728902d0d');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 472, 1, '3075-7682-0084-0943', 1, TO_TIMESTAMP('2021-02-12 05:26:23', 'YYYY-MM-DD HH24:MI:SS'), 'e6ea88089ae58689fe05b180312b523f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 473, 1, '7145-4245-3590-3297', 1, TO_TIMESTAMP('2019-12-21 19:35:27', 'YYYY-MM-DD HH24:MI:SS'), 'b8ed003def64a848e14425b5f2aa502b');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 474, 1, '1344-6137-3594-7739', 1, TO_TIMESTAMP('2020-03-15 04:13:47', 'YYYY-MM-DD HH24:MI:SS'), '668eb43d1c690a362fcbd68fb46786e7');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 475, 1, '2873-1762-4193-1859', 1, TO_TIMESTAMP('2020-07-25 13:50:35', 'YYYY-MM-DD HH24:MI:SS'), '312aa0c7b2a635509e7adbcd292a86e0');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 476, 1, '3664-5733-1274-3068', 1, TO_TIMESTAMP('2019-12-07 06:42:07', 'YYYY-MM-DD HH24:MI:SS'), '313738416f8083e596838f0726c39a42');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 477, 1, '0385-2880-0565-0054', 1, TO_TIMESTAMP('2020-02-13 23:25:56', 'YYYY-MM-DD HH24:MI:SS'), '6a5f888018dec2ec73326d24f4b137d5');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 478, 1, '1982-4021-9076-4987', 1, TO_TIMESTAMP('2020-11-01 04:48:05', 'YYYY-MM-DD HH24:MI:SS'), '3940fe4d6a4f602f77a21832414e8414');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 479, 1, '1566-7824-7687-0005', 1, TO_TIMESTAMP('2019-12-26 12:23:55', 'YYYY-MM-DD HH24:MI:SS'), 'c2ed235fc9861a128a258c6dd9490ce6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 480, 1, '7142-8360-7298-2008', 1, TO_TIMESTAMP('2020-07-02 02:41:13', 'YYYY-MM-DD HH24:MI:SS'), 'eefa3686a0650ae0b131f2e4872e6324');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 481, 1, '2330-5075-4823-9088', 1, TO_TIMESTAMP('2019-10-17 14:23:03', 'YYYY-MM-DD HH24:MI:SS'), 'd9eb2eddba872fc55ec8ad82b180d3f4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 482, 1, '5940-3033-2702-1212', 1, TO_TIMESTAMP('2020-04-12 18:35:03', 'YYYY-MM-DD HH24:MI:SS'), '21e023f2d74a2a4e44ed5cb470a565c4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 483, 1, '1666-5247-0496-0509', 1, TO_TIMESTAMP('2019-12-22 16:03:18', 'YYYY-MM-DD HH24:MI:SS'), 'c873c25c75e40e8b802abf3dc6947e94');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 484, 1, '3152-9344-3907-1615', 1, TO_TIMESTAMP('2019-10-31 00:41:29', 'YYYY-MM-DD HH24:MI:SS'), 'aa8226bac5fc0fd46646600dd314e1bf');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 485, 1, '0560-0384-8159-3576', 1, TO_TIMESTAMP('2020-08-01 12:47:09', 'YYYY-MM-DD HH24:MI:SS'), 'f3f0800c79fbab0c64357fb151073f05');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 486, 1, '2370-7958-3550-2517', 1, TO_TIMESTAMP('2020-08-21 00:56:38', 'YYYY-MM-DD HH24:MI:SS'), '1946b44aa9e66725319f3931fc71cef6');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 487, 1, '7411-3719-0180-2227', 1, TO_TIMESTAMP('2019-07-21 08:37:33', 'YYYY-MM-DD HH24:MI:SS'), '8f68272173b99d3464943f5defa6c3ca');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 488, 1, '0899-4700-6053-8700', 1, TO_TIMESTAMP('2020-04-05 20:46:55', 'YYYY-MM-DD HH24:MI:SS'), 'c6fd13ed6d302f30133468ecc8721a4a');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 489, 1, '1022-9680-8507-8700', 1, TO_TIMESTAMP('2019-11-19 12:18:09', 'YYYY-MM-DD HH24:MI:SS'), 'e88de2f0b446c8d49c30713ee422a643');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 490, 1, '4334-5956-9924-4425', 1, TO_TIMESTAMP('2020-09-08 08:56:01', 'YYYY-MM-DD HH24:MI:SS'), 'b35b8c13f6d83c4f50ff0ef2ffe870a4');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 491, 1, '1836-8744-0093-6994', 1, TO_TIMESTAMP('2019-10-14 16:38:13', 'YYYY-MM-DD HH24:MI:SS'), 'cb6673e610675d56d61525adbd1c7e2c');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 492, 1, '6502-2122-8600-0686', 1, TO_TIMESTAMP('2020-04-07 10:27:01', 'YYYY-MM-DD HH24:MI:SS'), 'f48fcb8ada3bfb63b2404761e0adc699');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 493, 1, '9262-5923-4777-8507', 1, TO_TIMESTAMP('2019-12-05 19:18:41', 'YYYY-MM-DD HH24:MI:SS'), '908e9086f22d8d076a8291f173b96c7f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 494, 1, '4456-2962-7862-1046', 1, TO_TIMESTAMP('2020-11-18 12:56:27', 'YYYY-MM-DD HH24:MI:SS'), '0834e99632cb0a851ca23c2a6c3a0b03');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 495, 1, '1580-2227-3236-7321', 1, TO_TIMESTAMP('2019-12-01 21:23:18', 'YYYY-MM-DD HH24:MI:SS'), 'dc2735af5d4f9435006a7a23816cef5f');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 496, 1, '1349-4926-2610-4017', 1, TO_TIMESTAMP('2020-08-05 12:46:17', 'YYYY-MM-DD HH24:MI:SS'), 'c999066276e010da0755242f4fdaea52');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 497, 1, '5886-5807-3928-2018', 1, TO_TIMESTAMP('2021-01-06 06:41:33', 'YYYY-MM-DD HH24:MI:SS'), '2c3ec8e8e25396cf0b5fe4e406d81f89');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 498, 1, '3943-2013-6121-9244', 1, TO_TIMESTAMP('2019-10-27 01:05:49', 'YYYY-MM-DD HH24:MI:SS'), 'bdb54860a873c73a50b77f75180cb9cc');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 499, 1, '7055-2901-9619-2738', 1, TO_TIMESTAMP('2020-09-17 14:18:00', 'YYYY-MM-DD HH24:MI:SS'), 'b0b897b3daf5f68c52ae5045d7b6e8ac');
insert into user_payment_methods (id, user_id, payment_method_id, card_number, account_user, expiration_date, password) values (user_payment_methods_sec.NEXTVAL, 500, 1, '4428-6739-6143-6541', 1, TO_TIMESTAMP('2019-11-13 06:11:58', 'YYYY-MM-DD HH24:MI:SS'), '67fce3078c54d4ae1970ffac6f55cf4f');

insert into trip_statuses (id, name) VALUES (trip_statuses_sec.NEXTVAL, 'Successful');
insert into trip_statuses (id, name) VALUES (trip_statuses_sec.NEXTVAL, 'Cancelled by user');
insert into trip_statuses (id, name) VALUES (trip_statuses_sec.NEXTVAL, 'Cancelled by driver');
insert into trip_statuses (id, name) VALUES (trip_statuses_sec.NEXTVAL, 'Cancelled by other reason');
insert into trip_statuses (id, name) VALUES (trip_statuses_sec.NEXTVAL, 'In progress');

insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 25 # 52-71', 'Cl 28 # 74-10', TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-11-10 07:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 23.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 41 # 14-04', 'Cl 01 # 75-41', TO_TIMESTAMP('2015-01-11 07:13:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-01-11 08:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 74.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 47 # 12-11', 'Cl 52 # 05-30', TO_TIMESTAMP('2015-02-12 08:14:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-02-12 09:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 14.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 12 # 14-74', 'Cl 52 # 14-51', TO_TIMESTAMP('2015-03-13 09:11:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-03-13 10:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 't', '1', 25.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 78 # 74-71', 'Cl 71 # 71-71', TO_TIMESTAMP('2015-04-14 01:12:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-04-14 02:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 78.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 71 # 71-14', 'Cl 31 # 72-72', TO_TIMESTAMP('2015-05-15 01:13:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-05-15 03:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 42.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 55 # 12-78', 'Cl 31 # 21-21', TO_TIMESTAMP('2015-07-17 02:14:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-07-17 03:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 54.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 14 # 32-10', 'Cl 41 # 71-25', TO_TIMESTAMP('2015-08-18 03:11:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-08-18 04:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 't', '1', 74.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 74 # 41-47', 'Cl 54 # 31-71', TO_TIMESTAMP('2015-09-10 04:12:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-09-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 'f', '1', 12.0);
insert into trips (id, origin, destination, start_date, end_date, driver_car_id, dinamic, trip_status_id, distance_covered) values (trips_sec.NEXTVAL, 'Cr 25 # 71-31', 'Cl 12 # 87-71', TO_TIMESTAMP('2015-10-20 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-10-20 07:11:58', 'YYYY-MM-DD HH24:MI:SS'), 1, 't', '1', 25.0);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:16:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:19:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:20:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 1);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:21:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 1);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:21:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:22:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:23:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:24:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 2);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-01-11 07:25:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 2);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 3);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 3);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 4);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 4);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 5);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 5);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 6);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 6);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 7);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 7);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 8);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 8);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 9);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 9);

insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267958, -75.577195, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577795, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:17:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267358, -75.577595, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267458, -75.577495, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267558, -75.577395, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:12:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267658, -75.577295, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:13:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267758, -75.577395, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:14:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267858, -75.577495, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:15:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267158, -75.577595, 10);
insert into path_details (id, path_date, latitude, longitude, trip_id) values (path_details_sec.NEXTVAL, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6.267258, -75.577395, 10);

insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 1, 1, 1);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 2, 1, 2);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 3, 2, 3);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 4, 2, 4);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 5, 3, 5);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 6, 3, 6);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 7, 4, 7);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 8, 4, 8);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 9, 5, 9);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 10, 5, 10);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 11, 6, 11);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 12, 6, 12);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 13, 7, 13);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 14, 7, 14);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 15, 8, 15);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 16, 8, 16);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 17, 9, 17);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 18, 9, 18);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 19, 10, 19);
insert into trip_users (id, user_id, trip_id, user_payment_method_id) values (trip_users_sec.NEXTVAL, 20, 10, 20);

insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 1, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 2, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 3, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 4, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 5, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 6, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 7, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 8, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 9, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 10, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 11, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 12, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 13, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 14, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 15, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 16, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 17, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 18, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 19, 10000, 1000, 1000, null, 12000);
insert into trip_user_bills (id, trip_user_id, subtotal, surcharges, tip, user_promotion_code_id, total) values (trip_user_bills_sec.NEXTVAL, 20, 10000, 1000, 1000, null, 12000);

insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 1, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 2, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 3, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 4, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 5, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 6, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 7, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 8, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 9, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 10, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 11, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 12, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 13, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 14, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 15, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 16, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 17, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 18, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 19, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
insert into driver_payment_bills (id, trip_user_bill_id, payment_date, uber_fee) values (driver_payment_bills_sec.NEXTVAL, 20, TO_TIMESTAMP('2015-11-10 05:18:58', 'YYYY-MM-DD HH24:MI:SS'), 7000);
