create table if not exists ITEM_ISSUANCE(
    ITEM_ISSUANCE_ID String,
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    SHIP_GROUP_SEQ_ID String,
    INVENTORY_ITEM_ID String,
    SHIPMENT_ID String,
    SHIPMENT_ITEM_SEQ_ID String,
    FIXED_ASSET_ID String,
    MAINT_HIST_SEQ_ID String,
    ISSUED_DATE_TIME Datetime,
    ISSUED_BY_USER_LOGIN_ID String,
    QUANTITY Decimal(16,2) ,
    CANCEL_QUANTITY Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);