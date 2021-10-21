create table if not exists base_category2(
    id Int64,
    name String,
    category1_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);