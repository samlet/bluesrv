create table if not exists AGREEMENT(
    AGREEMENT_ID String,
    PRODUCT_ID String,
    PARTY_ID_FROM String,
    PARTY_ID_TO String,
    ROLE_TYPE_ID_FROM String,
    ROLE_TYPE_ID_TO String,
    AGREEMENT_TYPE_ID String,
    AGREEMENT_DATE Datetime,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    DESCRIPTION String,
    TEXT_DATA String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime,
    STATUS_ID String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);