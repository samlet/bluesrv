create table if not exists sku_image(
    id Int64,
    sku_id Int64,
    img_name String,
    img_url String,
    spu_img_id Int64,
    is_default String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);