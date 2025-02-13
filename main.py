from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from api.router import api_router
from core.config import settings  # Ensure settings.API_PREFIX exists

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(api_router, prefix="")  # Remove settings.API_PREFIX here

@app.get("/healthcheck")
async def health_check():
    return {"status": "active"}
