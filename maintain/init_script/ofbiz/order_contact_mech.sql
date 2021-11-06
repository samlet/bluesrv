create table if not exists ORDER_CONTACT_MECH(
    ORDER_ID String,
    CONTACT_MECH_PURPOSE_TYPE_ID String,
    CONTACT_MECH_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);