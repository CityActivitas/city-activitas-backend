from __future__ import annotations

from fastapi import APIRouter, Depends, Form, HTTPException
from fastapi.security import HTTPBearer, OAuth2PasswordRequestForm
from passlib.context import CryptContext
from supabase import Client

security = HTTPBearer()
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

router = APIRouter(tags=["認證"])


def init_router(supabase: Client) -> APIRouter:
    def get_password_hash(password: str) -> str:
        return pwd_context.hash(password)

    def verify_password(plain_password: str, hashed_password: str) -> bool:
        return pwd_context.verify(plain_password, hashed_password)

    @router.post("/signup")
    async def signup(email: str = Form(...), password: str = Form(...)):
        try:
            # 雜湊密碼
            hashed_password = get_password_hash(password)

            # 使用雜湊後的密碼註冊
            response = supabase.auth.sign_up({"email": email, "password": hashed_password})

            if response.user:
                return {"message": "註冊成功", "user": response.user}
            else:
                raise HTTPException(status_code=400, detail="註冊失敗")

        except Exception as e:
            print(f"註冊錯誤: {str(e)}")
            raise HTTPException(status_code=400, detail=f"註冊失敗: {str(e)}")

    @router.post("/token")
    async def login(form_data: OAuth2PasswordRequestForm = Depends()):
        try:
            response = supabase.auth.sign_in_with_password(
                {"email": form_data.username, "password": form_data.password}
            )

            if response.user:
                return {
                    "access_token": response.session.access_token,
                    "token_type": "bearer",
                    "user": response.user,
                }
            else:
                raise HTTPException(status_code=400, detail="帳號或密碼錯誤")

        except Exception as e:
            print(f"登入錯誤: {str(e)}")
            raise HTTPException(status_code=400, detail=f"登入失敗: {str(e)}")

    return router
