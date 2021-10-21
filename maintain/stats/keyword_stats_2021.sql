create table keyword_stats_2021 (
   stt DateTime,
   edt DateTime,
   keyword String ,
   source String ,
   ct UInt64 ,
   ts UInt64
   )engine =ReplacingMergeTree( ts)
   partition by toYYYYMMDD(stt)
   order by ( stt,edt,keyword,source );
