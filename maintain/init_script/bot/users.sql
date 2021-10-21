create table if not exists users(
    id Int32,
    name String,
    fullname String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);