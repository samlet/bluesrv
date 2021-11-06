create table if not exists PRODUCT_ASSOC(
    PRODUCT_ID String,
    PRODUCT_ID_TO String,
    PRODUCT_ASSOC_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    SEQUENCE_NUM Decimal(16,2) ,
    REASON String,
    QUANTITY Decimal(16,2) ,
    SCRAP_FACTOR Decimal(16,2) ,
    INSTRUCTION String,
    ROUTING_WORK_EFFORT_ID String,
    ESTIMATE_CALC_METHOD String,
    RECURRENCE_INFO_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);