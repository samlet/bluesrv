create table if not exists SHIPMENT_ROUTE_SEGMENT(
    SHIPMENT_ID String,
    SHIPMENT_ROUTE_SEGMENT_ID String,
    DELIVERY_ID String,
    ORIGIN_FACILITY_ID String,
    DEST_FACILITY_ID String,
    ORIGIN_CONTACT_MECH_ID String,
    ORIGIN_TELECOM_NUMBER_ID String,
    DEST_CONTACT_MECH_ID String,
    DEST_TELECOM_NUMBER_ID String,
    CARRIER_PARTY_ID String,
    SHIPMENT_METHOD_TYPE_ID String,
    CARRIER_SERVICE_STATUS_ID String,
    CARRIER_DELIVERY_ZONE String,
    CARRIER_RESTRICTION_CODES String,
    CARRIER_RESTRICTION_DESC String,
    BILLING_WEIGHT Decimal(16,2) ,
    BILLING_WEIGHT_UOM_ID String,
    ACTUAL_TRANSPORT_COST Decimal(16,2) ,
    ACTUAL_SERVICE_COST Decimal(16,2) ,
    ACTUAL_OTHER_COST Decimal(16,2) ,
    ACTUAL_COST Decimal(16,2) ,
    CURRENCY_UOM_ID String,
    ACTUAL_START_DATE Datetime,
    ACTUAL_ARRIVAL_DATE Datetime,
    ESTIMATED_START_DATE Datetime,
    ESTIMATED_ARRIVAL_DATE Datetime,
    TRACKING_ID_NUMBER String,
    TRACKING_DIGEST String,
    UPDATED_BY_USER_LOGIN_ID String,
    LAST_UPDATED_DATE Datetime,
    HOME_DELIVERY_TYPE String,
    HOME_DELIVERY_DATE Datetime,
    THIRD_PARTY_ACCOUNT_NUMBER String,
    THIRD_PARTY_POSTAL_CODE String,
    THIRD_PARTY_COUNTRY_GEO_CODE String,
    UPS_HIGH_VALUE_REPORT **UNK**,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);