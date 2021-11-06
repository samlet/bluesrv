create table if not exists CONTENT(
    CONTENT_ID String,
    CONTENT_TYPE_ID String,
    OWNER_CONTENT_ID String,
    DECORATOR_CONTENT_ID String,
    INSTANCE_OF_CONTENT_ID String,
    DATA_RESOURCE_ID String,
    TEMPLATE_DATA_RESOURCE_ID String,
    DATA_SOURCE_ID String,
    STATUS_ID String,
    PRIVILEGE_ENUM_ID String,
    SERVICE_NAME String,
    CUSTOM_METHOD_ID String,
    CONTENT_NAME String,
    DESCRIPTION String,
    LOCALE_STRING String,
    MIME_TYPE_ID String,
    CHARACTER_SET_ID String,
    CHILD_LEAF_COUNT Decimal(16,2) ,
    CHILD_BRANCH_COUNT Decimal(16,2) ,
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