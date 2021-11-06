create table if not exists PRODUCT_STORE_ROLE(
    PARTY_ID String,
    ROLE_TYPE_ID String,
    PRODUCT_STORE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    SEQUENCE_NUM Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);