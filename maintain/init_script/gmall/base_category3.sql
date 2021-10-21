create table if not exists base_category3(
    id Int64,
    name String,
    category2_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);