create table if not exists PRODUCT_FEATURE_APPL(
    PRODUCT_ID String,
    PRODUCT_FEATURE_ID String,
    PRODUCT_FEATURE_APPL_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    SEQUENCE_NUM Decimal(16,2) ,
    AMOUNT Decimal(16,2) ,
    RECURRING_AMOUNT Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);