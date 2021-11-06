create table if not exists PRODUCT_CONFIG_PRODUCT(
    CONFIG_ITEM_ID String,
    CONFIG_OPTION_ID String,
    PRODUCT_ID String,
    QUANTITY Decimal(16,2) ,
    SEQUENCE_NUM Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);