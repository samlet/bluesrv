create table if not exists base_attr_info(
    id Int64,
    attr_name String,
    category_id Int64,
    category_level Int32) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);