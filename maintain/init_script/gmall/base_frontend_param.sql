create table if not exists base_frontend_param(
    id Int64,
    code String,
    delete_id Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);