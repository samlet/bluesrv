create table if not exists AGREEMENT_PRODUCT_APPL(
    AGREEMENT_ID String,
    AGREEMENT_ITEM_SEQ_ID String,
    PRODUCT_ID String,
    PRICE Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);