create table if not exists sku_info(
    id Int64,
    spu_id Int64,
    price Decimal(16,2) ,
    sku_name String,
    sku_desc String,
    weight Decimal(16,2) ,
    tm_id Int64,
    category3_id Int64,
    sku_default_img String,
    is_sale Int32,
    create_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);