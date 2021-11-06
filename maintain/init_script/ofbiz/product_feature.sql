create table if not exists PRODUCT_FEATURE(
    PRODUCT_FEATURE_ID String,
    PRODUCT_FEATURE_TYPE_ID String,
    PRODUCT_FEATURE_CATEGORY_ID String,
    DESCRIPTION String,
    UOM_ID String,
    NUMBER_SPECIFIED Decimal(16,2) ,
    DEFAULT_AMOUNT Decimal(16,2) ,
    DEFAULT_SEQUENCE_NUM Decimal(16,2) ,
    ABBREV String,
    ID_CODE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);