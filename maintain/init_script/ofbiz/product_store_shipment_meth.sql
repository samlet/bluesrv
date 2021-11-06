create table if not exists PRODUCT_STORE_SHIPMENT_METH(
    PRODUCT_STORE_SHIP_METH_ID String,
    PRODUCT_STORE_ID String,
    SHIPMENT_METHOD_TYPE_ID String,
    PARTY_ID String,
    ROLE_TYPE_ID String,
    COMPANY_PARTY_ID String,
    MIN_WEIGHT Decimal(16,2) ,
    MAX_WEIGHT Decimal(16,2) ,
    MIN_SIZE Decimal(16,2) ,
    MAX_SIZE Decimal(16,2) ,
    MIN_TOTAL Decimal(16,2) ,
    MAX_TOTAL Decimal(16,2) ,
    ALLOW_USPS_ADDR String,
    REQUIRE_USPS_ADDR String,
    ALLOW_COMPANY_ADDR String,
    REQUIRE_COMPANY_ADDR String,
    INCLUDE_NO_CHARGE_ITEMS String,
    INCLUDE_FEATURE_GROUP String,
    EXCLUDE_FEATURE_GROUP String,
    INCLUDE_GEO_ID String,
    EXCLUDE_GEO_ID String,
    SERVICE_NAME String,
    CONFIG_PROPS String,
    SHIPMENT_CUSTOM_METHOD_ID String,
    SHIPMENT_GATEWAY_CONFIG_ID String,
    SEQUENCE_NUMBER Decimal(16,2) ,
    ALLOWANCE_PERCENT Decimal(16,2) ,
    MINIMUM_PRICE Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);