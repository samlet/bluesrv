create table if not exists FACILITY_LOCATION(
    FACILITY_ID String,
    LOCATION_SEQ_ID String,
    LOCATION_TYPE_ENUM_ID String,
    AREA_ID String,
    AISLE_ID String,
    SECTION_ID String,
    LEVEL_ID String,
    POSITION_ID String,
    GEO_POINT_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);