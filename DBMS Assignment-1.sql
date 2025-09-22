Create Database Retail_store;
use Retail_store;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(30)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(8,2),
    stock INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(8,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'John Smith', 'john@email.com', '555-1001', 'New York'),
(2, 'Mary Johnson', 'mary@email.com', '555-1002', 'Chicago'),
(3, 'Bob Wilson', 'bob@email.com', '555-1003', 'Miami'),
(4, 'Lisa Brown', 'lisa@email.com', '555-1004', 'Seattle'),
(5, 'Tom Davis', 'tom@email.com', '555-1005', 'Boston'),
(6, 'Anna Miller', 'anna@email.com', '555-1006', 'Denver'),
(7, 'Mike Taylor', 'mike@email.com', '555-1007', 'Austin'),
(8, 'Sara Lee', 'sara@email.com', '555-1008', 'Portland');

INSERT INTO Products VALUES
(101, 'Laptop', 999.99, 25),
(102, 'Phone', 599.99, 50),
(103, 'Headphones', 149.99, 100),
(104, 'Tablet', 399.99, 30),
(105, 'Watch', 299.99, 75),
(106, 'Speaker', 99.99, 60),
(107, 'Camera', 799.99, 15),
(108, 'Keyboard', 79.99, 90);

INSERT INTO Orders VALUES
(1001, 1, '2024-09-15', 1149.98, 'Delivered'),
(1002, 2, '2024-09-16', 599.99, 'Shipped'),
(1003, 3, '2024-09-17', 549.98, 'Processing'),
(1004, 4, '2024-09-18', 299.99, 'Delivered'),
(1005, 1, '2024-09-19', 179.98, 'Shipped'),
(1006, 5, '2024-09-20', 799.99, 'Pending');

INSERT INTO Order_Items VALUES
(1, 1001, 101, 1, 999.99),  
(2, 1001, 103, 1, 149.99),  
(3, 1002, 102, 1, 599.99), 
(4, 1003, 104, 1, 399.99),
(5, 1003, 103, 1, 149.99),
(6, 1004, 105, 1, 299.99),
(7, 1005, 106, 1, 99.99),
(8, 1005, 108, 1, 79.99),
(9, 1006, 107, 1, 799.99),
(10, 1003, 106, 1, 99.99),
(11, 1004, 108, 1, 79.99),
(12, 1002, 105, 1, 299.99);


-- Query 1: Find all orders from the last 7 days
SELECT Orders.order_id, Customers.name, Orders.order_date, Orders.total_amount, Orders.status
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Orders.order_date >= '2024-09-15'
ORDER BY Orders.order_date DESC;

-- Query 2: Top 3 most expensive products
SELECT product_name, price, stock
FROM Products
ORDER BY price DESC
LIMIT 3;

-- Query 3: Customers who have pending orders
SELECT Customers.name, Customers.email, Orders.order_id, Orders.total_amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.status = 'Pending';

-- Query 4: Products with low stock (less than 30 items)
SELECT product_name, stock, price
FROM Products
WHERE stock < 30
ORDER BY stock ASC;

-- Query 5: Total sales by customer
SELECT Customers.name, COUNT(Orders.order_id) AS total_orders, SUM(Orders.total_amount) AS total_spent
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.name
ORDER BY total_spent DESC;