create table if not exists CUST_REQUEST_TYPE(
    CUST_REQUEST_TYPE_ID String,
    PARENT_TYPE_ID String,
    HAS_TABLE String,
    DESCRIPTION String,
    PARTY_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);