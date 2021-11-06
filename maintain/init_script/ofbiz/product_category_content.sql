create table if not exists PRODUCT_CATEGORY_CONTENT(
    PRODUCT_CATEGORY_ID String,
    CONTENT_ID String,
    PROD_CAT_CONTENT_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    PURCHASE_FROM_DATE Datetime,
    PURCHASE_THRU_DATE Datetime,
    USE_COUNT_LIMIT Decimal(16,2) ,
    USE_DAYS_LIMIT Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);