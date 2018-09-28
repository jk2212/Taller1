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
    latitude    DECIMAL NOT NULL,
    longitude   DECIMAL NOT NULL,
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
    id             NUMERIC NOT NULL,
    trip_user_id   NUMERIC NOT NULL,
    subtotal       DECIMAL NOT NULL,
    surcharges     DECIMAL NOT NULL,
    tip            DECIMAL NOT NULL,
    total          DECIMAL NOT NULL
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
    "distance covered"   DECIMAL
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
INSERT INTO service_types(id, name) VALUES (service_types_sec.NEXTVAL, 'Uber X');
INSERT INTO service_types(id, name) VALUES (service_types_sec.NEXTVAL, 'Uber Black');

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

