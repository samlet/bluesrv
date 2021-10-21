create table if not exists PARTY_GL_ACCOUNT(
    ORGANIZATION_PARTY_ID String,
    PARTY_ID String,
    ROLE_TYPE_ID String,
    GL_ACCOUNT_TYPE_ID String,
    GL_ACCOUNT_ID String,
    LAST_UPDATED_STAMP Datetime,
    LAST_UPDATED_TX_STAMP Datetime,
    CREATED_STAMP Datetime,
    CREATED_TX_STAMP Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);