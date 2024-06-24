
CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE products
(
    pid INT(3) PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    price INT(10) NOT NULL,
    stock INT(5),
    location VARCHAR(30) CHECK(location IN ('Bangalore', 'Kolkata'))
);

CREATE TABLE customer
(
    cid INT(3) PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    age INT(3),
    address VARCHAR(50)
);

CREATE TABLE orders
(
    oid INT(3) PRIMARY KEY,
    cid INT(3),
    pid INT(3),
    amount INT(10) NOT NULL,
    FOREIGN KEY(cid) REFERENCES customer(cid),
    FOREIGN KEY(pid) REFERENCES products(pid)
);


CREATE TABLE payment
(
    pay_id INT(3) PRIMARY KEY,
    oid INT(3),
    amount INT(10) NOT NULL,
    mode VARCHAR(30) CHECK(mode IN('upi', 'credit', 'debit')),
    status VARCHAR(30),
    FOREIGN KEY(oid) REFERENCES orders(oid)
);


INSERT INTO products VALUES(1, 'Dell Laptop', 60000, 20, 'Bangalore');
INSERT INTO products VALUES(2, 'Samsung Mobile', 25000, 40, 'Kolkata');
INSERT INTO products VALUES(3, 'Sony Headphones', 5000, 60, 'Bangalore');
INSERT INTO products VALUES(4, 'Asus Laptop', 45000, 10, 'Kolkata');
INSERT INTO products VALUES(5, 'Power Bank', 2000, 0, 'Bangalore');
INSERT INTO products VALUES(6, 'iPad', 75000, 8, 'Kolkata');
INSERT INTO products VALUES(7, 'Bluetooth Speaker', 7000, 5, 'Bangalore');


INSERT INTO customer VALUES(201, 'Amit', 29, '1st Cross, Bangalore');
INSERT INTO customer VALUES(202, 'Neha', 27, 'Park Street, Kolkata');
INSERT INTO customer VALUES(203, 'Rohit', 35, 'MG Road, Bangalore');
INSERT INTO customer VALUES(204, 'Priya', 23, 'Salt Lake, Kolkata');
INSERT INTO customer VALUES(205, 'Ankit', 30, 'HSR Layout, Bangalore');

INSERT INTO orders VALUES(5001, 202, 2, 24000);
INSERT INTO orders VALUES(5002, 204, 1, 58000);
INSERT INTO orders VALUES(5003, 205, 3, 4500);
INSERT INTO orders VALUES(5004, 201, 6, 74000);

INSERT INTO payment VALUES(1, 5001, 24000, 'upi', 'completed');
INSERT INTO payment VALUES(2, 5002, 58000, 'credit', 'completed');
INSERT INTO payment VALUES(3, 5003, 4500, 'debit', 'pending');

-- TCL Commands

-- 1) Saving the command permanently after running successfully
START TRANSACTION;
INSERT INTO products (pid, pname, price, stock, location) VALUES (8, 'OnePlus TV', 45000, 12, 'Bangalore');
INSERT INTO customer (cid, cname, age, address) VALUES (206, 'Rina', 28, 'BTM Layout, Bangalore');
INSERT INTO orders (oid, cid, pid, amount) VALUES (5005, 206, 8, 44000);
INSERT INTO payment (pay_id, oid, amount, mode, status) VALUES (4, 5005, 44000, 'credit', 'completed');
COMMIT;

-- 2) Going to previous command 
START TRANSACTION;
INSERT INTO products (pid, pname, price, stock, location) VALUES (9, 'Apple Watch', 35000, 15, 'Kolkata');
INSERT INTO customer (cid, cname, age, address) VALUES (207, 'Nitin', 26, 'Indiranagar, Bangalore');
INSERT INTO orders (oid, cid, pid, amount) VALUES (5006, 207, 9, 34000);
INSERT INTO payment (pay_id, oid, amount, mode, status) VALUES (5, 5006, 34000, 'upi', 'pending');
ROLLBACK;

-- 3) Going to a checkpoint where you want to go after saving the checkpoint
START TRANSACTION;
INSERT INTO products (pid, pname, price, stock, location) VALUES (10, 'Google Pixel', 80000, 10, 'Bangalore');
INSERT INTO customer (cid, cname, age, address) VALUES (208, 'Sonia', 34, 'Marathahalli, Bangalore');
INSERT INTO orders (oid, cid, pid, amount) VALUES (5007, 208, 10, 79000);
INSERT INTO payment (pay_id, oid, amount, mode, status) VALUES (6, 5007, 79000, 'debit', 'completed');
SAVEPOINT CheckPoint1;
ROLLBACK TO CheckPoint1;

-- Triggers

-- 1) Trigger to update status in payment table after an order is completed
DELIMITER //
CREATE TRIGGER update_payment_status
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF NEW.status = 'completed' THEN
        UPDATE payment
        SET status = 'completed'
        WHERE oid = NEW.oid;
    END IF;
END //
DELIMITER ;

-- 2) Trigger to check stock availability before inserting an order
DELIMITER //
CREATE TRIGGER check_stock_before_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;
    SELECT stock INTO available_stock FROM products WHERE pid = NEW.pid;
    IF available_stock < NEW.amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this product';
    END IF;
END //
DELIMITER ;

-- 3) Trigger to update stock after an order is placed
DELIMITER //
CREATE TRIGGER update_stock_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.amount
    WHERE pid = NEW.pid;
END //
DELIMITER ;

-- Views

-- 1) Create a view that displays the customers with their corresponding orders
CREATE VIEW CustomerOrders AS
SELECT c.cid, c.cname, o.oid, o.amount, p.pname
FROM customer c
JOIN orders o ON c.cid = o.cid
JOIN products p ON o.pid = p.pid;

-- 2) Create or Replace View to show payment details with order and customer information
CREATE OR REPLACE VIEW payment_order_customer_details AS
SELECT p.pay_id, p.oid, o.cid, c.cname, c.age, c.address, p.amount, p.mode, p.status
FROM payment p
JOIN orders o ON p.oid = o.oid
JOIN customer c ON o.cid = c.cid;

-- 3) Drop View if it exists
DROP VIEW IF EXISTS payment_order_customer_details;
