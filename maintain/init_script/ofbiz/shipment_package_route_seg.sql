create table if not exists SHIPMENT_PACKAGE_ROUTE_SEG(
    SHIPMENT_ID String,
    SHIPMENT_PACKAGE_SEQ_ID String,
    SHIPMENT_ROUTE_SEGMENT_ID String,
    TRACKING_CODE String,
    BOX_NUMBER String,
    LABEL_IMAGE **UNK**,
    LABEL_INTL_SIGN_IMAGE **UNK**,
    LABEL_HTML String,
    LABEL_PRINTED String,
    INTERNATIONAL_INVOICE **UNK**,
    PACKAGE_TRANSPORT_COST Decimal(16,2) ,
    PACKAGE_SERVICE_COST Decimal(16,2) ,
    PACKAGE_OTHER_COST Decimal(16,2) ,
    COD_AMOUNT Decimal(16,2) ,
    INSURED_AMOUNT Decimal(16,2) ,
    CURRENCY_UOM_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);