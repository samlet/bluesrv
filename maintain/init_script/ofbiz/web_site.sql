create table if not exists WEB_SITE(
    WEB_SITE_ID String,
    SITE_NAME String,
    HTTP_HOST String,
    HTTP_PORT String,
    HTTPS_HOST String,
    HTTPS_PORT String,
    ENABLE_HTTPS String,
    WEBAPP_PATH String,
    STANDARD_CONTENT_PREFIX String,
    SECURE_CONTENT_PREFIX String,
    COOKIE_DOMAIN String,
    VISUAL_THEME_SET_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime,
    PRODUCT_STORE_ID String,
    ALLOW_PRODUCT_STORE_CHANGE String,
    HOSTED_PATH_ALIAS String,
    IS_DEFAULT String,
    DISPLAY_MAINTENANCE_PAGE String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);