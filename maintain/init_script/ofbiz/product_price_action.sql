create table if not exists PRODUCT_PRICE_ACTION(
    PRODUCT_PRICE_RULE_ID String,
    PRODUCT_PRICE_ACTION_SEQ_ID String,
    PRODUCT_PRICE_ACTION_TYPE_ID String,
    AMOUNT Decimal(16,2) ,
    RATE_CODE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);