create table if not exists comment_info(
    id Int64,
    user_id Int64,
    nick_name String,
    head_img String,
    sku_id Int64,
    spu_id Int64,
    order_id Int64,
    appraise String,
    comment_txt String,
    create_time Datetime,
    operate_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);