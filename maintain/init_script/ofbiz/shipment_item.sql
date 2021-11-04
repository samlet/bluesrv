create table if not exists SHIPMENT_ITEM(
    SHIPMENT_ID String,
    SHIPMENT_ITEM_SEQ_ID String,
    PRODUCT_ID String,
    QUANTITY Decimal(16,2) ,
    SHIPMENT_CONTENT_DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);