create table if not exists spu_image(
    id Int64,
    spu_id Int64,
    img_name String,
    img_url String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);