create database bookstore;
use bookstore;

create table books
(
    book_id int(3) primary key,
    title varchar(50) not null,
    price int(10) not null,
    stock int(5),
    location varchar(30) check(location in ('New York','Los Angeles'))
);

create table customers
(
    cust_id int(3) primary key,
    cust_name varchar(30) not null,
    age int(3),
    address varchar(50)
);

create table orders
(
    order_id int(3) primary key,
    cust_id int(3),
    book_id int(3),
    amount int(10) not null,
    foreign key(cust_id) references customers(cust_id),
    foreign key(book_id) references books(book_id)
);

create table payments
(
    pay_id int(3) primary key,
    order_id int(3),
    amount int(10) not null,
    payment_mode varchar(30) check(payment_mode in('upi','credit','debit')),
    status varchar(30),
    foreign key(order_id) references orders(order_id)
);

ALTER TABLE payments
ADD COLUMN timestamp TIMESTAMP;

insert into books values(1,'The Great Gatsby',1500,10,'New York');
insert into books values(2,'To Kill a Mockingbird',1200,5,'Los Angeles');
insert into books values(3,'1984',1000,20,'Los Angeles');
insert into books values(4,'Pride and Prejudice',800,15,'New York');
insert into books values(5,'The Catcher in the Rye',900,0,'New York');
insert into books values(6, 'Moby Dick', 2000, 7, 'Los Angeles');
insert into books values(7, 'War and Peace', 2500, 3, 'Los Angeles');
insert into books values(8, 'Jane Eyre', 1300, 12, 'Los Angeles');

insert into customers values(201,'Alice',30,'123 Main St');
insert into customers values(202,'Bob',25,'456 Elm St');
insert into customers values(203,'Charlie',32,'789 Pine St');
insert into customers values(204,'David',28,'101 Maple St');
insert into customers values(205,'Eve',22,'202 Oak St');

insert into orders values(20001,202,3,950);
insert into orders values(20002,204,2,1150);
insert into orders values(20003,205,5,850);
insert into orders values(20004,201,1,1450);

insert into payments values(1,20001,950,'upi','completed');
insert into payments values(2,20002,1150,'credit','completed');
insert into payments values(3,20003,850,'debit','in process');


UPDATE payments
SET timestamp = '2024-05-01 08:00:00'
WHERE pay_id = 1;

UPDATE payments
SET timestamp = '2024-05-01 08:10:00'
WHERE pay_id = 2;

UPDATE payments
SET timestamp = '2024-05-01 08:15:00'
WHERE pay_id = 3;


-- Find the name of the customer who placed the order with the highest total amount.
SELECT cust_name 
FROM customers 
WHERE cust_id = (
    SELECT cust_id 
    FROM orders 
    GROUP BY cust_id 
    ORDER BY SUM(amount) DESC 
    LIMIT 1
);

-- Retrieve the names of all customers who have placed orders for books located in the same city as the customer named "Bob".
SELECT cust_name
FROM customers
WHERE cust_id IN (
    SELECT DISTINCT cust_id
    FROM orders
    WHERE book_id IN (
        SELECT book_id
        FROM books
        WHERE location = (
            SELECT location
            FROM customers
            WHERE cust_name = 'Bob'
        )
    )
);


--  Retrieve the names of all customers who have placed orders for books that have a price higher than the average price of books bought by each customer.
SELECT cust_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    JOIN books b ON o.book_id = b.book_id
    WHERE o.cust_id = c.cust_id
    AND b.price > (
        SELECT AVG(price)
        FROM books
        WHERE book_id IN (
            SELECT book_id
            FROM orders
            WHERE cust_id = c.cust_id
        )
    )
);


-- Retrieve the names of customers who have placed orders for books with a price higher than the average price of all books in the same city as the customer, and also display the total amount spent by each customer on such orders.
SELECT c.cust_name, SUM(o.amount) AS total_amount_spent
FROM customers c
INNER JOIN orders o ON c.cust_id = o.cust_id
INNER JOIN books b ON o.book_id = b.book_id
INNER JOIN (
    SELECT location, AVG(price) AS avg_price
    FROM books
    GROUP BY location
) avg_prices ON b.location = avg_prices.location
WHERE b.price > avg_prices.avg_price
GROUP BY c.cust_name;


-- Retrieve the names of all customers along with the total amount they have spent on orders, including customers who have not placed any orders yet.
SELECT c.cust_name, COALESCE(SUM(o.amount), 0) AS total_amount_spent
FROM customers c
LEFT JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name;


-- Retrieve all customer details along with their corresponding order details, even if there are no corresponding orders, and display 'No order' instead of NULL. If there are no corresponding orders, also display the reason for no order (e.g., 'Out of stock').
SELECT c.cust_id,
       c.cust_name,
       c.age,
       c.address,
       CASE 
           WHEN o.order_id IS NULL THEN 'No order'
           ELSE o.order_id
       END AS order_id,
       CASE 
           WHEN o.order_id IS NULL THEN 'No order'
           ELSE p.status
       END AS order_status
FROM customers c
LEFT JOIN orders o ON c.cust_id = o.cust_id
LEFT JOIN payments p ON o.order_id = p.order_id
ORDER BY c.cust_id;


--  Retrieve the names of books along with their prices and the ranking of each book based on their prices, where the books are ranked in descending order of price
SELECT title, price, RANK() OVER (ORDER BY price DESC) AS price_rank
FROM books;


--  Retrieve the names of books along with their prices and the cumulative distribution of each book's price, indicating what fraction of books have prices less than or equal to the price of each book.
SELECT title, price, CUME_DIST() OVER (ORDER BY price) AS cumulative_distribution
FROM books;

-- Retrieve the names of books along with their prices and the price of the previous book in the list, ordered by price in ascending order.

SELECT title, price, LAG(price) OVER (ORDER BY price) AS previous_price
FROM books;


-- Retrieve the names of books along with their prices and the price of the next book in the list, ordered by price in ascending order.

SELECT title, price, LEAD(price) OVER (ORDER BY price) AS next_price
FROM books;