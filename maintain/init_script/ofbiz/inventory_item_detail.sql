create table if not exists INVENTORY_ITEM_DETAIL(
    INVENTORY_ITEM_ID String,
    INVENTORY_ITEM_DETAIL_SEQ_ID String,
    EFFECTIVE_DATE Datetime,
    QUANTITY_ON_HAND_DIFF Decimal(16,2) ,
    AVAILABLE_TO_PROMISE_DIFF Decimal(16,2) ,
    ACCOUNTING_QUANTITY_DIFF Decimal(16,2) ,
    UNIT_COST Decimal(16,2) ,
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    SHIP_GROUP_SEQ_ID String,
    SHIPMENT_ID String,
    SHIPMENT_ITEM_SEQ_ID String,
    RETURN_ID String,
    RETURN_ITEM_SEQ_ID String,
    WORK_EFFORT_ID String,
    FIXED_ASSET_ID String,
    MAINT_HIST_SEQ_ID String,
    ITEM_ISSUANCE_ID String,
    RECEIPT_ID String,
    PHYSICAL_INVENTORY_ID String,
    REASON_ENUM_ID String,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);