create table if not exists base_province(
    id Int64,
    name String,
    region_id String,
    area_code String,
    iso_code String,
    iso_3166_2 String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);