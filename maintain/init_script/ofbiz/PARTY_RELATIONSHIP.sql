create table if not exists PARTY_RELATIONSHIP(
    PARTY_ID_FROM String,
    PARTY_ID_TO String,
    ROLE_TYPE_ID_FROM String,
    ROLE_TYPE_ID_TO String,
    FROM_DATE Datetime,
    THRU_DATE Datetime,
    STATUS_ID String,
    RELATIONSHIP_NAME String,
    SECURITY_GROUP_ID String,
    PRIORITY_TYPE_ID String,
    PARTY_RELATIONSHIP_TYPE_ID String,
    PERMISSIONS_ENUM_ID String,
    POSITION_TITLE String,
    COMMENTS String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);