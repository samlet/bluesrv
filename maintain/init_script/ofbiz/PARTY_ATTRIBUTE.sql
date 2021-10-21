create table if not exists PARTY_ATTRIBUTE(
    PARTY_ID String,
    ATTR_NAME String,
    ATTR_VALUE String,
    ATTR_DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);