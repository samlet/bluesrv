create table if not exists ORDER_ITEM_PRICE_INFO(
    ORDER_ITEM_PRICE_INFO_ID String,
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    PRODUCT_PRICE_RULE_ID String,
    PRODUCT_PRICE_ACTION_SEQ_ID String,
    MODIFY_AMOUNT Decimal(16,2) ,
    DESCRIPTION String,
    RATE_CODE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);