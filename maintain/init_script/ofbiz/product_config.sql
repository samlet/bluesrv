create table if not exists PRODUCT_CONFIG(
    PRODUCT_ID String,
    CONFIG_ITEM_ID String,
    SEQUENCE_NUM Decimal(16,2) ,
    FROM_DATE Datetime,
    DESCRIPTION String,
    LONG_DESCRIPTION String,
    CONFIG_TYPE_ID String,
    DEFAULT_CONFIG_OPTION_ID String,
    THRU_DATE Datetime,
    IS_MANDATORY String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);