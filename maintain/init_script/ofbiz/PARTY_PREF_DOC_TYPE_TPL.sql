create table if not exists PARTY_PREF_DOC_TYPE_TPL(
    PARTY_PREF_DOC_TYPE_TPL_ID String,
    PARTY_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    INVOICE_TYPE_ID String,
    ORDER_TYPE_ID String,
    QUOTE_TYPE_ID String,
    CUSTOM_SCREEN_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);