create table if not exists PARTY_IDENTIFICATION(
    PARTY_ID String,
    PARTY_IDENTIFICATION_TYPE_ID String,
    ID_VALUE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);