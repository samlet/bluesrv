create table if not exists coupon_use(
    id Int64,
    coupon_id Int64,
    user_id Int64,
    order_id Int64,
    coupon_status String,
    get_time Datetime,
    using_time Datetime,
    used_time Datetime,
    expire_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);