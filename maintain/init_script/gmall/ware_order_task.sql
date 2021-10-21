create table if not exists ware_order_task(
    id Int64,
    order_id Int64,
    consignee String,
    consignee_tel String,
    delivery_address String,
    order_comment String,
    payment_way String,
    task_status String,
    order_body String,
    tracking_no String,
    create_time Datetime,
    ware_id Int64,
    task_comment String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);