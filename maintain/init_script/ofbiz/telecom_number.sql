create table if not exists TELECOM_NUMBER(
    CONTACT_MECH_ID String,
    COUNTRY_CODE String,
    AREA_CODE String,
    CONTACT_NUMBER String,
    ASK_FOR_NAME String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);