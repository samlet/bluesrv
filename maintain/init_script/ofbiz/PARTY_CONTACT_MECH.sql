create table if not exists PARTY_CONTACT_MECH(
    PARTY_ID String,
    CONTACT_MECH_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    ROLE_TYPE_ID String,
    ALLOW_SOLICITATION String,
    EXTENSION String,
    VERIFIED String,
    COMMENTS String,
    YEARS_WITH_CONTACT_MECH Decimal(16,2) ,
    MONTHS_WITH_CONTACT_MECH Decimal(16,2) ,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);