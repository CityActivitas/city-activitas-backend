一些test case

### 新增閒置資產

有註解: 

```json
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

``` json
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

```json
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

