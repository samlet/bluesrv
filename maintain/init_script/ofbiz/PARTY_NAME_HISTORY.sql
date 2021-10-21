create table if not exists PARTY_NAME_HISTORY(
    PARTY_ID String,
    CHANGE_DATE Datetime,
    GROUP_NAME String,
    FIRST_NAME String,
    MIDDLE_NAME String,
    LAST_NAME String,
    PERSONAL_TITLE String,
    SUFFIX String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);