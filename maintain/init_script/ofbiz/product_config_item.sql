create table if not exists PRODUCT_CONFIG_ITEM(
    CONFIG_ITEM_ID String,
    CONFIG_ITEM_TYPE_ID String,
    CONFIG_ITEM_NAME String,
    DESCRIPTION String,
    LONG_DESCRIPTION String,
    IMAGE_URL String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);