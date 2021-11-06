create table if not exists ORDER_ADJUSTMENT_BILLING(
    ORDER_ADJUSTMENT_ID String,
    INVOICE_ID String,
    INVOICE_ITEM_SEQ_ID String,
    AMOUNT Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);