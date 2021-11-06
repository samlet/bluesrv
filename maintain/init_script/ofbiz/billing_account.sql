create table if not exists BILLING_ACCOUNT(
    BILLING_ACCOUNT_ID String,
    ACCOUNT_LIMIT Decimal(16,2) ,
    ACCOUNT_CURRENCY_UOM_ID String,
    CONTACT_MECH_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    DESCRIPTION String,
    EXTERNAL_ACCOUNT_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);