create table if not exists PRODUCT_PROMO_CODE(
    PRODUCT_PROMO_CODE_ID String,
    PRODUCT_PROMO_ID String,
    USER_ENTERED String,
    REQUIRE_EMAIL_OR_PARTY String,
    USE_LIMIT_PER_CODE Decimal(16,2) ,
    USE_LIMIT_PER_CUSTOMER Decimal(16,2) ,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
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