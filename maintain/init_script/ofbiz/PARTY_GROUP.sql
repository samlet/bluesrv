create table if not exists PARTY_GROUP(
    PARTY_ID String,
    GROUP_NAME String,
    GROUP_NAME_LOCAL String,
    OFFICE_SITE_NAME String,
    ANNUAL_REVENUE Decimal(16,2) ,
    NUM_EMPLOYEES Decimal(16,2) ,
    TICKER_SYMBOL String,
    COMMENTS String,
    LOGO_IMAGE_URL String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);