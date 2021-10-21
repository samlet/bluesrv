create table if not exists base_category_view(
    id Int64,
    category1_id Int64,
    category1_name String,
    category2_id Int64,
    category2_name String,
    category3_id Int64,
    category3_name String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);