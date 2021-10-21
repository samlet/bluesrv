create table if not exists PARTY(
    PARTY_ID String,
    PARTY_TYPE_ID String,
    EXTERNAL_ID String,
    PREFERRED_CURRENCY_UOM_ID String,
    DESCRIPTION String,
    STATUS_ID String,
    CREATED_DATE Datetime,
    CREATED_BY_USER_LOGIN String,
    LAST_MODIFIED_DATE Datetime,
    LAST_MODIFIED_BY_USER_LOGIN String,
    DATA_SOURCE_ID String,
    IS_UNREAD String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);