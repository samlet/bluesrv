create table if not exists PARTY_INVITATION_GROUP_ASSOC(
    PARTY_INVITATION_ID String,
    PARTY_ID_TO String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);