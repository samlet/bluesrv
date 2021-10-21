create table if not exists PARTY_QUAL(
    PARTY_ID String,
    PARTY_QUAL_TYPE_ID String,
    QUALIFICATION_DESC String,
    TITLE String,
    STATUS_ID String,
    VERIF_STATUS_ID String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);