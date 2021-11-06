create table if not exists CUST_REQUEST(
    CUST_REQUEST_ID String,
    CUST_REQUEST_TYPE_ID String,
    CUST_REQUEST_CATEGORY_ID String,
    STATUS_ID String,
    FROM_PARTY_ID String,
    PRIORITY Decimal(16,2) ,
    CUST_REQUEST_DATE Datetime,
    RESPONSE_REQUIRED_DATE Datetime,
    CUST_REQUEST_NAME String,
    DESCRIPTION String,
    MAXIMUM_AMOUNT_UOM_ID String,
    PRODUCT_STORE_ID String,
    SALES_CHANNEL_ENUM_ID String,
    FULFILL_CONTACT_MECH_ID String,
    CURRENCY_UOM_ID String,
    OPEN_DATE_TIME Datetime,
    CLOSED_DATE_TIME Datetime,
    INTERNAL_COMMENT String,
    REASON String,
    CREATED_DATE Datetime,
    CREATED_BY_USER_LOGIN String,
    LAST_MODIFIED_DATE Datetime,
    LAST_MODIFIED_BY_USER_LOGIN String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);