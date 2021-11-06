create table if not exists SUBSCRIPTION_RESOURCE(
    SUBSCRIPTION_RESOURCE_ID String,
    PARENT_RESOURCE_ID String,
    DESCRIPTION String,
    CONTENT_ID String,
    WEB_SITE_ID String,
    SERVICE_NAME_ON_EXPIRY String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);