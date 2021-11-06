create table if not exists PRODUCT_REVIEW(
    PRODUCT_REVIEW_ID String,
    PRODUCT_STORE_ID String,
    PRODUCT_ID String,
    USER_LOGIN_ID String,
    STATUS_ID String,
    POSTED_ANONYMOUS String,
    POSTED_DATE_TIME Datetime,
    PRODUCT_RATING Decimal(16,2) ,
    PRODUCT_REVIEW String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);