create table if not exists ware_sku(
    id Int64,
    sku_id Int64,
    warehouse_id Int64,
    stock Int32,
    stock_name String,
    stock_locked Int32) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);