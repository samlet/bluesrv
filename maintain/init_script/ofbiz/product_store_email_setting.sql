create table if not exists PRODUCT_STORE_EMAIL_SETTING(
    PRODUCT_STORE_ID String,
    EMAIL_TYPE String,
    BODY_SCREEN_LOCATION String,
    XSLFO_ATTACH_SCREEN_LOCATION String,
    FROM_ADDRESS String,
    CC_ADDRESS String,
    BCC_ADDRESS String,
    SUBJECT String,
    CONTENT_TYPE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);