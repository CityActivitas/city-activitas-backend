from __future__ import annotations

import os

from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from supabase import Client, create_client

from server.routers import activated_assets, active_cases, assets, auth, common, idle_assets, system

load_dotenv()

supabase: Client = create_client(
    os.getenv("SUPABASE_URL", ""),
    os.getenv("SUPABASE_ANON_KEY", ""),
)

app = FastAPI()

# 設定 CORS
origins = [
    "http://localhost:3000",  # React / Next.js
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# include routers
app.include_router(system.init_router(supabase))
app.include_router(auth.init_router(supabase))
app.include_router(assets.init_router(supabase))
app.include_router(idle_assets.init_router(supabase))
app.include_router(active_cases.init_router(supabase))
app.include_router(activated_assets.init_router(supabase))
app.include_router(common.init_router(supabase))
