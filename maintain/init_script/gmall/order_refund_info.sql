create table if not exists order_refund_info(
    id Int64,
    user_id Int64,
    order_id Int64,
    sku_id Int64,
    refund_type String,
    refund_num Int64,
    refund_amount Decimal(16,2) ,
    refund_reason_type String,
    refund_reason_txt String,
    refund_status String,
    create_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);