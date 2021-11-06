create table if not exists AGREEMENT_ITEM(
    AGREEMENT_ID String,
    AGREEMENT_ITEM_SEQ_ID String,
    AGREEMENT_ITEM_TYPE_ID String,
    CURRENCY_UOM_ID String,
    AGREEMENT_TEXT String,
    AGREEMENT_IMAGE **UNK**,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);