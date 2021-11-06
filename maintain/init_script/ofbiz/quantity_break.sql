create table if not exists QUANTITY_BREAK(
    QUANTITY_BREAK_ID String,
    QUANTITY_BREAK_TYPE_ID String,
    FROM_QUANTITY Decimal(16,2) ,
    THRU_QUANTITY Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);