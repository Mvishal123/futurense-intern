create database sales_db;

use sales_db


-- Creation of tables

CREATE TABLE regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    region_id INT,
    age INT,
    gender VARCHAR(10),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    quantity INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Inserting data into tables

INSERT INTO regions (region_name)
VALUES
('North America'),
('South America'),
('Europe'),
('Asia'),
('Africa');


INSERT INTO products (product_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 1200.00, 50),
('Smartphone', 'Electronics', 800.00, 100),
('Desk Chair', 'Furniture', 150.00, 200),
('Running Shoes', 'Sportswear', 80.00, 300),
('Coffee Maker', 'Kitchen Appliances', 50.00, 150);


INSERT INTO customers (customer_name, region_id, age, gender)
VALUES
('John Doe', 1, 30, 'Male'),
('Jane Smith', 2, 25, 'Female'),
('Alice Johnson', 3, 35, 'Female'),
('Bob Brown', 4, 28, 'Male'),
('Emily Davis', 5, 40, 'Female');

INSERT INTO sales (product_id, customer_id, quantity, sale_date, total_amount)
VALUES
(1, 1, 2, '2023-06-01', 2400.00),
(2, 2, 1, '2023-06-02', 800.00),
(3, 3, 1, '2023-06-03', 150.00),
(4, 4, 4, '2023-06-04', 320.00),
(5, 5, 2, '2023-06-05', 100.00),
(1, 2, 3, '2023-06-06', 3600.00),
(2, 3, 1, '2023-06-07', 800.00),
(3, 4, 2, '2023-06-08', 300.00),
(4, 5, 1, '2023-06-09', 80.00),
(5, 1, 1, '2023-06-10', 50.00);


-- Select all customers from a specific region
SELECT * FROM customers WHERE region_id = (SELECT region_id FROM regions WHERE region_name = 'North America');

-- Count the number of products per category
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- Total sales amount per customer
SELECT c.customer_id, c.customer_name, SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id;

-- quantity per product category in sales
SELECT p.category, COUNT(s.quantity) AS count
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category;

-- Customers with total spending more than a certain amount
SELECT c.customer_id, c.customer_name, SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
HAVING SUM(s.total_amount) > 1000;

-- Products ordered by price ascending
SELECT * FROM products ORDER BY price ASC;

-- Customers ordered by age descending
SELECT * FROM customers ORDER BY age DESC;

-- Select distinct product categories
SELECT DISTINCT category FROM products;

-- Select all customers aged 30 or older
SELECT * FROM customers WHERE age >= 30;

-- Select products with names containing 'Chair'
SELECT * FROM products WHERE product_name LIKE '%Chair%';

-- Create a query to display customer names and a custom label based on their age
SELECT customer_name,
    CASE 
        WHEN age < 25 THEN 'Young'
        WHEN age >= 25 AND age < 40 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS age_group
FROM customers;

-- Select the first 5 sales
SELECT * FROM sales LIMIT 5;

-- Count the number of sales per customer
SELECT customer_id, COUNT(*) AS sale_count
FROM sales
GROUP BY customer_id
ORDER BY sale_count DESC;

-- Total revenue per product
SELECT p.product_id, p.product_name, SUM(s.total_amount) AS total_revenue
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC;

-- Average spending per region
SELECT r.region_name, AVG(s.total_amount) AS avg_spending
FROM regions r
JOIN customers c ON r.region_id = c.region_id
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY r.region_name
ORDER BY avg_spending DESC;

-- Total stock per product category
SELECT category, SUM(stock) AS total_stock
FROM products
GROUP BY category
ORDER BY total_stock DESC;

-- Customers with more than one purchase
SELECT c.customer_id, c.customer_name, COUNT(s.sale_id) AS purchase_count
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
HAVING COUNT(s.sale_id) > 1
ORDER BY purchase_count DESC;


