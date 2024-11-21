from __future__ import annotations


def test_health_check(test_client):
    response = test_client.get("/api/v1/system/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


def test_post_idle_asset(test_client, mocker):
    from unittest.mock import MagicMock

    mocker = MagicMock()
    mocker.return_value = {
        "email": "email",
        "phone": "123456789",
        "password": "password",
    }
    data = {
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
            [120.345678, 23.456788],
        ],
        "target_name": "大埕段土地",
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
                "note": "測試-農地",
            },
            {
                "lot_number": "81-1",
                "land_type": "市有土地",
                "area": 5000,
                "zone_type": "農業區",
                "land_use": "特定目的事業用地",
                "current_status": "空置",
                "vacancy_rate": 100,
                "note": "測試-農地",
            },
        ],
        "building_details": [],
        "building_land_details": [],
    }

    response = test_client.post(url="/api/v1/idle/assets", json=data)
    assert response.status_code == 201
    assert response.json() == {"message": "閒置資產新增成功", "asset_id": {}}


def test_cases(test_client):
    data = {
        "asset_id": 46,
        "name": "臺南市實踐派出所活化案",
        "purpose": "測試 - 變停車場",
        "purpose_type_id": 5,
        "status": "規劃中",
    }
    response = test_client.post(url="/api/v1/cases", json=data)
    assert response.status_code == 200
    assert response.json() == {}
