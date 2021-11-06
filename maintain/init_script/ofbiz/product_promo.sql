create table if not exists PRODUCT_PROMO(
    PRODUCT_PROMO_ID String,
    PROMO_NAME String,
    PROMO_TEXT String,
    USER_ENTERED String,
    SHOW_TO_CUSTOMER String,
    REQUIRE_CODE String,
    USE_LIMIT_PER_ORDER Decimal(16,2) ,
    USE_LIMIT_PER_CUSTOMER Decimal(16,2) ,
    USE_LIMIT_PER_PROMOTION Decimal(16,2) ,
    BILLBACK_FACTOR Decimal(16,2) ,
    OVERRIDE_ORG_PARTY_ID String,
    CREATED_DATE Datetime,
    CREATED_BY_USER_LOGIN String,
    LAST_MODIFIED_DATE Datetime,
    LAST_MODIFIED_BY_USER_LOGIN String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);