create table if not exists PRODUCT_FACILITY(
    PRODUCT_ID String,
    FACILITY_ID String,
    MINIMUM_STOCK Decimal(16,2) ,
    REORDER_QUANTITY Decimal(16,2) ,
    DAYS_TO_SHIP Decimal(16,2) ,
    LAST_INVENTORY_COUNT Decimal(16,2) ,
    REQUIREMENT_METHOD_ENUM_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);