create table if not exists SHIPMENT_RECEIPT(
    RECEIPT_ID String,
    INVENTORY_ITEM_ID String,
    PRODUCT_ID String,
    SHIPMENT_ID String,
    SHIPMENT_ITEM_SEQ_ID String,
    SHIPMENT_PACKAGE_SEQ_ID String,
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    RETURN_ID String,
    RETURN_ITEM_SEQ_ID String,
    REJECTION_ID String,
    RECEIVED_BY_USER_LOGIN_ID String,
    DATETIME_RECEIVED Datetime,
    ITEM_DESCRIPTION String,
    QUANTITY_ACCEPTED Decimal(16,2) ,
    QUANTITY_REJECTED Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);