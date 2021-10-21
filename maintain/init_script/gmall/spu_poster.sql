create table if not exists spu_poster(
    id Int64,
    spu_id Int64,
    img_name String,
    img_url String,
    create_time Datetime,
    update_time Datetime,
    is_deleted Int32) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);