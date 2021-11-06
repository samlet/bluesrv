create table if not exists CONTENT_ASSOC(
    CONTENT_ID String,
    CONTENT_ID_TO String,
    CONTENT_ASSOC_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    CONTENT_ASSOC_PREDICATE_ID String,
    DATA_SOURCE_ID String,
    SEQUENCE_NUM Decimal(16,2) ,
    MAP_KEY String,
    UPPER_COORDINATE Decimal(16,2) ,
    LEFT_COORDINATE Decimal(16,2) ,
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