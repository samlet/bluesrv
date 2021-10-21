create table if not exists ware_info(
    id Int64,
    name String,
    address String,
    areacode String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);