create table if not exists PROD_CATALOG(
    PROD_CATALOG_ID String,
    CATALOG_NAME String,
    USE_QUICK_ADD String,
    STYLE_SHEET String,
    HEADER_LOGO String,
    CONTENT_PATH_PREFIX String,
    TEMPLATE_PATH_PREFIX String,
    VIEW_ALLOW_PERM_REQD String,
    PURCHASE_ALLOW_PERM_REQD String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);