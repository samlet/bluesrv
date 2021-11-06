create table if not exists CONTACT_MECH(
    CONTACT_MECH_ID String,
    CONTACT_MECH_TYPE_ID String,
    INFO_STRING String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);