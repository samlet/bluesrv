create table if not exists activity_sku(
    id Int64,
    activity_id Int64,
    sku_id Int64,
    create_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);