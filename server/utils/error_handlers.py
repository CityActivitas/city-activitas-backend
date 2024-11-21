from fastapi import HTTPException, status
from postgrest import APIError


def handle_postgrest_error(e: APIError):
    """處理 PostgREST API 錯誤的共用函數"""
    if e.code == "PGRST301" and "JWT expired" in str(e):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={
                "code": "JWT_EXPIRED",
                "message": "JWT token has expired",
                "hint": "Please login again to get a new token",
            },
        )
    # 處理其他 API 錯誤
    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))
