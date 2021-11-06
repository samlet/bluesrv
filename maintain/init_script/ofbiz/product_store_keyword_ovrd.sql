create table if not exists PRODUCT_STORE_KEYWORD_OVRD(
    PRODUCT_STORE_ID String,
    KEYWORD String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    TARGET String,
    TARGET_TYPE_ENUM_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);