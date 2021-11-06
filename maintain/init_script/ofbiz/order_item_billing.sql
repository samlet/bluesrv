create table if not exists ORDER_ITEM_BILLING(
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    INVOICE_ID String,
    INVOICE_ITEM_SEQ_ID String,
    ITEM_ISSUANCE_ID String,
    SHIPMENT_RECEIPT_ID String,
    QUANTITY Decimal(16,2) ,
    AMOUNT Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);