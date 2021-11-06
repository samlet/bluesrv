create table if not exists PAYMENT_APPLICATION(
    PAYMENT_APPLICATION_ID String,
    PAYMENT_ID String,
    INVOICE_ID String,
    INVOICE_ITEM_SEQ_ID String,
    BILLING_ACCOUNT_ID String,
    OVERRIDE_GL_ACCOUNT_ID String,
    TO_PAYMENT_ID String,
    TAX_AUTH_GEO_ID String,
    AMOUNT_APPLIED Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);