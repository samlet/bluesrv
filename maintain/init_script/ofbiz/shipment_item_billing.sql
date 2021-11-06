create table if not exists SHIPMENT_ITEM_BILLING(
    SHIPMENT_ID String,
    SHIPMENT_ITEM_SEQ_ID String,
    INVOICE_ID String,
    INVOICE_ITEM_SEQ_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);