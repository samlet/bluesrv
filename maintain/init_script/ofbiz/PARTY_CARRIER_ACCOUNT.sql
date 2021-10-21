create table if not exists PARTY_CARRIER_ACCOUNT(
    PARTY_ID String,
    CARRIER_PARTY_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    ACCOUNT_NUMBER String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);