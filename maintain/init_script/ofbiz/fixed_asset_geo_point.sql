create table if not exists FIXED_ASSET_GEO_POINT(
    FIXED_ASSET_ID String,
    GEO_POINT_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);