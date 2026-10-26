# Sales Analysis Project

A small sales analytics system built with **Docker**. It runs a PostgreSQL database, a REST API, and a Metabase dashboard with one command.

//Tech Stack

**Docker & Docker Compose**: runs all services together
**PostgreSQL 18**: database
**FastAPI (Python)**: REST API
**SQLAlchemy**: database access from Python
**Metabase**: dashboards and data analysis
//Project Structure

Sales_Project_analysis/
├── docker-compose.yml     # runs db + api + metabase
├── app/
│   ├── main.py            # FastAPI code
│   ├── Dockerfile
│   └── requirements.txt
└── db/
    └── init.sql           # tables + sample data

//Database SQL 

6 tables with generated sample data:

| Table | Rows | Description |
|---|---|---|
| customers | 500 | Customer details (city, country, gender, ...) |
| categories | 8 | Product categories |
| products | 100 | Products with price, cost and stock |
| employees | 15 | Sales employees |
| orders | 5,000 | Orders from Nov 2025 to Oct 2026 |
| order_items | ~10,000 | Products inside each order |

The data is synthetic and was generated with a script. It includes seasonality, different order statuses and payment methods.

//How to Run

Requirements: Docker Desktop.

docker compose up -d --build

| Service | URL |
| API docs (Swagger) | http://localhost:8000/docs |
| Metabase | http://localhost:3000 |
| PostgreSQL | localhost:5432 |

To stop: docker compose stop
To reset everything (deletes data): docker compose down -v

//API Endpoints

| Endpoint | Description |
| GET /customers | List customers |
| POST /customers | Add a customer |
| GET /products | List products |
| POST /products | Add a product |
| GET /orders | List orders |
| GET /orders/{id} | Order details with items |
| GET /stats/summary | Total orders, customers and revenue |
| GET /stats/monthly-sales | Revenue per month |
| GET /stats/top-products | Best-selling products |

//Metabase Setup

Open http://localhost:3000 and create an account.
Add a PostgreSQL database with these settings:
Host: db
Port: 5432
Database: sales
User: postgres
Password: password
Create questions with SQL and add them to a dashboard.
//Dashboards

Monthly sales
Top 10 products by revenue
Top employees by sales

//What I Learned

Running multiple services with Docker Compose
Docker images, containers, volumes and networks
Connecting an API to PostgreSQL (actually this APIs from ai)
Writing SQL (JOIN, GROUP BY, aggregations)
Building dashboards with Metabase

Note*

The database password in docker-compose.yml is for local learning only. Do not use it in a real project.
