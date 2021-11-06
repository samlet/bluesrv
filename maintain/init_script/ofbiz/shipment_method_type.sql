create table if not exists SHIPMENT_METHOD_TYPE(
    SHIPMENT_METHOD_TYPE_ID String,
    DESCRIPTION String,
    SEQUENCE_NUM Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);