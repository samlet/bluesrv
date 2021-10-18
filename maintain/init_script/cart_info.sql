create table if not exists cart_info(
    id Int64,
    user_id String,
    sku_id Int64,
    cart_price Decimal(16,2) ,
    sku_num Int32,
    img_url String,
    sku_name String,
    is_checked Int32,
    create_time Datetime,
    operate_time Datetime,
    is_ordered Int64,
    order_time Datetime,
    source_type String,
    source_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);