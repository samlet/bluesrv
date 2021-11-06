create table if not exists ORDER_ITEM_SHIP_GRP_INV_RES(
    ORDER_ID String,
    SHIP_GROUP_SEQ_ID String,
    ORDER_ITEM_SEQ_ID String,
    INVENTORY_ITEM_ID String,
    RESERVE_ORDER_ENUM_ID String,
    QUANTITY Decimal(16,2) ,
    QUANTITY_NOT_AVAILABLE Decimal(16,2) ,
    RESERVED_DATETIME Datetime,
    CREATED_DATETIME Datetime,
    PROMISED_DATETIME Datetime,
    CURRENT_PROMISED_DATE Datetime,
    PRIORITY String,
    SEQUENCE_ID Decimal(16,2) ,
    PICK_START_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);