from fastapi import APIRouter, HTTPException, Depends
from supabase import Client
from typing import Optional
from datetime import datetime, date
from pydantic import BaseModel
from dependencies.auth import get_auth_dependency

router = APIRouter(prefix="/api/v1/activated", tags=["已活化資產"])


class ActivatedAssetUpdate(BaseModel):
    year: Optional[int] = None  # 年度
    location: Optional[str] = None  # 地點說明
    is_supplementary: Optional[bool] = None  # 是否為補列
    supplementary_year: Optional[int] = None  # 補列年度
    usage_plan: Optional[str] = None  # 計畫用途
    usage_type_id: Optional[int] = None  # 計畫用途類別
    land_value: Optional[float] = None  # 土地公告現值
    building_value: Optional[float] = None  # 房屋課稅現值
    benefit_value: Optional[float] = None  # 節流效益
    is_counted: Optional[bool] = None  # 列入計算
    note: Optional[str] = None  # 備註
    status: Optional[str] = None  # 狀態
    start_date: Optional[date] = None  # 活化開始日期
    end_date: Optional[date] = None  # 活化結束日期


class ActivatedAssetCreate(BaseModel):
    asset_id: Optional[int] = None
    year: int  # 年度
    location: Optional[str] = None  # 地點說明
    is_supplementary: bool = False  # 是否為補列
    supplementary_year: Optional[int] = None  # 補列年度
    usage_plan: Optional[str] = None  # 計畫用途
    usage_type_id: Optional[int] = None  # 計畫用途類別
    land_value: Optional[float] = None  # 土地公告現值
    building_value: Optional[float] = None  # 房屋課稅現值
    benefit_value: Optional[float] = None  # 節流效益
    is_counted: bool  # 列入計算
    note: Optional[str] = None  # 備註
    status: str  # 狀態
    start_date: date  # 活化開始日期
    end_date: Optional[date] = None  # 活化結束日期


class ActivationHistoryResponse(BaseModel):
    asset_id: Optional[int]
    activated_asset_id: Optional[int]
    status: str  # 啟動、終止
    change_date: date
    reason: Optional[str]
    note: Optional[str]
    created_at: datetime
    created_by: Optional[int]


def init_router(supabase: Client) -> APIRouter:
    verify_token = get_auth_dependency(supabase)

    @router.get("")  # /api/v1/activated
    async def get_activated_assets():
        response = supabase.table("test_activated_assets_view").select("*").execute()
        return response.data

    @router.put("/{activated_id}", dependencies=[Depends(verify_token)])  # /api/v1/activated/{activated_id}
    async def update_activated_asset(activated_id: int, asset: ActivatedAssetUpdate):
        try:
            # 檢查已活化資產是否存在
            existing_asset = (
                supabase.table("test_activated_assets").select("*").eq("id", activated_id).single().execute()
            )

            if not existing_asset.data:
                raise HTTPException(status_code=404, detail="找不到指定的已活化資產")

            # 準備更新資料
            update_data = {k: v for k, v in asset.dict(exclude_unset=True).items() if v is not None}
            if not update_data:
                raise HTTPException(status_code=400, detail="沒有提供要更新的資料")

            # 如果有提供 usage_type_id，檢查使用類型是否存在
            if asset.usage_type_id:
                usage_type = (
                    supabase.table("test_usage_types")
                    .select("id")
                    .eq("id", asset.usage_type_id)
                    .single()
                    .execute()
                )
                if not usage_type.data:
                    raise HTTPException(status_code=404, detail="找不到指定的使用類型")

            # 更新時間戳記
            update_data["updated_at"] = datetime.now().isoformat()

            # 如果有更新 status，需要記錄歷史
            if "status" in update_data:
                # 只有當狀態真的改變時才記錄
                if update_data["status"] != existing_asset.data["status"]:
                    history_status = "啟動" if update_data["status"] == "進行中" else "終止"
                    history_data = {
                        "activated_asset_id": activated_id,
                        "asset_id": existing_asset.data.get("asset_id"),
                        "status": history_status,
                        "change_date": datetime.now().date().isoformat(),
                        "created_at": datetime.now().isoformat(),
                    }

                    # 新增歷史紀錄
                    supabase.table("test_activation_history").insert(history_data).execute()

                # 如果有 asset_id（無論是新增還是既有的），都要更新資產狀態
                asset_id = update_data.get("asset_id") or existing_asset.data.get("asset_id")
                if asset_id:
                    asset_status = "已活化" if update_data["status"] == "進行中" else "未活化"
                    supabase.table("test_assets").update(
                        {"status": asset_status, "updated_at": datetime.now().isoformat()}
                    ).eq("id", asset_id).execute()

            # 更新已活化資產
            response = (
                supabase.table("test_activated_assets").update(update_data).eq("id", activated_id).execute()
            )

            return response.data[0]

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.get("/statuses")  # /api/v1/activated/statuses
    async def get_activated_asset_statuses():
        return [{"id": "進行中", "name": "進行中"}, {"id": "已終止", "name": "已終止"}]

    @router.post("", dependencies=[Depends(verify_token)])  # /api/v1/activated
    async def create_activated_asset(asset: ActivatedAssetCreate):
        try:
            # 檢查資產是否存在
            if asset.asset_id:
                existing_asset = (
                    supabase.table("test_assets").select("id").eq("id", asset.asset_id).single().execute()
                )
                if not existing_asset.data:
                    raise HTTPException(status_code=404, detail="找不到指定的資產")

            # 檢查使用類型是否存在
            if asset.usage_type_id:
                usage_type = (
                    supabase.table("test_usage_types")
                    .select("id")
                    .eq("id", asset.usage_type_id)
                    .single()
                    .execute()
                )
                if not usage_type.data:
                    raise HTTPException(status_code=404, detail="找不到指定的使用類型")

            # 準備新增資料
            insert_data = asset.dict(exclude_unset=True)

            # 新增已活化資產
            response = supabase.table("test_activated_assets").insert(insert_data).execute()

            # 如果有關聯資產，更新資產狀態
            if asset.asset_id:
                asset_status = "已活化" if asset.status == "進行中" else "未活化"
                supabase.table("test_assets").update(
                    {"status": asset_status, "updated_at": datetime.now().isoformat()}
                ).eq("id", asset.asset_id).execute()

            return response.data[0]

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.get("/history")  # /api/v1/activated/history
    async def get_activation_history(
        asset_id: Optional[int] = None,
        activated_asset_id: Optional[int] = None,
        status: Optional[str] = None,
        start_date: Optional[date] = None,
        end_date: Optional[date] = None,
    ):
        try:
            # 建立基本查詢
            query = supabase.table("test_activation_history").select("""
                    asset_id,
                    activated_asset_id,
                    status,
                    change_date,
                    reason,
                    note,
                    created_at,
                    created_by
                """)

            # 加入篩選條件
            if asset_id:
                query = query.eq("asset_id", asset_id)
            if activated_asset_id:
                query = query.eq("activated_asset_id", activated_asset_id)
            if status:
                query = query.eq("status", status)
            if start_date:
                query = query.gte("change_date", start_date.isoformat())
            if end_date:
                query = query.lte("change_date", end_date.isoformat())

            # 執行查詢並排序
            response = query.order("change_date", desc=True).execute()

            return response.data

        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))

    @router.get("/history/statuses")  # /api/v1/activated/history/statuses
    async def get_activation_history_statuses():
        return [{"id": "啟動", "name": "啟動"}, {"id": "終止", "name": "終止"}]

    return router
