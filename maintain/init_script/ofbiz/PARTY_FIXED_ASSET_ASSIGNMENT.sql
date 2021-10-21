create table if not exists PARTY_FIXED_ASSET_ASSIGNMENT(
    PARTY_ID String,
    ROLE_TYPE_ID String,
    FIXED_ASSET_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    ALLOCATED_DATE Datetime,
    STATUS_ID String,
    COMMENTS String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);