create table if not exists restaurant(
    id Int32,
    name String,
    cuisine String,
    price_range String,
    outside_seating **UNK**) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);