create table if not exists base_dic(
    id String,
    dic_name String,
    parent_code String,
    create_time Datetime,
    operate_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);