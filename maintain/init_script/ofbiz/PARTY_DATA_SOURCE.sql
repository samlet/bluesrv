create table if not exists PARTY_DATA_SOURCE(
    PARTY_ID String,
    DATA_SOURCE_ID String,
    FROM_DATE Datetime,
    VISIT_ID String,
    COMMENTS String,
    IS_CREATE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);