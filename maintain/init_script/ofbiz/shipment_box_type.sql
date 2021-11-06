create table if not exists SHIPMENT_BOX_TYPE(
    SHIPMENT_BOX_TYPE_ID String,
    DESCRIPTION String,
    DIMENSION_UOM_ID String,
    BOX_LENGTH Decimal(16,2) ,
    BOX_WIDTH Decimal(16,2) ,
    BOX_HEIGHT Decimal(16,2) ,
    WEIGHT_UOM_ID String,
    BOX_WEIGHT Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);