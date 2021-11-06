create table if not exists INVOICE(
    INVOICE_ID String,
    INVOICE_TYPE_ID String,
    PARTY_ID_FROM String,
    PARTY_ID String,
    ROLE_TYPE_ID String,
    STATUS_ID String,
    BILLING_ACCOUNT_ID String,
    CONTACT_MECH_ID String,
    INVOICE_DATE Datetime,
    DUE_DATE Datetime,
    PAID_DATE Datetime,
    INVOICE_MESSAGE String,
    REFERENCE_NUMBER String,
    DESCRIPTION String,
    CURRENCY_UOM_ID String,
    RECURRENCE_INFO_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);