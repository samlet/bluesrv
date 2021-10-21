create table if not exists coupon_range(
    id Int64,
    coupon_id Int64,
    range_type String,
    range_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);