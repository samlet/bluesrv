create table if not exists FACILITY_CONTACT_MECH(
    FACILITY_ID String,
    CONTACT_MECH_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    EXTENSION String,
    COMMENTS String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);