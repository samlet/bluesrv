create table if not exists order_status_log(
    id Int64,
    order_id Int64,
    order_status String,
    operate_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);