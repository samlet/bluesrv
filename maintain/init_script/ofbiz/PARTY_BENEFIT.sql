create table if not exists PARTY_BENEFIT(
    ROLE_TYPE_ID_FROM String,
    ROLE_TYPE_ID_TO String,
    PARTY_ID_FROM String,
    PARTY_ID_TO String,
    BENEFIT_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    PERIOD_TYPE_ID String,
    COST Decimal(16,2) ,
    ACTUAL_EMPLOYER_PAID_PERCENT **UNK**,
    AVAILABLE_TIME Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);