create table if not exists SHIPMENT_PACKAGE(
    SHIPMENT_ID String,
    SHIPMENT_PACKAGE_SEQ_ID String,
    SHIPMENT_BOX_TYPE_ID String,
    DATE_CREATED Datetime,
    BOX_LENGTH Decimal(16,2) ,
    BOX_HEIGHT Decimal(16,2) ,
    BOX_WIDTH Decimal(16,2) ,
    DIMENSION_UOM_ID String,
    WEIGHT Decimal(16,2) ,
    WEIGHT_UOM_ID String,
    INSURED_VALUE Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);