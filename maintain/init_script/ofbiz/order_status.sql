create table if not exists ORDER_STATUS(
    ORDER_STATUS_ID String,
    STATUS_ID String,
    ORDER_ID String,
    ORDER_ITEM_SEQ_ID String,
    ORDER_PAYMENT_PREFERENCE_ID String,
    STATUS_DATETIME Datetime,
    STATUS_USER_LOGIN String,
    CHANGE_REASON String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);