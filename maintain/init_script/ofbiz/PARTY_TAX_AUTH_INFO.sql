create table if not exists PARTY_TAX_AUTH_INFO(
    PARTY_ID String,
    TAX_AUTH_GEO_ID String,
    TAX_AUTH_PARTY_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    PARTY_TAX_ID String,
    IS_EXEMPT String,
    IS_NEXUS String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);