create table if not exists PRODUCT_CATEGORY(
    PRODUCT_CATEGORY_ID String,
    PRODUCT_CATEGORY_TYPE_ID String,
    PRIMARY_PARENT_CATEGORY_ID String,
    CATEGORY_NAME String,
    DESCRIPTION String,
    LONG_DESCRIPTION String,
    CATEGORY_IMAGE_URL String,
    LINK_ONE_IMAGE_URL String,
    LINK_TWO_IMAGE_URL String,
    DETAIL_SCREEN String,
    SHOW_IN_SELECT String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);