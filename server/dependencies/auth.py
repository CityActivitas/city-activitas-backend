from __future__ import annotations

from collections.abc import Callable

from fastapi import Depends, HTTPException
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from supabase import Client

security = HTTPBearer()


def get_auth_dependency(supabase: Client) -> Callable:
    async def verify_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
        try:
            user = supabase.auth.get_user(credentials.credentials)
            return user
        except Exception:
            raise HTTPException(status_code=401, detail="無效的認證憑證")

    return verify_token
