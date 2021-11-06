create table if not exists RECURRENCE_RULE(
    RECURRENCE_RULE_ID String,
    FREQUENCY String,
    UNTIL_DATE_TIME Datetime,
    COUNT_NUMBER Decimal(16,2) ,
    INTERVAL_NUMBER Decimal(16,2) ,
    BY_SECOND_LIST String,
    BY_MINUTE_LIST String,
    BY_HOUR_LIST String,
    BY_DAY_LIST String,
    BY_MONTH_DAY_LIST String,
    BY_YEAR_DAY_LIST String,
    BY_WEEK_NO_LIST String,
    BY_MONTH_LIST String,
    BY_SET_POS_LIST String,
    WEEK_START String,
    X_NAME String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);