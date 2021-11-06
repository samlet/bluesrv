create table if not exists AGREEMENT_TERM(
    AGREEMENT_TERM_ID String,
    TERM_TYPE_ID String,
    AGREEMENT_ID String,
    AGREEMENT_ITEM_SEQ_ID String,
    INVOICE_ITEM_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    TERM_VALUE Decimal(16,2) ,
    TERM_DAYS Decimal(16,2) ,
    TEXT_VALUE String,
    MIN_QUANTITY **UNK**,
    MAX_QUANTITY **UNK**,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);