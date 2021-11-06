create table if not exists PRODUCT_FACILITY_LOCATION(
    PRODUCT_ID String,
    FACILITY_ID String,
    LOCATION_SEQ_ID String,
    MINIMUM_STOCK Decimal(16,2) ,
    MOVE_QUANTITY Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);