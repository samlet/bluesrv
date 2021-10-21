create table if not exists spu_sale_attr_value(
    id Int64,
    spu_id Int64,
    base_sale_attr_id Int64,
    sale_attr_value_name String,
    sale_attr_name String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);