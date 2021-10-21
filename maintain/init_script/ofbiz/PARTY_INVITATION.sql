create table if not exists PARTY_INVITATION(
    PARTY_INVITATION_ID String,
    PARTY_ID_FROM String,
    PARTY_ID String,
    TO_NAME String,
    EMAIL_ADDRESS String,
    STATUS_ID String,
    LAST_INVITE_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);