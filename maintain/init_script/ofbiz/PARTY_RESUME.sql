create table if not exists PARTY_RESUME(
    RESUME_ID String,
    PARTY_ID String,
    CONTENT_ID String,
    RESUME_DATE Datetime,
    RESUME_TEXT String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);