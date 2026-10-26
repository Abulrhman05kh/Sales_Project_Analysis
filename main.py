import os
from typing import Optional

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from sqlalchemy import create_engine, text

# الاتصال بالقاعدة (العنوان بيجي من docker-compose، مش مكتوب بالكود)
engine = create_engine(os.getenv("DATABASE_URL"))

app = FastAPI(title="Sales Analysis API")


def query(sql, params=None):
    """ينفّذ SELECT ويرجّع النتيجة كقائمة"""
    with engine.connect() as conn:
        result = conn.execute(text(sql), params or {})
        return [dict(row._mapping) for row in result]


# ---------- نماذج الإدخال ----------
class CustomerIn(BaseModel):
    first_name: str
    last_name: str
    email: str
    phone: Optional[str] = None
    gender: Optional[str] = None
    city: Optional[str] = None
    country: Optional[str] = None


class ProductIn(BaseModel):
    name: str
    category_id: int
    brand: Optional[str] = None
    price: float
    cost: float
    stock_quantity: int = 0


# ---------- الصفحة الرئيسية ----------
@app.get("/")
def home():
    return {"message": "Sales API is running. Open /docs to try it."}


# ---------- العملاء ----------
@app.get("/customers")
def list_customers(limit: int = 20, city: Optional[str] = None):
    if city:
        return query("SELECT * FROM customers WHERE city = :city ORDER BY id LIMIT :limit",
                     {"city": city, "limit": limit})
    return query("SELECT * FROM customers ORDER BY id LIMIT :limit", {"limit": limit})


@app.get("/customers/{customer_id}")
def get_customer(customer_id: int):
    rows = query("SELECT * FROM customers WHERE id = :id", {"id": customer_id})
    if not rows:
        raise HTTPException(status_code=404, detail="Customer not found")
    return rows[0]


@app.post("/customers")
def add_customer(c: CustomerIn):
    sql = text("""
        INSERT INTO customers (first_name, last_name, email, phone, gender, city, country, registration_date)
        VALUES (:first_name, :last_name, :email, :phone, :gender, :city, :country, CURRENT_DATE)
        RETURNING id
    """)
    try:
        with engine.begin() as conn:
            new_id = conn.execute(sql, c.model_dump()).scalar()
    except Exception:
        raise HTTPException(status_code=400, detail="Could not add customer (email may already exist)")
    return {"id": new_id, "message": "Customer added"}


# ---------- المنتجات ----------
@app.get("/products")
def list_products(limit: int = 20, category_id: Optional[int] = None):
    if category_id:
        return query("SELECT * FROM products WHERE category_id = :c ORDER BY id LIMIT :limit",
                     {"c": category_id, "limit": limit})
    return query("SELECT * FROM products ORDER BY id LIMIT :limit", {"limit": limit})


@app.post("/products")
def add_product(p: ProductIn):
    sql = text("""
        INSERT INTO products (name, category_id, brand, price, cost, stock_quantity, created_at)
        VALUES (:name, :category_id, :brand, :price, :cost, :stock_quantity, CURRENT_DATE)
        RETURNING id
    """)
    try:
        with engine.begin() as conn:
            new_id = conn.execute(sql, p.model_dump()).scalar()
    except Exception:
        raise HTTPException(status_code=400, detail="Could not add product (check category_id)")
    return {"id": new_id, "message": "Product added"}


# ---------- الطلبات ----------
@app.get("/orders")
def list_orders(limit: int = 20, status: Optional[str] = None):
    if status:
        return query("SELECT * FROM orders WHERE status = :s ORDER BY order_date DESC LIMIT :limit",
                     {"s": status, "limit": limit})
    return query("SELECT * FROM orders ORDER BY order_date DESC LIMIT :limit", {"limit": limit})


@app.get("/orders/{order_id}")
def get_order(order_id: int):
    orders = query("SELECT * FROM orders WHERE id = :id", {"id": order_id})
    if not orders:
        raise HTTPException(status_code=404, detail="Order not found")
    items = query("""
        SELECT p.name, oi.quantity, oi.unit_price, oi.quantity * oi.unit_price AS line_total
        FROM order_items oi JOIN products p ON p.id = oi.product_id
        WHERE oi.order_id = :id
    """, {"id": order_id})
    return {"order": orders[0], "items": items}


# ---------- إحصائيات (الطلبات الملغية مستثناة) ----------
@app.get("/stats/summary")
def summary():
    return query("""
        SELECT COUNT(DISTINCT o.id) AS total_orders,
               COUNT(DISTINCT o.customer_id) AS active_customers,
               ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
        FROM orders o JOIN order_items oi ON oi.order_id = o.id
        WHERE o.status <> 'Cancelled'
    """)[0]


@app.get("/stats/monthly-sales")
def monthly_sales():
    return query("""
        SELECT TO_CHAR(o.order_date, 'YYYY-MM') AS month,
               ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
        FROM orders o JOIN order_items oi ON oi.order_id = o.id
        WHERE o.status <> 'Cancelled'
        GROUP BY month ORDER BY month
    """)


@app.get("/stats/top-products")
def top_products(limit: int = 10):
    return query("""
        SELECT p.name, SUM(oi.quantity) AS units_sold,
               ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
        FROM order_items oi
        JOIN products p ON p.id = oi.product_id
        JOIN orders o ON o.id = oi.order_id
        WHERE o.status <> 'Cancelled'
        GROUP BY p.name ORDER BY revenue DESC LIMIT :limit
    """, {"limit": limit})
