create table if not exists PRODUCT_PROMO_RULE(
    PRODUCT_PROMO_ID String,
    PRODUCT_PROMO_RULE_ID String,
    RULE_NAME String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);