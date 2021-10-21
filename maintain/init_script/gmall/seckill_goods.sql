create table if not exists seckill_goods(
    id Int64,
    spu_id Int64,
    sku_id Int64,
    sku_name String,
    sku_default_img String,
    price Decimal(16,2) ,
    cost_price Decimal(16,2) ,
    create_time Datetime,
    check_time Datetime,
    status String,
    start_time Datetime,
    end_time Datetime,
    num Int32,
    stock_count Int32,
    sku_desc String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);