create table if not exists base_attr_value(
    id Int64,
    value_name String,
    attr_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);