create table if not exists user_address(
    id Int64,
    user_id Int64,
    province_id Int64,
    user_address String,
    consignee String,
    phone_num String,
    is_default String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);