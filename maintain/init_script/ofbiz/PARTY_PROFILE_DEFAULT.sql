create table if not exists PARTY_PROFILE_DEFAULT(
    PARTY_ID String,
    PRODUCT_STORE_ID String,
    DEFAULT_SHIP_ADDR String,
    DEFAULT_BILL_ADDR String,
    DEFAULT_PAY_METH String,
    DEFAULT_SHIP_METH String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);