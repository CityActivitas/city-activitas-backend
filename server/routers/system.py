from __future__ import annotations

from datetime import datetime

from fastapi import APIRouter
from supabase import Client

router = APIRouter(prefix="/api/v1/system", tags=["System"])


def init_router(supabase: Client) -> APIRouter:
    @router.get("/health")
    async def health_check():
        return {
            "status": "healthy",
            "timestamp": datetime.now().isoformat(),
            "version": "1.0.0",  # 可從環境變數或配置檔讀取
            "database": "connected" if supabase else "disconnected",
        }

    return router
