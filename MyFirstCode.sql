SELECT  city
      , count( suburb ) as countrec_suburb
      , count( distinct suburb) as countdist_suburb
FROM    (
          SELECT      'Sydney' as City, 'Randwick' as suburb
          UNION ALL
          SELECT      'Sydney' as City, 'Kensington' as suburb
          UNION ALL
          SELECT      'Sydney' as City, 'Kensington' as suburb
          UNION ALL
          SELECT      'Sydney' as City, 'Kensington' as suburb
          UNION ALL
          SELECT      'Sydney' as City, 'Kensington' as suburb
          )      
GROUP BY    city          
;



SELECT      
            line_item_id
        ,   name                            as line_item_name
        ,   count( distinct advertiser )    as cntdistinct_advertiser
        ,   count( distinct size )          as cntdistinct_size
        ,   count( distinct placement_id )  as cntdistinct_placement_id -- I put a comment on it
        ,   count( distinct country )       as cntdistinct_country
        ,   count( distinct city )          as cntdistinct_city
        ,   count( distinct region )        as cntdistinct_region
        ,   count( distinct device_type )   as cntdistinct_device_type
        
FROM        bidopt.tbl_dbm_line_items_v2
GROUP BY    
            line_item_id
        ,   name;
-- Sure one line_item_id has one name, one advertiser, and one size.
-- But one line_item_id can appear on many country, city, region, device type
-- 
-- line_item_id	line_item_name	cntdistinct_advertiser	cntdistinct_size	cntdistinct_country	cntdistinct_city	cntdistinct_region	cntdistinct_device_type
-- 9021651	FF_Display_Standard_Buy_Sale_20161028_Prospecting_50M_300x600	1	1	1	9	4	1
-- 9027980	FF_Display_Standard_Buy_Sale_20161028_Prospecting_LAL_300x250_mobile	1	1	1	6	4	2
-- 9021653	FF_Display_Standard_Buy_Sale_20161028_Prospecting_cluster1_160x600	1	1	1	8	4	1
