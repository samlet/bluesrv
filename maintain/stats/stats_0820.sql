create table keyword_stats_0820 (
   stt DateTime,
   edt DateTime,
   keyword String ,
   source String ,
   ct UInt64 ,
   ts UInt64
   )engine =ReplacingMergeTree( ts)
   partition by toYYYYMMDD(stt)
   order by ( stt,edt,keyword,source );

create table product_stats_0820 (
    stt DateTime,
    edt DateTime,
    sku_id UInt64,
   sku_name String,
   sku_price Decimal64(2),
   spu_id UInt64,
   spu_name String ,
   tm_id UInt64,
   tm_name String,
   category3_id UInt64,
   category3_name String ,
   display_ct UInt64,
   click_ct UInt64,
   favor_ct UInt64,
   cart_ct UInt64,
   order_sku_num UInt64,
   order_amount Decimal64(2),
   order_ct UInt64 ,
   payment_amount Decimal64(2),
   paid_order_ct UInt64,
   refund_order_ct UInt64,
refund_amount Decimal64(2),
   comment_ct UInt64,
   good_comment_ct UInt64 ,
   ts UInt64
)engine =ReplacingMergeTree( ts)
partition by toYYYYMMDD(stt)
order by (stt,edt,sku_id );

create table province_stats_0820 ( stt DateTime,
edt DateTime,
province_id UInt64, province_name String,
area_code String ,
   iso_code String,
   iso_3166_2 String ,
   order_amount Decimal64(2),
   order_count UInt64 ,
   ts UInt64
)engine =ReplacingMergeTree( ts)
partition by toYYYYMMDD(stt)
order by (stt,edt,province_id );

create table visitor_stats_0820 ( stt DateTime,
edt DateTime, vc String, ch String ,
ar String , is_new String , uv_ct UInt64, pv_ct UInt64,
sv_ct UInt64, uj_ct UInt64, dur_sum UInt64, ts UInt64
) engine =ReplacingMergeTree( ts)
partition by toYYYYMMDD(stt)
order by ( stt,edt,is_new,vc,ch,ar);

