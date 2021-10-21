create table if not exists PERSON_TRAINING(
    PARTY_ID String,
    TRAINING_REQUEST_ID String,
    TRAINING_CLASS_TYPE_ID String,
    WORK_EFFORT_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    APPROVER_ID String,
    APPROVAL_STATUS String,
    REASON String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);