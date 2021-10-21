create table if not exists PARTY_SKILL(
    PARTY_ID String,
    SKILL_TYPE_ID String,
    YEARS_EXPERIENCE Decimal(16,2) ,
    RATING Decimal(16,2) ,
    SKILL_LEVEL Decimal(16,2) ,
    STARTED_USING_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);