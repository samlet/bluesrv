create table if not exists PRODUCT_PROMO_ACTION(
    PRODUCT_PROMO_ID String,
    PRODUCT_PROMO_RULE_ID String,
    PRODUCT_PROMO_ACTION_SEQ_ID String,
    PRODUCT_PROMO_ACTION_ENUM_ID String,
    CUSTOM_METHOD_ID String,
    ORDER_ADJUSTMENT_TYPE_ID String,
    SERVICE_NAME String,
    QUANTITY Decimal(16,2) ,
    AMOUNT Decimal(16,2) ,
    PRODUCT_ID String,
    PARTY_ID String,
    USE_CART_QUANTITY String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);