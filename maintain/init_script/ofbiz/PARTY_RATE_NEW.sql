create table if not exists PARTY_RATE_NEW(
    PARTY_ID String,
    RATE_TYPE_ID String,
    DEFAULT_RATE String,
    PERCENTAGE_USED **UNK**,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);