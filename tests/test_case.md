一些test case

### 新增閒置資產

有註解:

```json5
// POST /api/v1/idle/assets

{
    "type": "土地",
    "agency_id": 27,  // 管理機關ID
    "district_id": 13,  // 行政區ID
    "section": "大丘園段",  // 地段
    "address": "台南市七股區大埕里123號",
    "coordinates": [120.345678, 23.456789],  // 定位座標 [經度, 緯度]
    "area_coordinates": [  // 區域座標組
        [120.345678, 23.456789],
        [120.345679, 23.456789],
        [120.345679, 23.456788],
        [120.345678, 23.456788]
    ],
    "target_name": "大埕段土地",
    "status": "未活化",
    "land_details": [  // 土地明細列表
        {
            "lot_number": "80-8",  // 地號
            "land_type": "市有土地",
            "area": 7826,  // 面積(平方公尺)
            "zone_type": "農業區",  // 使用分區
            "land_use": "特定目的事業用地",  // 土地用途
            "current_status": "空置",
            "vacancy_rate": 100,  // 空置比例
            "note": "測試-農地"  // 備註
        },
        {
            "lot_number": "81-1",
            "land_type": "市有土地",
            "area": 5000,
            "zone_type": "農業區",
            "land_use": "特定目的事業用地",
            "current_status": "空置",
            "vacancy_rate": 100,
            "note": "測試-農地"
        }
    ]
}
```

純json:

```json
{
    "type": "土地",
    "agency_id": 27,
    "district_id": 13,
    "section": "大丘園段",
    "address": "台南市七股區大埕里123號",
    "coordinates": [120.345678, 23.456789],
    "area_coordinates": [
        [120.345678, 23.456789],
        [120.345679, 23.456789],
        [120.345679, 23.456788],
        [120.345678, 23.456788]
    ],
    "target_name": "測試-大埕段土地",
    "status": "未活化",
    "land_details": [
        {
            "lot_number": "80-8",
            "land_type": "市有土地",
            "area": 7826,
            "zone_type": "農業區",
            "land_use": "特定目的事業用地",
            "current_status": "空置",
            "vacancy_rate": 100,
            "note": "測試-農地"
        },
        {
            "lot_number": "81-1",
            "land_type": "市有土地",
            "area": 5000,
            "zone_type": "農業區",
            "land_use": "特定目的事業用地",
            "current_status": "空置",
            "vacancy_rate": 100,
            "note": "測試-農地"
        }
    ]
}
```

更新測試:  **更新一定要有type標記是土地還是建物**

``` json5
// PATCH /api/v1/idle/assets/{asset_id}

{
    "type": "土地",
    "address": "台南市七股區大埕里122號",
    "land_details": [
        {
            "lot_number": "80-8",
            "current_status": "部分使用",
            "vacancy_rate": 50,
            "note": "更新-測試-農地"
        }
    ]
}
```


建物資產:

```json5
// POST /api/v1/idle/assets

{
    "type": "建物",
    "agency_id": 2,
    "district_id": 11,
    "section": "實踐段",
    "address": "北區大武街162號",
    "coordinates": [120.345678, 23.456789],
    "area_coordinates": [
        [120.345678, 23.456789],
        [120.345679, 23.456789],
        [120.345679, 23.456788],
        [120.345678, 23.456788]
    ],
    "target_name": "測試-實踐派出所",
    "status": "未活化",
    "building_details": [
        {
            "building_number": "實踐段832建號",
            "building_type": "市有建物",
            "floor_area": "辦公廳舍(A棟)1樓:113.04㎡ 2樓:113.04㎡",
            "zone_type": "住宅區",
            "land_use": "特定目的事業用地",
            "current_status": "部分空置",
            "vacancy_rate": 50,
            "note": "測試 - 宿舍尚有退休員警家屬居住、僅辦公廳舍空置"
        }
    ],
    "building_land_details": [
        {
            "lot_number": "1043-44",
            "land_type": "市有土地",
            "land_manager": null
        },
        {
            "lot_number": "1043-45",
            "land_type": "市有土地",
            "land_manager": null
        }
    ]
}
```

更新建物資產:  **更新一定要有type標記是土地還是建物**

```json5
// PATCH /api/v1/idle/assets/{asset_id}

{
    "type": "建物",
    "address": "北區大武街163號",  // 更新地址
    "building_details": [
        {
            "building_number": "實踐段832建號",
            "current_status": "空置",  // 更新現況
            "vacancy_rate": 100,      // 更新空置比例
            "note": "更新測試 - 所有空間皆已空置"  // 更新備註
        }
    ],
    "building_land_details": [
        {
            "lot_number": "1043-44",
            "land_type": "市有土地",
            "land_manager": "臺南市政府"  // 更新土地管理者
        }
    ]
}
```

### 新增案件

```json5
// 不帶資產的案件
POST /api/v1/cases
{
    "name": "測試 - 臺南市山上游泳池活化案",
    "purpose": "測試 - 供社會局設置居家托育服務中心",
    "purpose_type_id": 12,
    "status": "規劃中"
}

// 帶資產的案件（會同時更新資產狀態）
POST /api/v1/cases
{
    "asset_id": 46,
    "name": "臺南市實踐派出所活化案",
    "purpose": "測試 - 變停車場",
    "purpose_type_id": 5,
    "status": "規劃中"
}
```
