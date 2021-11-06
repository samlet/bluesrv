create table if not exists ORDER_HEADER(
    ORDER_ID String,
    ORDER_TYPE_ID String,
    ORDER_NAME String,
    EXTERNAL_ID String,
    SALES_CHANNEL_ENUM_ID String,
    ORDER_DATE Datetime,
    PRIORITY String,
    ENTRY_DATE Datetime,
    PICK_SHEET_PRINTED_DATE Datetime,
    VISIT_ID String,
    STATUS_ID String,
    CREATED_BY String,
    FIRST_ATTEMPT_ORDER_ID String,
    CURRENCY_UOM String,
    SYNC_STATUS_ID String,
    BILLING_ACCOUNT_ID String,
    ORIGIN_FACILITY_ID String,
    WEB_SITE_ID String,
    PRODUCT_STORE_ID String,
    AGREEMENT_ID String,
    TERMINAL_ID String,
    TRANSACTION_ID String,
    AUTO_ORDER_SHOPPING_LIST_ID String,
    NEEDS_INVENTORY_ISSUANCE String,
    IS_RUSH_ORDER String,
    INTERNAL_CODE String,
    REMAINING_SUB_TOTAL Decimal(16,2) ,
    GRAND_TOTAL Decimal(16,2) ,
    IS_VIEWED String,
    INVOICE_PER_SHIPMENT String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);