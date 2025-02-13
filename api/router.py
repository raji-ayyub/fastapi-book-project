from fastapi import APIRouter
from api.routes import books

api_router = APIRouter(prefix="/api/v1")  # ✅ Ensure this prefix is added
api_router.include_router(books.router, prefix="/books", tags=["books"])
