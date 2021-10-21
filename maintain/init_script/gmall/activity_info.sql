create table if not exists activity_info(
    id Int64,
    activity_name String,
    activity_type String,
    activity_desc String,
    start_time Datetime,
    end_time Datetime,
    create_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);