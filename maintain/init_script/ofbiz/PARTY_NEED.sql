create table if not exists PARTY_NEED(
    PARTY_NEED_ID String,
    PARTY_ID String,
    ROLE_TYPE_ID String,
    PARTY_TYPE_ID String,
    NEED_TYPE_ID String,
    COMMUNICATION_EVENT_ID String,
    PRODUCT_ID String,
    PRODUCT_CATEGORY_ID String,
    VISIT_ID String,
    DATETIME_RECORDED Datetime,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);