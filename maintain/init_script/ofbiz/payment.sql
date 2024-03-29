create table if not exists PAYMENT(
    PAYMENT_ID String,
    PAYMENT_TYPE_ID String,
    PAYMENT_METHOD_TYPE_ID String,
    PAYMENT_METHOD_ID String,
    PAYMENT_GATEWAY_RESPONSE_ID String,
    PAYMENT_PREFERENCE_ID String,
    PARTY_ID_FROM String,
    PARTY_ID_TO String,
    ROLE_TYPE_ID_TO String,
    STATUS_ID String,
    EFFECTIVE_DATE Datetime,
    PAYMENT_REF_NUM String,
    AMOUNT Decimal(16,2) ,
    CURRENCY_UOM_ID String,
    COMMENTS String,
    FIN_ACCOUNT_TRANS_ID String,
    OVERRIDE_GL_ACCOUNT_ID String,
    ACTUAL_CURRENCY_AMOUNT Decimal(16,2) ,
    ACTUAL_CURRENCY_UOM_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);