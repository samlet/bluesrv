create table if not exists SHIPMENT_PACKAGE_CONTENT(
    SHIPMENT_ID String,
    SHIPMENT_PACKAGE_SEQ_ID String,
    SHIPMENT_ITEM_SEQ_ID String,
    QUANTITY Decimal(16,2) ,
    SUB_PRODUCT_ID String,
    SUB_PRODUCT_QUANTITY Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);