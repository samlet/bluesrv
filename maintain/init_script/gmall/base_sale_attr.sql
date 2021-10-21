create table if not exists base_sale_attr(
    id Int64,
    name String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);