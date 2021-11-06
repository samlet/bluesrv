create table if not exists PRODUCT_CATEGORY_LINK(
    PRODUCT_CATEGORY_ID String,
    LINK_SEQ_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    COMMENTS String,
    SEQUENCE_NUM Decimal(16,2) ,
    TITLE_TEXT String,
    DETAIL_TEXT String,
    IMAGE_URL String,
    IMAGE_TWO_URL String,
    LINK_TYPE_ENUM_ID String,
    LINK_INFO String,
    DETAIL_SUB_SCREEN String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);