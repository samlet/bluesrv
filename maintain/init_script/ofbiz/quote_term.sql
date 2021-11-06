create table if not exists QUOTE_TERM(
    TERM_TYPE_ID String,
    QUOTE_ID String,
    QUOTE_ITEM_SEQ_ID String,
    TERM_VALUE Decimal(16,2) ,
    UOM_ID String,
    TERM_DAYS Decimal(16,2) ,
    TEXT_VALUE String,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);