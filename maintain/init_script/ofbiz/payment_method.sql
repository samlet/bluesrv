create table if not exists PAYMENT_METHOD(
    PAYMENT_METHOD_ID String,
    PAYMENT_METHOD_TYPE_ID String,
    PARTY_ID String,
    GL_ACCOUNT_ID String,
    FIN_ACCOUNT_ID String,
    DESCRIPTION String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);