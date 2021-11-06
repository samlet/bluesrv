create table if not exists PRODUCT_PRICE_COND(
    PRODUCT_PRICE_RULE_ID String,
    PRODUCT_PRICE_COND_SEQ_ID String,
    INPUT_PARAM_ENUM_ID String,
    OPERATOR_ENUM_ID String,
    COND_VALUE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);