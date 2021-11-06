create table if not exists PRODUCT_PROMO_COND(
    PRODUCT_PROMO_ID String,
    PRODUCT_PROMO_RULE_ID String,
    PRODUCT_PROMO_COND_SEQ_ID String,
    CUSTOM_METHOD_ID String,
    INPUT_PARAM_ENUM_ID String,
    OPERATOR_ENUM_ID String,
    COND_VALUE String,
    OTHER_VALUE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);