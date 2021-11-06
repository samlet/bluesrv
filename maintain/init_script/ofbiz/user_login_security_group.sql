create table if not exists USER_LOGIN_SECURITY_GROUP(
    USER_LOGIN_ID String,
    GROUP_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);