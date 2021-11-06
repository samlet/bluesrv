create table if not exists CARRIER_SHIPMENT_METHOD(
    SHIPMENT_METHOD_TYPE_ID String,
    PARTY_ID String,
    ROLE_TYPE_ID String,
    SEQUENCE_NUMBER Decimal(16,2) ,
    CARRIER_SERVICE_CODE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);