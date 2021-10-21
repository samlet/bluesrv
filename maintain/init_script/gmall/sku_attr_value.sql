create table if not exists sku_attr_value(
    id Int64,
    attr_id Int64,
    value_id Int64,
    sku_id Int64,
    attr_name String,
    value_name String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);