create table if not exists PRODUCT_PROMO_CATEGORY(
    PRODUCT_PROMO_ID String,
    PRODUCT_PROMO_RULE_ID String,
    PRODUCT_PROMO_ACTION_SEQ_ID String,
    PRODUCT_PROMO_COND_SEQ_ID String,
    PRODUCT_CATEGORY_ID String,
    AND_GROUP_ID String,
    PRODUCT_PROMO_APPL_ENUM_ID String,
    INCLUDE_SUB_CATEGORIES String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);