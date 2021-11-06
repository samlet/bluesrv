create table if not exists PRODUCT_FEATURE_IACTN(
    PRODUCT_FEATURE_ID String,
    PRODUCT_FEATURE_ID_TO String,
    PRODUCT_FEATURE_IACTN_TYPE_ID String,
    PRODUCT_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);