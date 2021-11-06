create table if not exists PRODUCT_FEATURE_PRICE(
    PRODUCT_FEATURE_ID String,
    PRODUCT_PRICE_TYPE_ID String,
    CURRENCY_UOM_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    PRICE Decimal(16,2) ,
    CREATED_DATE Datetime,
    CREATED_BY_USER_LOGIN String,
    LAST_MODIFIED_DATE Datetime,
    LAST_MODIFIED_BY_USER_LOGIN String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);