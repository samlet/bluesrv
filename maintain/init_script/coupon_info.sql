create table if not exists coupon_info(
    id Int64,
    coupon_name String,
    coupon_type String,
    condition_amount Decimal(16,2) ,
    condition_num Int64,
    activity_id Int64,
    benefit_amount Decimal(16,2) ,
    benefit_discount Decimal(16,2) ,
    create_time Datetime,
    range_type String,
    limit_num Int32,
    taken_count Int32,
    start_time Datetime,
    end_time Datetime,
    operate_time Datetime,
    expire_time Datetime,
    range_desc String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);