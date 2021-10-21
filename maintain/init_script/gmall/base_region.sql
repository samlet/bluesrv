create table if not exists base_region(
    id String,
    region_name String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);