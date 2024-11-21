-- // 行政區資料表
-- Table districts {
--   id integer [pk, increment]
--   name varchar [not null, unique] // 例如：六甲區、鹽水區
--   note text

--   indexes {
--     name
--   }
-- }

CREATE TABLE districts (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    note TEXT
);

COMMENT ON COLUMN districts.name IS '例如：六甲區、鹽水區';


-- // 管理機關資料表
-- Table agencies {
--   id integer [pk, increment]
--   name varchar [not null, unique] // 例如：六甲國小、財政稅務局
--   note text

--   indexes {
--     name
--   }
-- }

CREATE TABLE agencies (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    note TEXT
);

COMMENT ON COLUMN agencies.name IS '例如：六甲國小、財政稅務局';

-- // 主要資產資料表
-- Table assets {
--   id integer [pk, increment]
--   type varchar [not null]          // `資產種類`例如：土地、建物
--   agency_id integer [ref: > agencies.id]
--   district_id integer [ref: > districts.id]
--   section varchar [not null]       // `地段` 例如：大丘園段、田寮段
--   address text                     // 例如：錦仁區和平南街9號
--   coordinates point                 // 定位座標, 使用 PostgreSQL 的 PostGIS 擴充功能
--   area_coordinates polygon            // 區域座標組, 使用 PostgreSQL 的 PostGIS 擴充功能
--   target_name varchar             // 標的名稱(原本只有建物資產有, 挪來這裡), 例如：歸仁市場2, 3樓
--   status varchar                  // 例如：已經活化、活化中、未活化
--   created_at timestamp [default: `CURRENT_TIMESTAMP`]
--   updated_at timestamp

--   indexes {
--     type
--     agency_id
--     district_id
--     status
--   }
-- }

-- 使用 PostGIS 擴充功能
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    type VARCHAR NOT NULL,
    agency_id INTEGER NOT NULL REFERENCES agencies(id),
    district_id INTEGER NOT NULL REFERENCES districts(id),
    section VARCHAR NOT NULL,
    address TEXT,
    coordinates POINT,
    area_coordinates POLYGON,
    target_name VARCHAR,
    status VARCHAR,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- 建立索引
CREATE INDEX idx_assets_type ON assets(type);
CREATE INDEX idx_assets_agency_id ON assets(agency_id);
CREATE INDEX idx_assets_district_id ON assets(district_id);
CREATE INDEX idx_assets_status ON assets(status);

-- 添加欄位註釋
COMMENT ON COLUMN assets.type IS '資產種類，例如：土地、建物';
COMMENT ON COLUMN assets.section IS '地段，例如：大丘園段、田寮段';
COMMENT ON COLUMN assets.address IS '例如：錦仁區和平南街9號';
COMMENT ON COLUMN assets.coordinates IS '定位座標，使用 PostgreSQL 的 PostGIS 擴充功能';
COMMENT ON COLUMN assets.area_coordinates IS '區域座標組，使用 PostgreSQL 的 PostGIS 擴充功能';
COMMENT ON COLUMN assets.target_name IS '標的名稱(原本只有建物資產有，挪來這裡)，例如：歸仁市場2, 3樓';
COMMENT ON COLUMN assets.status IS '例如：已經活化、活化中、未活化';

-- // 土地資料表
-- Table land_details {
--   id integer [pk, increment]
--   asset_id integer [ref: > assets.id]
--   lot_number varchar [not null]    // 地號, 例如：80-8、81-1
--   land_type varchar               // 土地種類, 例如：市有土地、國有土地
--   area decimal                    // 面積(平方公尺), 例如：7826
--   zone_type varchar               // 使用分區, 例如：學校用地、保護區
--   land_use varchar                // 土地用途(市區的不會有), 例如：特定目的事業用地
--   current_status varchar          // 現況, 例如：空置
--   vacancy_rate integer            // 空置比例, 例如：100
--   note text                       // 例如：六甲國小大丘分班(已裁併校)
--   created_at timestamp [default: `CURRENT_TIMESTAMP`]
--   updated_at timestamp
--   deleted_at timestamp

--   indexes {
--     asset_id
--     lot_number
--     zone_type
--     current_status
--   }
-- }

CREATE TABLE land_details (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER NOT NULL REFERENCES assets(id),
    lot_number VARCHAR NOT NULL,
    land_type VARCHAR,
    area DECIMAL,
    zone_type VARCHAR,
    land_use VARCHAR,
    current_status VARCHAR,
    vacancy_rate INTEGER,
    note TEXT
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP
);

-- 建立索引
CREATE INDEX idx_land_details_asset_id ON land_details(asset_id);
CREATE INDEX idx_land_details_lot_number ON land_details(lot_number);
CREATE INDEX idx_land_details_zone_type ON land_details(zone_type);
CREATE INDEX idx_land_details_current_status ON land_details(current_status);

-- 添加欄位註釋
COMMENT ON COLUMN land_details.lot_number IS '地號，例如：80-8、81-1';
COMMENT ON COLUMN land_details.land_type IS '土地種類，例如：市有土地、國有土地';
COMMENT ON COLUMN land_details.area IS '面積(平方公尺)，例如：7826';
COMMENT ON COLUMN land_details.zone_type IS '使用分區，例如：學校用地、保護區';
COMMENT ON COLUMN land_details.land_use IS '土地用途(市區的不會有)，例如：特定目的事業用地';
COMMENT ON COLUMN land_details.current_status IS '現況，例如：空置';
COMMENT ON COLUMN land_details.vacancy_rate IS '空置比例，例如：100';
COMMENT ON COLUMN land_details.note IS '例如：六甲國小大丘分班(已裁併校)';


-- // 建物資料表
-- Table building_details {
--   id integer [pk, increment]
--   asset_id integer [ref: > assets.id]
--   building_number varchar         // 建號, 例如：歸仁北段6932建號
--   building_type varchar          // 建物種類, 例如：市有建物
--   floor_area text               // 樓地板面積(平方公尺), 例如：2樓:3729.7 3樓:3426.2
--   zone_type varchar               // 使用分區, 例如：學校用地、保護區
--   land_use varchar                // 土地用途(市區的不會有), 例如：特定目的事業用地
--   current_status varchar         // 現況, 例如：空置、部分空置
--   vacancy_rate varchar          // 空置比例, 例如：100
--   note text                     // 例如：2樓空置、3樓部分空間約400坪提供給使用

--   indexes {
--     asset_id
--     building_number
--     current_status
--     zone_type
--     land_use
--   }
-- }

CREATE TABLE building_details (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER NOT NULL REFERENCES assets(id),
    building_number VARCHAR(100),
    building_type VARCHAR(50),
    floor_area TEXT,
    zone_type VARCHAR(100),
    land_use VARCHAR(100),
    current_status VARCHAR(50),
    vacancy_rate INTEGER,
    note TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP
);

-- 建立索引
CREATE INDEX idx_building_details_asset_id ON building_details(asset_id);
CREATE INDEX idx_building_details_building_number ON building_details(building_number);
CREATE INDEX idx_building_details_current_status ON building_details(current_status);
CREATE INDEX idx_building_details_zone_type ON building_details(zone_type);
CREATE INDEX idx_building_details_land_use ON building_details(land_use);

-- 添加欄位註釋
COMMENT ON COLUMN building_details.building_number IS '建號，例如：歸仁北段6932建號';
COMMENT ON COLUMN building_details.building_type IS '建物種類，例如：市有建物';
COMMENT ON COLUMN building_details.floor_area IS '樓地板面積(平方公尺)，例如：2樓:3729.7 3樓:3426.2';
COMMENT ON COLUMN building_details.zone_type IS '使用分區，例如：住宅區、商業區、工業區';
COMMENT ON COLUMN building_details.land_use IS '土地用途，例如：乙種建築用地、特定目的事業用地';
COMMENT ON COLUMN building_details.current_status IS '現況，例如：空置、部分空置';
COMMENT ON COLUMN building_details.vacancy_rate IS '空置比例，例如：100';
COMMENT ON COLUMN building_details.note IS '例如：2樓空置、3樓部分空間約400坪提供給使用';


-- // 建物土地關聯表
-- Table building_land_details {
--   id SERIAL [pk]
--   asset_id INTEGER [ref: > assets.id]
--   lot_number VARCHAR(20) [note: '地號']
--   land_type VARCHAR(50) [note: '土地種類']
--   land_manager VARCHAR(50) [note: '土地管理者']
--   created_at TIMESTAMP [note: '建立時間']
--   updated_at TIMESTAMP [note: '更新時間']
-- }

CREATE TABLE building_land_details (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER NOT NULL,
    lot_number VARCHAR(20) NOT NULL,  -- 地號
    land_type VARCHAR(50),            -- 土地種類 (市有土地/國有土地/私有土地)
    land_manager VARCHAR(50),         -- 土地管理者
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (asset_id) REFERENCES assets(id)
);

COMMENT ON TABLE building_land_details IS '建物土地關聯表';
COMMENT ON COLUMN building_land_details.id IS '主鍵 ID';
COMMENT ON COLUMN building_land_details.asset_id IS '資產 ID';
COMMENT ON COLUMN building_land_details.lot_number IS '地號';
COMMENT ON COLUMN building_land_details.land_type IS '土地種類 (市有土地/國有土地/私有土地)';
COMMENT ON COLUMN building_land_details.land_manager IS '土地管理者';


-- // 資產使用類型資料表
-- Table usage_types {
--   id integer [pk, increment]
--   name varchar [not null, unique]  // 例如：停車場、親子育兒設施、辦公廳舍/行政空間
--   note text

--   indexes {
--     name
--   }
-- }

-- // 資產使用類型資料表
CREATE TABLE usage_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    note TEXT
);

-- 建立索引
CREATE INDEX idx_usage_types_name ON usage_types(name);

-- 添加欄位註釋
COMMENT ON TABLE usage_types IS '資產使用類型資料表';
COMMENT ON COLUMN usage_types.name IS '例如：停車場、親子育兒設施、辦公廳舍/行政空間';


-- // 已活化資產與需求機關關聯表
CREATE TABLE activated_asset_demand_agencies (
    id SERIAL PRIMARY KEY,
    activated_asset_id INTEGER NOT NULL REFERENCES activated_assets(id),
    agency_id INTEGER REFERENCES agencies(id),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    -- 確保不會重複關聯
    UNIQUE(activated_asset_id, agency_id)
);

-- 建立索引
CREATE INDEX idx_activated_asset_demand_agencies_activated_asset_id
    ON activated_asset_demand_agencies(activated_asset_id);
CREATE INDEX idx_activated_asset_demand_agencies_agency_id
    ON activated_asset_demand_agencies(agency_id);

-- 添加欄位註釋
COMMENT ON TABLE activated_asset_demand_agencies IS '已活化資產與需求機關關聯表';
COMMENT ON COLUMN activated_asset_demand_agencies.activated_asset_id IS '已活化資產ID';
COMMENT ON COLUMN activated_asset_demand_agencies.agency_id IS '需求機關ID';



-- // 已活化資產資料表
-- Table activated_assets {
--   id integer [pk, increment]
--   asset_id integer [ref: > assets.id]
--   year integer [not null]         // 年度, 例如：107、108、109
--   location TEXT,                  // 地點說明, asset的補充地點說明
--   is_supplementary boolean        // 捕列, 是否為補列
--   supplementary_year integer      // 補列年度, 例如：106、107、108
--   usage_plan text                // 計畫用途, 例如：供鹽水區公所開闢停車場使用
--   usage_type_id integer [ref: > usage_types.id]  // 計畫用途類別, 關聯到資產使用類型表
--   demand_agency_id integer [ref: > agencies.id]  // 需求機關, 例如: 警察局
--   land_value decimal             // 土地公告現值
--   building_value decimal         // 房屋課稅現值
--   benefit_value decimal          // 節流效益(元)
--   is_counted boolean [not null]  // 列入計算: Y/M
--   note text                     // 備註
--   status varchar [not null]      // 例如：進行中、已終止
--   start_date date [not null]     // 活化開始日期
--   end_date date                  // 活化結束日期（若仍在進行中則為 null）

--   indexes {
--     asset_id
--     year
--     usage_type_id
--     demand_agency_id
--   }
-- }

-- // 已活化資產資料表
CREATE TABLE activated_assets (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER REFERENCES assets(id),  -- 可為空
    year INTEGER NOT NULL,
    location TEXT,                -- 地點說明, asset的補充地點說明
    is_supplementary BOOLEAN,
    supplementary_year INTEGER,
    usage_plan TEXT,
    usage_type_id INTEGER REFERENCES usage_types(id),
    -- 移除 demand_agency_id 欄位
    land_value DECIMAL,
    building_value DECIMAL,
    benefit_value DECIMAL,
    is_counted BOOLEAN NOT NULL,
    note TEXT,
    status VARCHAR NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

-- 建立索引
CREATE INDEX idx_activated_assets_asset_id ON activated_assets(asset_id);
CREATE INDEX idx_activated_assets_year ON activated_assets(year);
CREATE INDEX idx_activated_assets_usage_type_id ON activated_assets(usage_type_id);

-- 添加欄位註釋
COMMENT ON TABLE activated_assets IS '已活化資產資料表';
COMMENT ON COLUMN activated_assets.year IS '年度，例如：107、108、109';
COMMENT ON COLUMN activated_assets.is_supplementary IS '是否為補列';
COMMENT ON COLUMN activated_assets.supplementary_year IS '補列年度，例如：106、107、108';
COMMENT ON COLUMN activated_assets.usage_plan IS '計畫用途，例如：供鹽水區公所開闢停車場使用';
COMMENT ON COLUMN activated_assets.land_value IS '土地公告現值';
COMMENT ON COLUMN activated_assets.building_value IS '房屋課稅現值';
COMMENT ON COLUMN activated_assets.benefit_value IS '節流效益(元)';
COMMENT ON COLUMN activated_assets.is_counted IS '列入計算：Y/N';
COMMENT ON COLUMN activated_assets.status IS '例如：進行中、已終止';
COMMENT ON COLUMN activated_assets.start_date IS '活化開始日期';
COMMENT ON COLUMN activated_assets.end_date IS '活化結束日期（若仍在進行中則為 null）';


-- // 資產活化歷史紀錄表
-- Table activation_history {
--   id integer [pk, increment]
--   asset_id integer [ref: > assets.id]
--   activated_asset_id integer [ref: > activated_assets.id]
--   status varchar [not null]      // 例如：啟動、終止
--   change_date date [not null]    // 狀態變更日期
--   reason text                    // 變更原因
--   note text                      // 備註
--   created_at timestamp [default: `CURRENT_TIMESTAMP`]
--   created_by integer            // 建立者ID

--   indexes {
--     asset_id
--     activated_asset_id
--     status
--     change_date
--   }
-- }

-- // 資產活化歷史紀錄表
CREATE TABLE activation_history (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER REFERENCES assets(id),
    activated_asset_id INTEGER REFERENCES activated_assets(id),
    status VARCHAR NOT NULL,
    change_date DATE NOT NULL,
    reason TEXT,
    note TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER
);

-- 建立索引
CREATE INDEX idx_activation_history_asset_id ON activation_history(asset_id);
CREATE INDEX idx_activation_history_activated_asset_id ON activation_history(activated_asset_id);
CREATE INDEX idx_activation_history_status ON activation_history(status);
CREATE INDEX idx_activation_history_change_date ON activation_history(change_date);

-- 添加欄位註釋
COMMENT ON TABLE activation_history IS '資產活化歷史紀錄表';
COMMENT ON COLUMN activation_history.status IS '例如：啟動、終止';
COMMENT ON COLUMN activation_history.change_date IS '狀態變更日期';
COMMENT ON COLUMN activation_history.reason IS '變更原因';
COMMENT ON COLUMN activation_history.note IS '備註';
COMMENT ON COLUMN activation_history.created_by IS '建立者ID';



-- // 資產處理案件表
-- Table asset_cases {
--   id integer [pk, increment]      // 案件編號
--   asset_id integer [ref: > assets.id]  // 關聯到主要資產表
--   name text [not null]               // 案件名稱, 例如：臺南市玉井游泳池
--   purpose text                       // 活化目標說明,例如：供社會局設置居家托育服務中心
--   purpose_type_id integer [ref: > usage_types.id]  // 活化目標類型,例如：運動設施、停車場
--   status varchar [not null]          // 案件狀態,例如：解除列管尚未完成活化、活化中
--   created_at timestamp [default: `CURRENT_TIMESTAMP`]
--   updated_at timestamp

--   indexes {
--     asset_id
--     purpose_type_id
--     status
--   }
-- }

-- // 資產處理案件表
CREATE TABLE asset_cases (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER REFERENCES assets(id),
    name TEXT NOT NULL,
    purpose TEXT,
    purpose_type_id INTEGER REFERENCES usage_types(id),
    status VARCHAR NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- 建立索引
CREATE INDEX idx_asset_cases_asset_id ON asset_cases(asset_id);
CREATE INDEX idx_asset_cases_purpose_type_id ON asset_cases(purpose_type_id);
CREATE INDEX idx_asset_cases_status ON asset_cases(status);

-- 添加欄位註釋
COMMENT ON TABLE asset_cases IS '資產處理案件表';
COMMENT ON COLUMN asset_cases.asset_id IS '關聯到主要資產表';
COMMENT ON COLUMN asset_cases.name IS '案件名稱，例如：臺南市玉井游泳池';
COMMENT ON COLUMN asset_cases.purpose IS '活化目標說明，例如：供社會局設置居家托育服務中心';
COMMENT ON COLUMN asset_cases.purpose_type_id IS '活化目標類型，例如：運動設施、停車場';
COMMENT ON COLUMN asset_cases.status IS '案件狀態，例如：解除列管尚未完成活化、活化中';



-- // 案件會議結論表
-- Table case_meeting_conclusions {
--   id integer [pk, increment]
--   case_id integer [ref: > asset_cases.id] // 案件編號
--   meeting_date date [not null]       // 會議日期
--   content text [not null]            // 結論內容
--   created_at timestamp [default: `CURRENT_TIMESTAMP`]
--   updated_at timestamp

--   indexes {
--     case_id
--     meeting_date
--   }
-- }

-- // 案件會議結論表
CREATE TABLE case_meeting_conclusions (
    id SERIAL PRIMARY KEY,
    case_id INTEGER REFERENCES asset_cases(id),
    meeting_date DATE NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- 建立索引
CREATE INDEX idx_case_meeting_conclusions_case_id ON case_meeting_conclusions(case_id);
CREATE INDEX idx_case_meeting_conclusions_meeting_date ON case_meeting_conclusions(meeting_date);

-- 添加欄位註釋
COMMENT ON TABLE case_meeting_conclusions IS '案件會議結論表';
COMMENT ON COLUMN case_meeting_conclusions.case_id IS '案件編號';
COMMENT ON COLUMN case_meeting_conclusions.meeting_date IS '會議日期';
COMMENT ON COLUMN case_meeting_conclusions.content IS '結論內容';



-- // 案件任務表
-- Table case_tasks {
--   id integer [pk, increment]         // 任務序號
--   case_id integer [ref: > asset_cases.id]  // 案件編號
--   agency_id integer [ref: > agencies.id]  // 負責單位(執行機關)
--   task_content text [not null]       // 任務內容
--   status varchar [not null]          // 進度狀態, 例如：待處理、進行中、已完成
--   start_date date                    // 開始執行時間
--   complete_date date                 // 實際完成時間
--   due_date date                      // 預期完成時間
--   note text                         // 備註
--   created_at timestamp [default: `CURRENT_TIMESTAMP`]
--   updated_at timestamp

--   indexes {
--     case_id
--     agency_id
--     status
--   }
-- }

-- // 案件任務表
CREATE TABLE case_tasks (
    id SERIAL PRIMARY KEY,
    case_id INTEGER REFERENCES asset_cases(id),
    agency_id INTEGER REFERENCES agencies(id),
    task_content TEXT NOT NULL,
    status VARCHAR NOT NULL,
    start_date DATE,
    complete_date DATE,
    due_date DATE,
    note TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- 建立索引
CREATE INDEX idx_case_tasks_case_id ON case_tasks(case_id);
CREATE INDEX idx_case_tasks_agency_id ON case_tasks(agency_id);
CREATE INDEX idx_case_tasks_status ON case_tasks(status);

-- 添加欄位註釋
COMMENT ON TABLE case_tasks IS '案件任務表';
COMMENT ON COLUMN case_tasks.id IS '任務序號';
COMMENT ON COLUMN case_tasks.case_id IS '案件編號';
COMMENT ON COLUMN case_tasks.agency_id IS '負責單位(執行機關)';
COMMENT ON COLUMN case_tasks.task_content IS '任務內容';
COMMENT ON COLUMN case_tasks.status IS '進度狀態, 例如：待處理、進行中、已完成';
COMMENT ON COLUMN case_tasks.start_date IS '開始執行時間';
COMMENT ON COLUMN case_tasks.complete_date IS '實際完成時間';
COMMENT ON COLUMN case_tasks.due_date IS '預期完成時間';
COMMENT ON COLUMN case_tasks.note IS '備註';
