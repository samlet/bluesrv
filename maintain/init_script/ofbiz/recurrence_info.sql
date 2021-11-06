create table if not exists RECURRENCE_INFO(
    RECURRENCE_INFO_ID String,
    START_DATE_TIME Datetime,
    EXCEPTION_DATE_TIMES String,
    RECURRENCE_DATE_TIMES String,
    EXCEPTION_RULE_ID String,
    RECURRENCE_RULE_ID String,
    RECURRENCE_COUNT Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);