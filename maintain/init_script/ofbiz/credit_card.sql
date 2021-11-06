create table if not exists CREDIT_CARD(
    PAYMENT_METHOD_ID String,
    CARD_TYPE String,
    CARD_NUMBER String,
    VALID_FROM_DATE String,
    EXPIRE_DATE String,
    ISSUE_NUMBER String,
    COMPANY_NAME_ON_CARD String,
    TITLE_ON_CARD String,
    FIRST_NAME_ON_CARD String,
    MIDDLE_NAME_ON_CARD String,
    LAST_NAME_ON_CARD String,
    SUFFIX_ON_CARD String,
    CONTACT_MECH_ID String,
    CONSECUTIVE_FAILED_AUTHS Decimal(16,2) ,
    LAST_FAILED_AUTH_DATE Datetime,
    CONSECUTIVE_FAILED_NSF Decimal(16,2) ,
    LAST_FAILED_NSF_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);