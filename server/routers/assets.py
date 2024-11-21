from __future__ import annotations

from datetime import datetime

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel
from supabase import Client

from server.dependencies.auth import get_auth_dependency


# 定義請求模型
class AssetUpdate(BaseModel):
    type: str | None = None  # 資產種類：土地或建物
    agency_id: int | None = None  # 管理機關ID
    district_id: int | None = None  # 行政區ID
    section: str | None = None  # 地段
    address: str | None = None  # 地址
    coordinates: tuple[float, float] | None = None  # 定位座標
    area_coordinates: list[tuple[float, float]] | None = None  # 區域座標組
    target_name: str | None = None  # 標的名稱
    status: str | None = None  # 狀態


class LandDetailUpdate(BaseModel):
    lot_number: str | None = None  # 地號，例如：80-8、81-1
    land_type: str | None = None  # 土地種類，例如：市有土地、國有土地
    area: float | None = None  # 面積(平方公尺)，例如：7826
    zone_type: str | None = None  # 使用分區，例如：學校用地、保護區
    land_use: str | None = None  # 土地用途，例如：特定目的事業用地
    current_status: str | None = None  # 現況，例如：空置
    vacancy_rate: int | None = None  # 空置比例，例如：100
    note: str | None = None  # 備註，例如：六甲國小大丘分班(已裁併校)


class BuildingDetailUpdate(BaseModel):
    building_number: str | None = None  # 建號，例如：歸仁北段6932建號
    building_type: str | None = None  # 建物種類，例如：市有建物
    floor_area: str | None = None  # 樓地板面積，例如：2樓:3729.7 3樓:3426.2
    zone_type: str | None = None  # 使用分區，例如：住宅區、商業區
    land_use: str | None = None  # 土地用途，例如：乙種建築用地
    current_status: str | None = None  # 現況，例如：空置、部分空置
    vacancy_rate: int | None = None  # 空置比例，例如：100
    note: str | None = None  # 備註，例如：2樓空置、3樓部分空間約400坪提供給使用


class BuildingLandDetailUpdate(BaseModel):
    lot_number: str | None = None  # 地號
    land_type: str | None = None  # 土地種類 (市有土地/國有土地/私有土地)
    land_manager: str | None = None  # 土地管理者


router = APIRouter(prefix="/api/v1/assets", tags=["資產"])


def init_router(supabase: Client) -> APIRouter:
    verify_token = get_auth_dependency(supabase)

    @router.patch("/{asset_id}", dependencies=[Depends(verify_token)])
    async def update_asset(asset_id: int, asset: AssetUpdate):
        """
        更新資產主要資料

        範例:
        ```json
        {
            "address": "新地址",
            "status": "已活化",
            "coordinates": [120.123, 23.456]
        }
        ```
        """
        try:
            # 1. 檢查資產是否存在
            existing_asset = supabase.table("test_assets").select("*").eq("id", asset_id).execute()
            if not existing_asset.data:
                raise HTTPException(status_code=404, detail="找不到指定的資產")

            # 2. 準備更新資料
            update_data = {}

            # 只更新有提供的欄位
            if asset.type is not None:
                update_data["type"] = asset.type
            if asset.agency_id is not None:
                update_data["agency_id"] = asset.agency_id
            if asset.district_id is not None:
                update_data["district_id"] = asset.district_id
            if asset.section is not None:
                update_data["section"] = asset.section
            if asset.address is not None:
                update_data["address"] = asset.address
            if asset.target_name is not None:
                update_data["target_name"] = asset.target_name
            if asset.status is not None:
                update_data["status"] = asset.status

            # 處理座標資料
            if asset.coordinates is not None:
                update_data["coordinates"] = f"({asset.coordinates[0]},{asset.coordinates[1]})"

            if asset.area_coordinates is not None:
                points = [f"({x},{y})" for x, y in asset.area_coordinates]
                if points[0] != points[-1]:
                    points.append(points[0])
                update_data["area_coordinates"] = f"({','.join(points)})"

            # 加入更新時間
            update_data["updated_at"] = datetime.now().isoformat()

            # 3. 更新資產資料
            if update_data:
                supabase.table("test_assets").update(update_data).eq("id", asset_id).execute()
                return {"message": "資產更新成功", "asset_id": asset_id}
            else:
                return {"message": "沒有資料需要更新", "asset_id": asset_id}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.patch("/lands/{land_id}", dependencies=[Depends(verify_token)])
    async def update_land_detail(land_id: int, land: LandDetailUpdate):
        """
        更新土地明細資料

        範例:
        ```json
        {
            "area": 8000,
            "current_status": "部分空置",
            "vacancy_rate": 50
        }
        ```
        """
        try:
            # 1. 檢查土地明細是否存在
            existing_land = supabase.table("test_land_details").select("*").eq("id", land_id).execute()
            if not existing_land.data:
                raise HTTPException(status_code=404, detail="找不到指定的土地明細")

            # 2. 準備更新資料
            update_data = land.dict(exclude_unset=True)  # 只包含有設定值的欄位
            update_data["updated_at"] = datetime.now().isoformat()

            # 3. 更新土地明細資料
            supabase.table("test_land_details").update(update_data).eq("id", land_id).execute()

            return {"message": "土地明細更新成功", "land_id": land_id}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.patch("/buildings/{building_id}", dependencies=[Depends(verify_token)])
    async def update_building_detail(building_id: int, building: BuildingDetailUpdate):
        """
        更新建物明細資料

        範例:
        ```json
        {
            "current_status": "部分空置",
            "vacancy_rate": 50,
            "note": "2樓空置、3樓部分空間約400坪提供給使用"
        }
        ```
        """
        try:
            # 1. 檢查建物明細是否存在
            existing_building = (
                supabase.table("test_building_details").select("*").eq("id", building_id).execute()
            )
            if not existing_building.data:
                raise HTTPException(status_code=404, detail="找不到指定的建物明細")

            # 2. 準備更新資料
            update_data = building.dict(exclude_unset=True)  # 只包含有設定值的欄位
            update_data["updated_at"] = datetime.now().isoformat()

            # 3. 更新建物明細資料
            (
                supabase.table("test_building_details").update(update_data).eq("id", building_id).execute()
            )

            return {"message": "建物明細更新成功", "building_id": building_id}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.patch("/building-lands/{detail_id}", dependencies=[Depends(verify_token)])
    async def update_building_land_detail(detail_id: int, detail: BuildingLandDetailUpdate):
        """
        更新建物土地關聯資料

        範例:
        ```json
        {
            "lot_number": "80-8",
            "land_type": "市有土地",
            "land_manager": "財政部國有財產署"
        }
        ```
        """
        try:
            # 1. 檢查建物土地關聯是否存在
            existing_detail = (
                supabase.table("test_building_land_details").select("*").eq("id", detail_id).execute()
            )
            if not existing_detail.data:
                raise HTTPException(status_code=404, detail="找不到指定的建物土地關聯資料")

            # 2. 準備更新資料
            update_data = detail.dict(exclude_unset=True)  # 只包含有設定值的欄位
            update_data["updated_at"] = datetime.now().isoformat()

            # 3. 更新建物土地關聯資料
            (
                supabase.table("test_building_land_details").update(update_data).eq("id", detail_id).execute()
            )

            return {"message": "建物土地關聯更新成功", "detail_id": detail_id}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    return router
