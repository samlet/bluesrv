create table if not exists PARTY_STATUS(
    STATUS_ID String,
    PARTY_ID String,
    STATUS_DATE Datetime,
    CHANGE_BY_USER_LOGIN_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);