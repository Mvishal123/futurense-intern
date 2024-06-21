-- -------------------------------------------------------------------------------------------------------------------------

-- 1NF
-- CONCEPT
-- Ensure that each table cell contains only atomic (indivisible) values, and each column contains values of a single type.

-- UNNORMALIZED TABLE
CREATE TABLE Orders (
    order_id INT,
    customer_name VARCHAR(50),
    products VARCHAR(100) -- Product names separated by commas
);

INSERT INTO Orders VALUES (1, 'John Doe', 'Laptop, Mouse, Keyboard');
INSERT INTO Orders VALUES (2, 'Jane Smith', 'Smartphone, Charger');


-- NORMALIZED TABLE
CREATE TABLE Order_Products (
    order_id INT,
    product_name VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Orders VALUES (1, 'John Doe');
INSERT INTO Orders VALUES (2, 'Jane Smith');

INSERT INTO Order_Products VALUES (1, 'Laptop');
INSERT INTO Order_Products VALUES (1, 'Mouse');

-- -------------------------------------------------------------------------------------------------------------------------

-- 2NF
-- CONCEPT
-- Ensure that the table is in 1NF and all non-key attributes are fully functionaly dependent on the primary key.

-- BEFORE 2NF
CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Order_Details VALUES (1, 1, 'John Doe', 'Laptop', 1000);
INSERT INTO Order_Details VALUES (1, 2, 'John Doe', 'Mouse', 20);
INSERT INTO Order_Details VALUES (2, 3, 'Jane Smith', 'Smartphone', 700);
INSERT INTO Order_Details VALUES (2, 4, 'Jane Smith', 'Charger', 30);


-- AFTER 2NF
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Order_Products (
    order_id INT,
    product_id INT,

    PRIMARY KEY (order_id, product_id)
);


INSERT INTO Orders VALUES (1, 'John Doe');
INSERT INTO Orders VALUES (2, 'Jane Smith');

INSERT INTO Products VALUES (1, 'Laptop', 1000);
INSERT INTO Products VALUES (2, 'Mouse', 20);
INSERT INTO Products VALUES (3, 'Smartphone', 700);
INSERT INTO Products VALUES (4, 'Charger', 30);

INSERT INTO Order_Products VALUES (1, 1);
INSERT INTO Order_Products VALUES (1, 2);
INSERT INTO Order_Products VALUES (2, 3);
INSERT INTO Order_Products VALUES (2, 4);


-- -------------------------------------------------------------------------------------------------------------------------


-- 3NF
-- CONCEPT
-- ensure that the table is in 2NF and all non-key attributes are not transitively dependent on the primary key.

-- BEFORE 3NF

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_address VARCHAR(100)
);

CREATE TABLE Order_Products (
    order_id INT,
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO Orders VALUES (1, 'John Doe', '123 Main St');
INSERT INTO Orders VALUES (2, 'Jane Smith', '456 High St');

INSERT INTO Order_Products VALUES (1, 1, 'Laptop', 1000);
INSERT INTO Order_Products VALUES (1, 2, 'Mouse', 20);
INSERT INTO Order_Products VALUES (2, 3, 'Smartphone', 700);
INSERT INTO Order_Products VALUES (2, 4, 'Charger', 30);


-- AFTER 3NF
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_address VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Order_Products (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES (1, 'John Doe', '123 Main St');
INSERT INTO Customers VALUES (2, 'Jane Smith', '456 High St');

INSERT INTO Orders VALUES (1, 1);
INSERT INTO Orders VALUES (2, 2);

INSERT INTO Products VALUES (1, 'Laptop', 1000);
INSERT INTO Products VALUES (2, 'Mouse', 20);
INSERT INTO Products VALUES (3, 'Smartphone', 700);
INSERT INTO Products VALUES (4, 'Charger', 30);

INSERT INTO Order_Products VALUES (1, 1);
INSERT INTO Order_Products VALUES (1, 2);
INSERT INTO Order_Products VALUES (2, 3);
INSERT INTO Order_Products VALUES (2, 4);


-- -------------------------------------------------------------------------------------------------------------------------

-- BCNF(BOYCE-CODD NORMAL FORM)
-- CONCEPT
-- Ensure that the table is in 3NF and for every functional dependency 
-- 𝑋 → 𝑌, 𝑋 is a super key


-- BEFORE BCNF
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    instructor_name VARCHAR(50),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO Enrollment VALUES (1, 101, 'Dr. Smith');
INSERT INTO Enrollment VALUES (2, 102, 'Dr. Brown');
INSERT INTO Enrollment VALUES (1, 102, 'Dr. Brown');
INSERT INTO Enrollment VALUES (3, 101, 'Dr. Smith');


-- AFTER BCNF
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Instructors VALUES (1, 'Dr. Smith');
INSERT INTO Instructors VALUES (2, 'Dr. Brown');

INSERT INTO Courses VALUES (101, 'Mathematics', 1);
INSERT INTO Courses VALUES (102, 'Physics', 2);

INSERT INTO Enrollment VALUES (1, 101);
INSERT INTO Enrollment VALUES (2, 102);
INSERT INTO Enrollment VALUES (1, 102);
INSERT INTO Enrollment VALUES (3, 101);


