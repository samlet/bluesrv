create table if not exists QUOTE_ROLE(
    QUOTE_ID String,
    PARTY_ID String,
    ROLE_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);