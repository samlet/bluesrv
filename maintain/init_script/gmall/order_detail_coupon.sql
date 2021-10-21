create table if not exists order_detail_coupon(
    id Int64,
    order_id Int64,
    order_detail_id Int64,
    coupon_id Int64,
    coupon_use_id Int64,
    sku_id Int64,
    create_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);