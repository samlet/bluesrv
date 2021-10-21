create table if not exists activity_rule(
    id Int32,
    activity_id Int32,
    activity_type String,
    condition_amount Decimal(16,2) ,
    condition_num Int64,
    benefit_amount Decimal(16,2) ,
    benefit_discount Decimal(16,2) ,
    benefit_level Int64) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);