-- 複製 districts 表
CREATE TABLE test_districts (LIKE districts INCLUDING ALL);

-- 複製 agencies 表
CREATE TABLE test_agencies (LIKE agencies INCLUDING ALL);

-- 複製 assets 表 (需要先建立 PostGIS 擴充)
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE TABLE test_assets (LIKE assets INCLUDING ALL);

-- 複製 land_details 表
CREATE TABLE test_land_details (LIKE land_details INCLUDING ALL);

-- 複製 building_details 表
CREATE TABLE test_building_details (LIKE building_details INCLUDING ALL);

-- 複製 building_land_details 表
CREATE TABLE test_building_land_details (LIKE building_land_details INCLUDING ALL);

-- 複製 usage_types 表
CREATE TABLE test_usage_types (LIKE usage_types INCLUDING ALL);

-- 複製 activated_assets 表
CREATE TABLE test_activated_assets (LIKE activated_assets INCLUDING ALL);

-- 複製 activated_asset_demand_agencies 表
CREATE TABLE test_activated_asset_demand_agencies (LIKE activated_asset_demand_agencies INCLUDING ALL);

-- 複製 activation_history 表
CREATE TABLE test_activation_history (LIKE activation_history INCLUDING ALL);

-- 複製 asset_cases 表
CREATE TABLE test_asset_cases (LIKE asset_cases INCLUDING ALL);

-- 複製 case_meeting_conclusions 表
CREATE TABLE test_case_meeting_conclusions (LIKE case_meeting_conclusions INCLUDING ALL);

-- 複製 case_tasks 表
CREATE TABLE test_case_tasks (LIKE case_tasks INCLUDING ALL);

-- 更新外鍵參照
ALTER TABLE test_assets
    DROP CONSTRAINT IF EXISTS test_assets_agency_id_fkey,
    DROP CONSTRAINT IF EXISTS test_assets_district_id_fkey,
    ADD CONSTRAINT test_assets_agency_id_fkey FOREIGN KEY (agency_id) REFERENCES test_agencies(id),
    ADD CONSTRAINT test_assets_district_id_fkey FOREIGN KEY (district_id) REFERENCES test_districts(id);

ALTER TABLE test_land_details
    DROP CONSTRAINT IF EXISTS test_land_details_asset_id_fkey,
    ADD CONSTRAINT test_land_details_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES test_assets(id);

ALTER TABLE test_building_details
    DROP CONSTRAINT IF EXISTS test_building_details_asset_id_fkey,
    ADD CONSTRAINT test_building_details_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES test_assets(id);

ALTER TABLE test_building_land_details
    DROP CONSTRAINT IF EXISTS test_building_land_details_asset_id_fkey,
    ADD CONSTRAINT test_building_land_details_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES test_assets(id);

ALTER TABLE test_activated_assets
    DROP CONSTRAINT IF EXISTS test_activated_assets_asset_id_fkey,
    DROP CONSTRAINT IF EXISTS test_activated_assets_usage_type_id_fkey,
    ADD CONSTRAINT test_activated_assets_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES test_assets(id),
    ADD CONSTRAINT test_activated_assets_usage_type_id_fkey FOREIGN KEY (usage_type_id) REFERENCES test_usage_types(id);

ALTER TABLE test_activated_asset_demand_agencies
    DROP CONSTRAINT IF EXISTS test_activated_asset_demand_agencies_activated_asset_id_fkey,
    DROP CONSTRAINT IF EXISTS test_activated_asset_demand_agencies_agency_id_fkey,
    ADD CONSTRAINT test_activated_asset_demand_agencies_activated_asset_id_fkey FOREIGN KEY (activated_asset_id) REFERENCES test_activated_assets(id),
    ADD CONSTRAINT test_activated_asset_demand_agencies_agency_id_fkey FOREIGN KEY (agency_id) REFERENCES test_agencies(id);

ALTER TABLE test_activation_history
    DROP CONSTRAINT IF EXISTS test_activation_history_asset_id_fkey,
    DROP CONSTRAINT IF EXISTS test_activation_history_activated_asset_id_fkey,
    ADD CONSTRAINT test_activation_history_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES test_assets(id),
    ADD CONSTRAINT test_activation_history_activated_asset_id_fkey FOREIGN KEY (activated_asset_id) REFERENCES test_activated_assets(id);

ALTER TABLE test_asset_cases
    DROP CONSTRAINT IF EXISTS test_asset_cases_asset_id_fkey,
    DROP CONSTRAINT IF EXISTS test_asset_cases_purpose_type_id_fkey,
    ADD CONSTRAINT test_asset_cases_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES test_assets(id),
    ADD CONSTRAINT test_asset_cases_purpose_type_id_fkey FOREIGN KEY (purpose_type_id) REFERENCES test_usage_types(id);

ALTER TABLE test_case_meeting_conclusions
    DROP CONSTRAINT IF EXISTS test_case_meeting_conclusions_case_id_fkey,
    ADD CONSTRAINT test_case_meeting_conclusions_case_id_fkey FOREIGN KEY (case_id) REFERENCES test_asset_cases(id);

ALTER TABLE test_case_tasks
    DROP CONSTRAINT IF EXISTS test_case_tasks_case_id_fkey,
    DROP CONSTRAINT IF EXISTS test_case_tasks_agency_id_fkey,
    ADD CONSTRAINT test_case_tasks_case_id_fkey FOREIGN KEY (case_id) REFERENCES test_asset_cases(id),
    ADD CONSTRAINT test_case_tasks_agency_id_fkey FOREIGN KEY (agency_id) REFERENCES test_agencies(id);

-- 複製資料
-- 由於表之間有外鍵關係，需要按照正確的順序複製資料

-- 1. 複製獨立表（沒有外鍵依賴的表）
INSERT INTO test_districts (id, name, note)
SELECT id, name, note FROM districts;

INSERT INTO test_agencies (id, name, note)
SELECT id, name, note FROM agencies;

INSERT INTO test_usage_types (id, name, note)
SELECT id, name, note FROM usage_types;

-- 2. 複製有外鍵依賴的表
INSERT INTO test_assets
SELECT * FROM assets;

INSERT INTO test_land_details
SELECT * FROM land_details;

INSERT INTO test_building_details
SELECT * FROM building_details;

INSERT INTO test_building_land_details
SELECT * FROM building_land_details;

INSERT INTO test_activated_assets
SELECT * FROM activated_assets;

INSERT INTO test_activated_asset_demand_agencies
SELECT * FROM activated_asset_demand_agencies;

INSERT INTO test_activation_history
SELECT * FROM activation_history;

INSERT INTO test_asset_cases
SELECT * FROM asset_cases;

INSERT INTO test_case_meeting_conclusions
SELECT * FROM case_meeting_conclusions;

INSERT INTO test_case_tasks
SELECT * FROM case_tasks;


-- 為測試表添加描述
COMMENT ON TABLE test_districts IS 'test-行政區資料表';
COMMENT ON TABLE test_agencies IS 'test-管理機關資料表';
COMMENT ON TABLE test_assets IS 'test-資產資料表';
COMMENT ON TABLE test_land_details IS 'test-土地資料表';
COMMENT ON TABLE test_building_details IS 'test-建物資料表';
COMMENT ON TABLE test_building_land_details IS 'test-建物土地關聯表';
COMMENT ON TABLE test_usage_types IS 'test-資產使用類型資料表';
COMMENT ON TABLE test_activated_asset_demand_agencies IS 'test-已活化資產與需求機關關聯表';
COMMENT ON TABLE test_activated_assets IS 'test-已活化資產資料表';
COMMENT ON TABLE test_activation_history IS 'test-資產活化歷史紀錄表';
COMMENT ON TABLE test_asset_cases IS 'test-資產處理案件表';
COMMENT ON TABLE test_case_meeting_conclusions IS 'test-案件會議結論表';
COMMENT ON TABLE test_case_tasks IS 'test-案件任務表';



CREATE OR REPLACE VIEW test_idle_assets_view AS
SELECT
    a.id,
    a.type AS "資產類型",
    a.target_name AS "標的名稱",
    d.name AS "行政區",
    a.section AS "地段",
    a.address AS "地址",
    ag.name AS "管理機關",
    a.status AS "狀態",
    a.created_at AS "建立時間"
FROM
    test_assets a
    LEFT JOIN test_districts d ON a.district_id = d.id
    LEFT JOIN test_agencies ag ON a.agency_id = ag.id
WHERE
    a.status = '未活化'
ORDER BY
    d.name,
    a.created_at DESC;



CREATE OR REPLACE VIEW test_idle_land_assets_view AS
SELECT
    a.id AS "資產ID",
    d.name AS "行政區",
    a.target_name AS "標的名稱",
    a.section AS "地段",
    a.address AS "地址",
    ag.name AS "管理機關",
    -- 土地詳細資訊
    ld.lot_number AS "地號",
    ld.land_type AS "土地類型",
    ld.area AS "面積(平方公尺)",
    ld.zone_type AS "使用分區",
    ld.land_use AS "土地用途",
    ld.current_status AS "現況",
    ld.vacancy_rate AS "空置比例(%)",
    ld.note AS "備註",
    -- 資產狀態資訊
    a.status AS "狀態",
    a.created_at AS "建立時間"
FROM
    test_assets a
    LEFT JOIN test_districts d ON a.district_id = d.id
    LEFT JOIN test_agencies ag ON a.agency_id = ag.id
    LEFT JOIN test_land_details ld ON a.id = ld.asset_id
WHERE
    a.status = '未活化'
    AND a.type = '土地'
    AND ld.deleted_at IS NULL  -- 排除已刪除的土地明細
ORDER BY
    a.id,
    d.name,                    -- 依行政區
    a.section,                 -- 依地段
    ld.lot_number;            -- 依地號



CREATE OR REPLACE VIEW test_idle_building_assets AS
SELECT
    -- 資產基本資訊
    a.id AS "資產ID",
    a.target_name AS "標的名稱",
    d.name AS "行政區",
    a.section AS "地段",
    a.address AS "地址",
    ag.name AS "管理機關",

    -- 建物詳細資訊
    bd.building_number AS "建號",
    bd.building_type AS "建物類型",
    bd.floor_area AS "樓地板面積",
    bd.zone_type AS "使用分區",
    bd.land_use AS "土地用途",
    bd.current_status AS "使用現況",
    bd.vacancy_rate AS "空置比例(%)",
    bd.note AS "建物備註",

    -- 建物座落土地資訊
    STRING_AGG(DISTINCT bld.lot_number, ', ') AS "座落地號",
    STRING_AGG(DISTINCT bld.land_type, ', ') AS "土地類型",
    STRING_AGG(DISTINCT bld.land_manager, ', ') AS "土地管理者",

    -- 資產狀態資訊
    a.status AS "活化狀態",
    a.created_at AS "建立時間"
FROM
    test_assets a
    LEFT JOIN test_districts d ON a.district_id = d.id
    LEFT JOIN test_agencies ag ON a.agency_id = ag.id
    LEFT JOIN test_building_details bd ON a.id = bd.asset_id
    LEFT JOIN test_building_land_details bld ON a.id = bld.asset_id
WHERE
    a.status = '未活化'
    AND a.type = '建物'
    AND bd.deleted_at IS NULL  -- 排除已刪除的建物明細
GROUP BY
    a.id,
    a.target_name,
    d.name,
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
    a.status,
    a.created_at
ORDER BY
    a.id,
    d.name,                    -- 依行政區
    a.section,                 -- 依地段
    bd.building_number;        -- 依建號


CREATE OR REPLACE VIEW test_activated_assets_view AS
SELECT
    aa.id AS "活化ID",
    a.id AS "資產ID",
    d.name AS "行政區",
    a.target_name AS "標的名稱",
    a.address AS "地址",
    STRING_AGG(da.name, ', ') AS "需求機關",
    ag.name AS "管理機關",
    -- 活化資訊
    aa.year AS "活化年度",
    aa.location AS "地點說明",
    CASE
        WHEN aa.is_supplementary THEN '是'
        ELSE '否'
    END AS "是否補列",
    aa.supplementary_year AS "補列年度",
    aa.usage_plan AS "計畫用途",
    ut.name AS "用途類型",
    -- 價值資訊
    aa.land_value AS "土地公告現值",
    aa.building_value AS "房屋課稅現值",
    aa.benefit_value AS "節流效益",
    -- 狀態資訊
    CASE
        WHEN aa.is_counted THEN '是'
        ELSE '否'
    END AS "列入計算",
    aa.status AS "活化狀態",
    TO_CHAR(aa.start_date, 'YYYY-MM-DD') AS "活化開始日期",
    TO_CHAR(aa.end_date, 'YYYY-MM-DD') AS "活化結束日期",
    aa.note AS "備註"
FROM
    test_activated_assets aa
    LEFT JOIN test_assets a ON aa.asset_id = a.id
    LEFT JOIN test_districts d ON a.district_id = d.id
    LEFT JOIN test_agencies ag ON a.agency_id = ag.id
    LEFT JOIN test_usage_types ut ON aa.usage_type_id = ut.id
    LEFT JOIN test_activated_asset_demand_agencies aada ON aa.id = aada.activated_asset_id
    LEFT JOIN test_agencies da ON aada.agency_id = da.id
GROUP BY
    aa.id,
    a.id,
    d.name,
    a.target_name,
    a.address,
    ag.name,
    aa.year,
    aa.location,
    aa.is_supplementary,
    aa.supplementary_year,
    aa.usage_plan,
    ut.name,
    aa.land_value,
    aa.building_value,
    aa.benefit_value,
    aa.is_counted,
    aa.status,
    aa.start_date,
    aa.end_date,
    aa.note
ORDER BY
    aa.year ASC,
    aa.id,
    d.name,
    a.target_name;



CREATE OR REPLACE VIEW test_asset_cases_view AS
SELECT
    ac.id AS "案件ID",
    ac.name AS "案件名稱",
    -- 資產資訊
    a.type AS "資產類型",
    d.name AS "行政區",
    a.target_name AS "標的名稱",
    a.address AS "地址",
    ag.name AS "管理機關",
    -- 活化目標資訊
    ac.purpose AS "活化目標說明",
    ut.name AS "活化目標類型",
    ac.status AS "案件狀態",
    -- 最新會議結論
    (
        SELECT content
        FROM test_case_meeting_conclusions cmc
        WHERE cmc.case_id = ac.id
        ORDER BY meeting_date DESC
        LIMIT 1
    ) AS "最新會議結論",
    -- 任務統計
    COUNT(DISTINCT ct.id) AS "任務總數",
    SUM(CASE WHEN ct.status = '已完成' THEN 1 ELSE 0 END) AS "已完成任務數",
    -- 時間資訊
    TO_CHAR(ac.created_at, 'YYYY-MM-DD') AS "建立時間",
    TO_CHAR(ac.updated_at, 'YYYY-MM-DD') AS "更新時間"
FROM
    test_asset_cases ac
    LEFT JOIN test_assets a ON ac.asset_id = a.id
    LEFT JOIN test_districts d ON a.district_id = d.id
    LEFT JOIN test_agencies ag ON a.agency_id = ag.id
    LEFT JOIN test_usage_types ut ON ac.purpose_type_id = ut.id
    LEFT JOIN test_case_tasks ct ON ac.id = ct.case_id
GROUP BY
    ac.id,
    ac.name,
    a.type,
    d.name,
    a.target_name,
    a.address,
    ag.name,
    ac.purpose,
    ut.name,
    ac.status,
    ac.created_at,
    ac.updated_at
ORDER BY
    ac.created_at DESC;


CREATE OR REPLACE VIEW test_case_tasks_view AS
SELECT
    -- 案件資訊
    ac.id AS "案件ID",
    ac.name AS "案件名稱",
    -- 資產資訊
    a.type AS "資產類型",
    d.name AS "行政區",
    a.target_name AS "標的名稱",
    -- 任務資訊
    ct.id AS "任務ID",
    ag.name AS "執行機關",
    ct.task_content AS "任務內容",
    ct.status AS "任務狀態",
    -- 時間資訊
    TO_CHAR(ct.start_date, 'YYYY-MM-DD') AS "開始日期",
    TO_CHAR(ct.due_date, 'YYYY-MM-DD') AS "預計完成日期",
    TO_CHAR(ct.complete_date, 'YYYY-MM-DD') AS "實際完成日期",
    -- 其他資訊
    ct.note AS "備註",
    -- 最新會議結論
    (
        SELECT content
        FROM test_case_meeting_conclusions cmc
        WHERE cmc.case_id = ac.id
        ORDER BY meeting_date DESC
        LIMIT 1
    ) AS "最新會議結論"
FROM
    test_case_tasks ct
    LEFT JOIN test_asset_cases ac ON ct.case_id = ac.id
    LEFT JOIN test_assets a ON ac.asset_id = a.id
    LEFT JOIN test_districts d ON a.district_id = d.id
    LEFT JOIN test_agencies ag ON ct.agency_id = ag.id
ORDER BY
    CASE ct.status
        WHEN '待處理' THEN 1
        WHEN '進行中' THEN 2
        WHEN '閒置中' THEN 3
        ELSE 4
    END,
    ac.id,
    ct.due_date ASC NULLS LAST,  -- 優先顯示有期限的任務
    ct.created_at DESC;


-- 為測試視圖添加描述
COMMENT ON VIEW test_idle_assets_view IS 'test-閒置資產視圖';
COMMENT ON VIEW test_idle_land_assets_view IS 'test-閒置土地資產視圖';
COMMENT ON VIEW test_idle_building_assets IS 'test-閒置建物資產視圖';
COMMENT ON VIEW test_activated_assets_view IS 'test-已活化資產視圖';
COMMENT ON VIEW test_asset_cases_view IS 'test-資產活化案件與統計視圖';
COMMENT ON VIEW test_case_tasks_view IS 'test-資產活化案件任務視圖';
