create table if not exists addresses(
    id Int32,
    user_id Int32,
    email_address String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);