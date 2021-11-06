create table if not exists WEB_ANALYTICS_CONFIG(
    WEB_SITE_ID String,
    WEB_ANALYTICS_TYPE_ID String,
    WEB_ANALYTICS_CODE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);