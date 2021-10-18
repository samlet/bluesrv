create table if not exists order_detail(
    id Int64,
    order_id Int64,
    sku_id Int64,
    sku_name String,
    img_url String,
    order_price Decimal(16,2) ,
    sku_num String,
    create_time Datetime,
    source_type String,
    source_id Int64,
    split_total_amount Decimal(16,2) ,
    split_activity_amount Decimal(16,2) ,
    split_coupon_amount Decimal(16,2) ) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);