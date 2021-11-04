create table if not exists USER_LOGIN(
    USER_LOGIN_ID String,
    CURRENT_PASSWORD String,
    PASSWORD_HINT String,
    IS_SYSTEM String,
    ENABLED String,
    HAS_LOGGED_OUT String,
    REQUIRE_PASSWORD_CHANGE String,
    LAST_CURRENCY_UOM String,
    LAST_LOCALE String,
    LAST_TIME_ZONE String,
    DISABLED_DATE_TIME Datetime,
    SUCCESSIVE_FAILED_LOGINS Decimal(16,2) ,
    EXTERNAL_AUTH_ID String,
    USER_LDAP_DN String,
    DISABLED_BY String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime,
    PARTY_ID String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);