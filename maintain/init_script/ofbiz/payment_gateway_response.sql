create table if not exists PAYMENT_GATEWAY_RESPONSE(
    PAYMENT_GATEWAY_RESPONSE_ID String,
    PAYMENT_SERVICE_TYPE_ENUM_ID String,
    ORDER_PAYMENT_PREFERENCE_ID String,
    PAYMENT_METHOD_TYPE_ID String,
    PAYMENT_METHOD_ID String,
    TRANS_CODE_ENUM_ID String,
    AMOUNT Decimal(16,2) ,
    CURRENCY_UOM_ID String,
    REFERENCE_NUM String,
    ALT_REFERENCE String,
    SUB_REFERENCE String,
    GATEWAY_CODE String,
    GATEWAY_FLAG String,
    GATEWAY_AVS_RESULT String,
    GATEWAY_CV_RESULT String,
    GATEWAY_SCORE_RESULT String,
    GATEWAY_MESSAGE String,
    TRANSACTION_DATE Datetime,
    RESULT_DECLINED String,
    RESULT_NSF String,
    RESULT_BAD_EXPIRE String,
    RESULT_BAD_CARD_NUMBER String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);