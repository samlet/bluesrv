create table if not exists ware_order_task_detail(
    id Int64,
    sku_id Int64,
    sku_name String,
    sku_num Int32,
    task_id Int64,
    refund_status String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);