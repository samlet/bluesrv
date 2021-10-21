create table if not exists PARTY_CLASSIFICATION_GROUP(
    PARTY_CLASSIFICATION_GROUP_ID String,
    PARTY_CLASSIFICATION_TYPE_ID String,
    PARENT_GROUP_ID String,
    DESCRIPTION String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);