create table if not exists CUST_REQUEST_ITEM(
    CUST_REQUEST_ID String,
    CUST_REQUEST_ITEM_SEQ_ID String,
    CUST_REQUEST_RESOLUTION_ID String,
    STATUS_ID String,
    PRIORITY Decimal(16,2) ,
    SEQUENCE_NUM Decimal(16,2) ,
    REQUIRED_BY_DATE Datetime,
    PRODUCT_ID String,
    QUANTITY Decimal(16,2) ,
    SELECTED_AMOUNT Decimal(16,2) ,
    MAXIMUM_AMOUNT Decimal(16,2) ,
    RESERV_START Datetime,
    RESERV_LENGTH Decimal(16,2) ,
    RESERV_PERSONS Decimal(16,2) ,
    CONFIG_ID String,
    DESCRIPTION String,
    STORY String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);