-- 使用測試用table view
create view
  public.test_idle_assets_view as
select
  a.id,
  a.type as "資產類型",
  a.target_name as "標的名稱",
  d.name as "行政區",
  a.section as "地段",
  a.address as "地址",
  ag.name as "管理機關",
  a.status as "狀態",
  a.coordinates as "定位座標",
  a.area_coordinates as "區域座標組",
  a.created_at as "建立時間"
from
  test_assets a
  left join test_districts d on a.district_id = d.id
  left join test_agencies ag on a.agency_id = ag.id
where
  a.status::text = '未活化'::text
order by
  d.name,
  a.created_at desc;


create view
  public.test_idle_land_assets_view as
select
  a.id as "資產ID",
  ld.id as "土地明細ID",
  d.name as "行政區",
  a.target_name as "標的名稱",
  a.section as "地段",
  a.address as "地址",
  ag.name as "管理機關",
  ld.lot_number as "地號",
  ld.land_type as "土地類型",
  ld.area as "面積(平方公尺)",
  ld.zone_type as "使用分區",
  ld.land_use as "土地用途",
  ld.current_status as "現況",
  ld.vacancy_rate as "空置比例(%)",
  ld.note as "備註",
  a.coordinates::text as "定位座標",
  a.area_coordinates::text as "區域座標組",
  a.status as "狀態",
  a.created_at as "建立時間"
from
  test_assets a
  left join test_districts d on a.district_id = d.id
  left join test_agencies ag on a.agency_id = ag.id
  left join test_land_details ld on a.id = ld.asset_id
where
  a.status::text = '未活化'::text
  and a.type::text = '土地'::text
  and ld.deleted_at is null
order by
  a.id,
  d.name,
  a.section,
  ld.lot_number;

CREATE OR REPLACE VIEW public.test_idle_building_assets_view AS
SELECT
  a.id as "資產ID",
  bd.id as "建物明細ID",
  d.name as "行政區",
  a.target_name as "標的名稱",
  a.section as "地段",
  a.address as "地址",
  ag.name as "管理機關",
  bd.building_number as "建號",
  bd.building_type as "建物類型",
  bd.floor_area as "樓地板面積",
  bd.zone_type as "使用分區",
  bd.land_use as "土地用途",
  bd.current_status as "使用現況",
  bd.vacancy_rate as "空置比例(%)",
  bd.note as "建物備註",
  string_agg(distinct bld.lot_number::text, ', '::text) as "座落地號",
  string_agg(distinct bld.land_type::text, ', '::text) as "土地類型",
  string_agg(distinct bld.land_manager::text, ', '::text) as "土地管理者",
  a.coordinates::text as "定位座標",        -- 使用 ::text 轉換
  a.area_coordinates::text as "區域座標組",  -- 使用 ::text 轉換
  a.status as "活化狀態",
  a.created_at as "建立時間"
FROM
  test_assets a
  LEFT JOIN test_districts d ON a.district_id = d.id
  LEFT JOIN test_agencies ag ON a.agency_id = ag.id
  LEFT JOIN test_building_details bd ON a.id = bd.asset_id
  LEFT JOIN test_building_land_details bld ON a.id = bld.asset_id
WHERE
  a.status::text = '未活化'::text
  AND a.type::text = '建物'::text
  AND bd.deleted_at IS NULL
GROUP BY
  a.id,
  bd.id,
  d.name,
  a.target_name,
  a.section,
  a.address,
  ag.name,
  bd.building_number,
  bd.building_type,
  bd.floor_area,
  bd.zone_type,
  bd.land_use,
  bd.current_status,
  bd.vacancy_rate,
  bd.note,
  a.coordinates::text,        -- GROUP BY 也要使用 ::text
  a.area_coordinates::text,   -- GROUP BY 也要使用 ::text
  a.status,
  a.created_at
ORDER BY
  a.id,
  d.name,
  a.section,
  bd.building_number;
