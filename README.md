# Retail_store-Database
An Mini SQL Database Assignment - SAII

## 🗄️ Database Design
Entities (4 Tables)

1. **Customers** - Store customer information
2. **Products** - Product catalog with pricing and inventory
3. **Orders** - Order header information
4. **Order_Items** - Junction table linking orders to products

**Entity Relationships**

Customers (1) -----> (Many) Orders
Orders (1) -----> (Many) Order_Items
Products (1) -----> (Many) Order_Items

📊 Database Schema

Customers Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| customer_id | INT (PK) | Unique customer identifier |
| name | VARCHAR(50) | Customer full name |
| email | VARCHAR(50) | Customer email address |
| phone | VARCHAR(15) | Customer phone number |
| city | VARCHAR(30) | Customer city |

Products Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| product_id | INT (PK) | Unique product identifier |
| product_name | VARCHAR(50) | Product name |
| price | DECIMAL(8,2) | Product price |
| stock | INT | Available stock quantity |

Orders Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| order_id | INT (PK) | Unique order identifier |
| customer_id | INT (FK) | Reference to customer |
| order_date | DATE | Date when order was placed |
| total_amount | DECIMAL(10,2) | Total order amount |
| status | VARCHAR(20) | Order status |

Order_Items Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| item_id | INT (PK) | Unique item identifier |
| order_id | INT (FK) | Reference to order |
| product_id | INT (FK) | Reference to product |
| quantity | INT | Quantity ordered |
| price | DECIMAL(8,2) | Price per unit |
