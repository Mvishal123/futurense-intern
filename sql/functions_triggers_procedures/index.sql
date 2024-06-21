CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    status VARCHAR(20)
);


CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Mouse', 'Electronics', 25.00),
('Keyboard', 'Electronics', 45.00),
('Smartphone', 'Electronics', 800.00),
('Charger', 'Accessories', 20.00),
('HP Laptop', 'Electronics', 1300.00);


INSERT INTO orders (customer_name, status) VALUES
('John Doe', 'Completed'),
('Jane Smith', 'Completed'),
('Alice Johnson', 'Pending'),
('Bob Brown', 'Completed');


INSERT INTO payment (order_id, amount) VALUES
(1, 1200.00),
(1, 25.00),
(1, 45.00),
(2, 800.00),
(2, 20.00),
(3, 50.00),
(4, 75.00);



-- Procedure to Retrieve All Products
DELIMITER $$
CREATE PROCEDURE select_all_products()
BEGIN
    SELECT * FROM products;
END$$
DELIMITER ;

CALL select_all_products();


-- Function to Calculate Total Revenue for Completed Orders
DELIMITER $$
CREATE FUNCTION get_total_revenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total_revenue
    FROM payment p
    INNER JOIN orders o ON p.order_id = o.order_id
    WHERE o.status = 'Completed';
    RETURN total_revenue;
END$$
DELIMITER ;

SELECT get_total_revenue() AS total_revenue;



-- Procedure with IN Parameter to Retrieve Product Details
DELIMITER $$
CREATE PROCEDURE get_product_details(IN product_id INT)
BEGIN
    SELECT * FROM products WHERE product_id = product_id;
END$$
DELIMITER ;

CALL get_product_details(5);


-- Procedure with OUT Parameter to Get Product Count
DELIMITER $$
CREATE PROCEDURE get_product_count(OUT total_count INT)
BEGIN
    SELECT COUNT(*) INTO total_count FROM products;
END$$
DELIMITER ;

CALL get_product_count(@count);
SELECT @count AS total_products;


-- Procedure Using Cursor to Print Product Names
DELIMITER $$
CREATE PROCEDURE print_product_names()
BEGIN
    DECLARE product_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR SELECT name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN product_cursor;

    get_names: LOOP
        FETCH product_cursor INTO product_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT product_name;
    END LOOP get_names;

    CLOSE product_cursor;
END$$
DELIMITER ;

CALL print_product_names();

-- Combined Example: Procedure Using Function and Cursor
-- Create a function to calculate the total revenue for completed orders
DELIMITER $$
CREATE FUNCTION get_total_revenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total_revenue
    FROM payment p
    INNER JOIN orders o ON p.order_id = o.order_id
    WHERE o.status = 'Completed';
    RETURN total_revenue;
END$$
DELIMITER ;

-- Create a procedure to print product names and total revenue
DELIMITER $$
CREATE PROCEDURE print_product_details()
BEGIN
    DECLARE product_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR SELECT name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN product_cursor;

    get_names: LOOP
        FETCH product_cursor INTO product_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT product_name;
    END LOOP get_names;

    CLOSE product_cursor;

    SELECT get_total_revenue() AS total_revenue;
END$$
DELIMITER ;

CALL print_product_details();


-- 
-- Create a function to calculate the total revenue for completed orders
DELIMITER $$
CREATE FUNCTION get_total_revenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(p.amount) INTO total_revenue
    FROM payment p
    INNER JOIN orders o ON p.order_id = o.order_id
    WHERE o.status = 'Completed';
    RETURN total_revenue;
END$$
DELIMITER ;



-- Create a procedure to print product names and total revenue
DELIMITER $$
CREATE PROCEDURE print_product_details()
BEGIN
    DECLARE product_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR SELECT name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN product_cursor;

    get_names: LOOP
        FETCH product_cursor INTO product_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT product_name;
    END LOOP get_names;

    CLOSE product_cursor;

    SELECT get_total_revenue() AS total_revenue;
END$$
DELIMITER ;

CALL print_product_details();

