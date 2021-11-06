create table if not exists PRODUCT_CONTENT(
    PRODUCT_ID String,
    CONTENT_ID String,
    PRODUCT_CONTENT_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    PURCHASE_FROM_DATE Datetime,
    PURCHASE_THRU_DATE Datetime,
    USE_COUNT_LIMIT Decimal(16,2) ,
    USE_TIME Decimal(16,2) ,
    USE_TIME_UOM_ID String,
    USE_ROLE_TYPE_ID String,
    SEQUENCE_NUM Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);