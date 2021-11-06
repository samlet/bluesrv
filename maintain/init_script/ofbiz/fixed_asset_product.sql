create table if not exists FIXED_ASSET_PRODUCT(
    FIXED_ASSET_ID String,
    PRODUCT_ID String,
    FIXED_ASSET_PRODUCT_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    COMMENTS String,
    SEQUENCE_NUM Decimal(16,2) ,
    QUANTITY Decimal(16,2) ,
    QUANTITY_UOM_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);