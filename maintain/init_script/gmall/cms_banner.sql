create table if not exists cms_banner(
    id Int64,
    title String,
    image_url String,
    link_url String,
    sort Int32) engine=MergeTree
partition by toYYYYMMDD(create_time)
primary key (id) order by (id);