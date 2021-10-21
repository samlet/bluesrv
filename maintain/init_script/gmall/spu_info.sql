create table if not exists spu_info(
    id Int64,
    spu_name String,
    description String,
    category3_id Int64,
    tm_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);