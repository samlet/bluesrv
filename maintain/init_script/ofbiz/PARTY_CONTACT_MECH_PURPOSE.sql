create table if not exists PARTY_CONTACT_MECH_PURPOSE(
    PARTY_ID String,
    CONTACT_MECH_ID String,
    CONTACT_MECH_PURPOSE_TYPE_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);