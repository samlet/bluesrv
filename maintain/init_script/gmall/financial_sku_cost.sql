create table if not exists financial_sku_cost(
    id String,
    sku_id Int64,
    sku_name String,
    busi_date String,
    is_lastest String,
    sku_cost Decimal(16,2) ,
    create_time Datetime) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);