create table if not exists user_info(
    id Int64,
    login_name String,
    nick_name String,
    passwd String,
    name String,
    phone_num String,
    email String,
    head_img String,
    user_level String,
    birthday **UNK**,
    gender String,
    create_time Datetime,
    operate_time Datetime,
    status String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);