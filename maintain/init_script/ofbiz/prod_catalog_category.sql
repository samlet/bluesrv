create table if not exists PROD_CATALOG_CATEGORY(
    PROD_CATALOG_ID String,
    PRODUCT_CATEGORY_ID String,
    PROD_CATALOG_CATEGORY_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    SEQUENCE_NUM Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);