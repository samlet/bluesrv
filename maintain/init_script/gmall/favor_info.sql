create table if not exists favor_info(
    id Int64,
    user_id Int64,
    sku_id Int64,
    spu_id Int64,
    is_cancel String,
    create_time Datetime,
    cancel_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);