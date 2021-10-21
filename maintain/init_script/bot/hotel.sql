create table if not exists hotel(
    id Int32,
    name String,
    city String,
    price_range String,
    breakfast_included **UNK**,
    free_wifi **UNK**,
    swimming_pool **UNK**,
    star_rating Int32) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);