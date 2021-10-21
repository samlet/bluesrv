create table if not exists PARTY_CLASSIFICATION_TYPE(
    PARTY_CLASSIFICATION_TYPE_ID String,
    PARENT_TYPE_ID String,
    HAS_TABLE String,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);