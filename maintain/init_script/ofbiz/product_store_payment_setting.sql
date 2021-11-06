create table if not exists PRODUCT_STORE_PAYMENT_SETTING(
    PRODUCT_STORE_ID String,
    PAYMENT_METHOD_TYPE_ID String,
    PAYMENT_SERVICE_TYPE_ENUM_ID String,
    PAYMENT_SERVICE String,
    PAYMENT_CUSTOM_METHOD_ID String,
    PAYMENT_GATEWAY_CONFIG_ID String,
    PAYMENT_PROPERTIES_PATH String,
    APPLY_TO_ALL_PRODUCTS String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);