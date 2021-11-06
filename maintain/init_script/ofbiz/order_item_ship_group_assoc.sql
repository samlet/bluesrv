create table if not exists ORDER_ITEM_SHIP_GROUP_ASSOC(
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    SHIP_GROUP_SEQ_ID String,
    QUANTITY Decimal(16,2) ,
    CANCEL_QUANTITY Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);