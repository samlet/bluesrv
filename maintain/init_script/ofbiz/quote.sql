create table if not exists QUOTE(
    QUOTE_ID String,
    QUOTE_TYPE_ID String,
    PARTY_ID String,
    ISSUE_DATE Datetime,
    STATUS_ID String,
    CURRENCY_UOM_ID String,
    PRODUCT_STORE_ID String,
    SALES_CHANNEL_ENUM_ID String,
    VALID_FROM_DATE Datetime,
    VALID_THRU_DATE Datetime,
    QUOTE_NAME String,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);