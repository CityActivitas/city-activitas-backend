from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv
from supabase import create_client, Client
import os
from datetime import datetime

from routers import idle_assets, active_cases, activated_assets, auth, common, system, assets, proposals

load_dotenv()

supabase: Client = create_client(
    os.getenv("SUPABASE_URL"),
    os.getenv("SUPABASE_ANON_KEY")
)

app = FastAPI()

# 設定 CORS
origins = [
    "http://localhost:3001",  # React / Next.js
    "http://localhost:3000",  # React / Next.js
    "https://city-activitas.vercel.app"
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
app.include_router(proposals.init_router(supabase))
