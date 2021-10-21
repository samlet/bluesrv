create table if not exists refund_payment(
    id Int32,
    out_trade_no String,
    order_id Int64,
    sku_id Int64,
    payment_type String,
    trade_no String,
    total_amount Decimal(16,2) ,
    subject String,
    refund_status String,
    create_time Datetime,
    callback_time Datetime,
    callback_content String) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);