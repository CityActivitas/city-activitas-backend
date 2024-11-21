from __future__ import annotations

from datetime import date, datetime

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel
from supabase import Client

from server.dependencies.auth import get_auth_dependency

router = APIRouter(
    prefix="/api/v1/cases",
    tags=["進行中案件"],
)


# 定義請求模型
class CaseCreate(BaseModel):
    asset_id: int | None = None  # 關聯資產 ID（選擇性）
    name: str  # 案件名稱
    purpose: str | None = None  # 活化目標說明
    purpose_type_id: int | None = None  # 活化目標類型 ID
    status: str  # 案件狀態


class TaskCreate(BaseModel):
    agency_id: int  # 負責單位(執行機關)
    task_content: str  # 任務內容
    status: str  # 進度狀態
    start_date: date | None = None  # 開始執行時間
    complete_date: date | None = None  # 實際完成時間
    due_date: date | None = None  # 預期完成時間
    note: str | None = None  # 備註


class CaseUpdate(BaseModel):
    name: str | None = None  # 案件名稱
    purpose: str | None = None  # 活化目標說明
    purpose_type_id: int | None = None  # 活化目標類型 ID
    status: str | None = None  # 案件狀態


class TaskUpdate(BaseModel):
    agency_id: int | None = None  # 負責單位(執行機關)
    task_content: str | None = None  # 任務內容
    status: str | None = None  # 進度狀態
    start_date: date | None = None  # 開始執行時間
    complete_date: date | None = None  # 實際完成時間
    due_date: date | None = None  # 預期完成時間
    note: str | None = None  # 備註


class MeetingUpdate(BaseModel):
    meeting_date: date | None = None  # 會議日期
    content: str | None = None  # 結論內容


def init_router(supabase: Client) -> APIRouter:
    verify_token = get_auth_dependency(supabase)

    @router.get("")
    async def get_cases():
        response = supabase.table("test_asset_cases_view").select("*").execute()
        return response.data

    @router.get("/{case_id}")  # /api/v1/cases/{case_id}
    async def get_case(case_id: int):
        try:
            # 取得案件基本資料，包含關聯的資產和使用類型資訊
            response = (
                supabase.table("test_asset_cases_view").select("*").eq("案件ID", case_id).single().execute()
            )

            if not response.data:
                raise HTTPException(status_code=404, detail="找不到指定的案件")

            case_data = response.data

            # 取得案件相關的任務
            tasks = supabase.table("test_case_tasks_view").select("*").eq("案件ID", case_id).execute()

            # 取得案件相關的會議結論
            meetings = (
                supabase.table("test_case_meeting_conclusions")
                .select("*")
                .eq("case_id", case_id)
                .order("meeting_date", desc=True)
                .execute()
            )

            # 組合所有資料
            return {"case": case_data, "tasks": tasks.data, "meetings": meetings.data}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.get("/{case_id}/tasks")  # /api/v1/cases/{case_id}/tasks
    async def get_case_tasks(case_id: int):
        response = supabase.table("test_case_tasks_view").select("*").eq("案件ID", case_id).execute()
        return response.data

    @router.get("/{case_id}/meetings")  # /api/v1/cases/{case_id}/meetings
    async def get_case_meetings(case_id: int):
        response = (
            supabase.table("test_case_meeting_conclusions")
            .select("*")
            .eq("case_id", case_id)
            .order("meeting_date", desc=True)
            .execute()
        )
        return response.data

    @router.get("/{case_id}/meetings/{meeting_id}")  # /api/v1/cases/{case_id}/meetings/{meeting_id}
    async def get_case_meeting(case_id: int, meeting_id: int):
        response = (
            supabase.table("test_case_meeting_conclusions")
            .select("*")
            .eq("case_id", case_id)
            .eq("id", meeting_id)
            .single()
            .execute()
        )
        return response.data

    @router.post(
        "/{case_id}/meetings", dependencies=[Depends(verify_token)]
    )  # /api/v1/cases/{case_id}/meetings
    async def create_case_meeting(case_id: int, meeting_date: str, content: str):
        response = (
            supabase.table("test_case_meeting_conclusions")
            .insert({"case_id": case_id, "meeting_date": meeting_date, "content": content})
            .execute()
        )
        return response.data

    @router.post("/{case_id}/tasks", dependencies=[Depends(verify_token)])  # /api/v1/cases/{case_id}/tasks
    async def create_case_task(case_id: int, task: TaskCreate):
        try:
            # 檢查案件是否存在
            case = supabase.table("test_asset_cases").select("id").eq("id", case_id).single().execute()
            if not case.data:
                raise HTTPException(status_code=404, detail="找不到指定的案件")

            # 檢查機關是否存在
            agency = supabase.table("test_agencies").select("id").eq("id", task.agency_id).single().execute()
            if not agency.data:
                raise HTTPException(status_code=404, detail="找不到指定的機關")

            # 準備任務資料
            current_time = datetime.now().isoformat()
            task_data = task.dict()
            task_data["case_id"] = case_id
            task_data["created_at"] = current_time
            task_data["updated_at"] = current_time

            # 新增任務
            response = supabase.table("test_case_tasks").insert(task_data).execute()

            return response.data[0]

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.post("", dependencies=[Depends(verify_token)])  # /api/v1/cases
    async def create_case(case: CaseCreate):
        try:
            current_time = datetime.now().isoformat()
            case_data = case.dict()
            case_data["created_at"] = current_time
            case_data["updated_at"] = current_time

            # 如果有提供 asset_id，檢查資產是否存在並更新其狀態
            if case.asset_id:
                # 檢查資產是否存在
                asset = supabase.table("test_assets").select("id").eq("id", case.asset_id).single().execute()
                if not asset.data:
                    raise HTTPException(status_code=404, detail="找不到指定的資產")

                # 更新資產狀態為「活化中」
                supabase.table("test_assets").update({"status": "活化中", "updated_at": current_time}).eq(
                    "id", case.asset_id
                ).execute()

            # 檢查活化目標類型是否存在（如果有提供）
            if case.purpose_type_id:
                usage_type = (
                    supabase.table("test_usage_types")
                    .select("id")
                    .eq("id", case.purpose_type_id)
                    .single()
                    .execute()
                )
                if not usage_type.data:
                    raise HTTPException(status_code=404, detail="找不到指定的使用類型")

            # 新增案件
            response = supabase.table("test_asset_cases").insert(case_data).execute()

            return response.data[0]

        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))

    @router.put("/{case_id}", dependencies=[Depends(verify_token)])  # /api/v1/cases/{case_id}
    async def update_case(case_id: int, case: CaseUpdate):
        try:
            # 檢查案件是否存在
            existing_case = (
                supabase.table("test_asset_cases").select("*").eq("id", case_id).single().execute()
            )
            if not existing_case.data:
                raise HTTPException(status_code=404, detail="找不到指定的案件")

            # 準備更新資料
            update_data = {k: v for k, v in case.dict(exclude_unset=True).items() if v is not None}
            if not update_data:
                raise HTTPException(status_code=400, detail="沒有提供要更新的資料")

            # 如果有提供 purpose_type_id，檢查使用類型是否存在
            if case.purpose_type_id:
                usage_type = (
                    supabase.table("test_usage_types")
                    .select("id")
                    .eq("id", case.purpose_type_id)
                    .single()
                    .execute()
                )
                if not usage_type.data:
                    raise HTTPException(status_code=404, detail="找不到指定的使用類型")

            # 更新時間戳記
            update_data["updated_at"] = datetime.now().isoformat()

            # 更新案件
            response = supabase.table("test_asset_cases").update(update_data).eq("id", case_id).execute()

            return response.data[0]

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.delete("/{case_id}", dependencies=[Depends(verify_token)])  # /api/v1/cases/{case_id}
    async def delete_case(case_id: int):
        try:
            # 檢查案件是否存在
            case = supabase.table("test_asset_cases").select("*").eq("id", case_id).single().execute()
            if not case.data:
                raise HTTPException(status_code=404, detail="找不到指定的案件")

            # 如果案件有關聯的資產，將資產狀態改回「未活化」
            if case.data.get("asset_id"):
                supabase.table("test_assets").update(
                    {"status": "未活化", "updated_at": datetime.now().isoformat()}
                ).eq("id", case.data["asset_id"]).execute()

            # 刪除相關的任務
            supabase.table("test_case_tasks").delete().eq("case_id", case_id).execute()

            # 刪除相關的會議結論
            supabase.table("test_case_meeting_conclusions").delete().eq("case_id", case_id).execute()

            # 刪除案件
            supabase.table("test_asset_cases").delete().eq("id", case_id).execute()

            return {"message": "案件已成功刪除"}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.put(
        "/{case_id}/tasks/{task_id}", dependencies=[Depends(verify_token)]
    )  # /api/v1/cases/{case_id}/tasks/{task_id}
    async def update_case_task(case_id: int, task_id: int, task: TaskUpdate):
        try:
            # 檢查任務是否存在且屬於指定的案件
            existing_task = (
                supabase.table("test_case_tasks")
                .select("*")
                .eq("id", task_id)
                .eq("case_id", case_id)
                .single()
                .execute()
            )

            if not existing_task.data:
                raise HTTPException(status_code=404, detail="找不到指定的任務")

            # 準備更新資料
            update_data = {k: v for k, v in task.dict(exclude_unset=True).items() if v is not None}
            if not update_data:
                raise HTTPException(status_code=400, detail="沒有提供要更新的資料")

            # 如果有提供 agency_id，檢查機關是否存在
            if task.agency_id:
                agency = (
                    supabase.table("test_agencies").select("id").eq("id", task.agency_id).single().execute()
                )
                if not agency.data:
                    raise HTTPException(status_code=404, detail="找不到指定的機關")

            # 更新時間戳記
            update_data["updated_at"] = datetime.now().isoformat()

            # 更新任務
            response = (
                supabase.table("test_case_tasks")
                .update(update_data)
                .eq("id", task_id)
                .eq("case_id", case_id)
                .execute()
            )

            return response.data[0]

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.delete(
        "/{case_id}/tasks/{task_id}", dependencies=[Depends(verify_token)]
    )  # /api/v1/cases/{case_id}/tasks/{task_id}
    async def delete_case_task(case_id: int, task_id: int):
        try:
            # 檢查任務是否存在且屬於指定的案件
            existing_task = (
                supabase.table("test_case_tasks")
                .select("*")
                .eq("id", task_id)
                .eq("case_id", case_id)
                .single()
                .execute()
            )

            if not existing_task.data:
                raise HTTPException(status_code=404, detail="找不到指定的任務")

            # 刪除任務
            (
                supabase.table("test_case_tasks").delete().eq("id", task_id).eq("case_id", case_id).execute()
            )

            return {"message": "任務已成功刪除"}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.put(
        "/{case_id}/meetings/{meeting_id}", dependencies=[Depends(verify_token)]
    )  # /api/v1/cases/{case_id}/meetings/{meeting_id}
    async def update_case_meeting(case_id: int, meeting_id: int, meeting: MeetingUpdate):
        try:
            # 檢查會議結論是否存在且屬於指定的案件
            existing_meeting = (
                supabase.table("test_case_meeting_conclusions")
                .select("*")
                .eq("id", meeting_id)
                .eq("case_id", case_id)
                .single()
                .execute()
            )

            if not existing_meeting.data:
                raise HTTPException(status_code=404, detail="找不到指定的會議結論")

            # 準備更新資料
            update_data = {k: v for k, v in meeting.dict(exclude_unset=True).items() if v is not None}
            if not update_data:
                raise HTTPException(status_code=400, detail="沒有提供要更新的資料")

            # 更新時間戳記
            update_data["updated_at"] = datetime.now().isoformat()

            # 更新會議結論
            response = (
                supabase.table("test_case_meeting_conclusions")
                .update(update_data)
                .eq("id", meeting_id)
                .eq("case_id", case_id)
                .execute()
            )

            return response.data[0]

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    @router.delete(
        "/{case_id}/meetings/{meeting_id}", dependencies=[Depends(verify_token)]
    )  # /api/v1/cases/{case_id}/meetings/{meeting_id}
    async def delete_case_meeting(case_id: int, meeting_id: int):
        try:
            # 檢查會議結論是否存在且屬於指定的案件
            existing_meeting = (
                supabase.table("test_case_meeting_conclusions")
                .select("*")
                .eq("id", meeting_id)
                .eq("case_id", case_id)
                .single()
                .execute()
            )

            if not existing_meeting.data:
                raise HTTPException(status_code=404, detail="找不到指定的會議結論")

            # 刪除會議結論
            (
                supabase.table("test_case_meeting_conclusions")
                .delete()
                .eq("id", meeting_id)
                .eq("case_id", case_id)
                .execute()
            )

            return {"message": "會議結論已成功刪除"}

        except Exception as e:
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(status_code=400, detail=str(e))

    return router
