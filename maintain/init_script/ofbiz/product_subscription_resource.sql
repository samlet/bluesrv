create table if not exists PRODUCT_SUBSCRIPTION_RESOURCE(
    PRODUCT_ID String,
    SUBSCRIPTION_RESOURCE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    PURCHASE_FROM_DATE Datetime,
    PURCHASE_THRU_DATE Datetime,
    MAX_LIFE_TIME Decimal(16,2) ,
    MAX_LIFE_TIME_UOM_ID String,
    AVAILABLE_TIME Decimal(16,2) ,
    AVAILABLE_TIME_UOM_ID String,
    USE_COUNT_LIMIT Decimal(16,2) ,
    USE_TIME Decimal(16,2) ,
    USE_TIME_UOM_ID String,
    USE_ROLE_TYPE_ID String,
    AUTOMATIC_EXTEND String,
    CANCL_AUTM_EXT_TIME Decimal(16,2) ,
    CANCL_AUTM_EXT_TIME_UOM_ID String,
    GRACE_PERIOD_ON_EXPIRY Decimal(16,2) ,
    GRACE_PERIOD_ON_EXPIRY_UOM_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);