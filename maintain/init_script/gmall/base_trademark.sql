create table if not exists base_trademark(
    id Int64,
    tm_name String,
    logo_url String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);