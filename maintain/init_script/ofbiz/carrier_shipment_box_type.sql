create table if not exists CARRIER_SHIPMENT_BOX_TYPE(
    SHIPMENT_BOX_TYPE_ID String,
    PARTY_ID String,
    PACKAGING_TYPE_CODE String,
    OVERSIZE_CODE String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);