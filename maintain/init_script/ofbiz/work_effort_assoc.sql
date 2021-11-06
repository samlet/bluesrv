create table if not exists WORK_EFFORT_ASSOC(
    WORK_EFFORT_ID_FROM String,
    WORK_EFFORT_ID_TO String,
    WORK_EFFORT_ASSOC_TYPE_ID String,
    SEQUENCE_NUM Decimal(16,2) ,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);