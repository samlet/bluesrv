create table if not exists WORK_EFFORT_GOOD_STANDARD(
    WORK_EFFORT_ID String,
    PRODUCT_ID String,
    WORK_EFFORT_GOOD_STD_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    STATUS_ID String,
    ESTIMATED_QUANTITY **UNK**,
    ESTIMATED_COST Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);