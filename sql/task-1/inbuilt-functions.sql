-- Inbuilt functions in SQL


-- 1. STRINGS
SELECT RIGHT('Hello, World!', 5);
SELECT LEFT('Hello, World!', 5);

SELECT REPLACE('Hello, World!', 'World', 'SQL');

SELECT REVERSE('Hello, World!');

SELECT POSITION('World' IN 'Hello, World!');

SELECT LENGTH('Hello, World!');

SELECT CHAR(65);

SELECT LPAD('123', 5, '0');
SELECT RPAD('123', 5, '0');

SELECT CONCAT('Hello', SPACE(5), 'World');


-- Date and Time
SELECT NOW() AS current_datetime;

SELECT YEAR('2023-05-01');

SELECT MONTH('2023-05-01');

SELECT DAY('2023-05-01');

SELECT DATE_FORMAT('2023-05-01', '%W, %M %d, %Y');
-- Monday, May 01, 2023 

SELECT STR_TO_DATE('01-05-2023', '%d-%m-%Y');

SELECT TIMESTAMPDIFF(DAY, '2023-05-01', '2023-06-01');
-- Gives the difference in days between the two dates

SELECT DATE_ADD('2023-05-01', INTERVAL 1 MONTH);

SELECT DATE_SUB('2023-05-01', INTERVAL 1 MONTH);

SELECT EXTRACT(YEAR FROM '2023-05-01');

-- Numeric Functions
SELECT ABS(-5);

SELECT CEIL(3.2);

SELECT EXP(1);

SELECT LOG(3.141);

SELECT LOG10(100);

SELECT MOD(10, 3);

SELECT SIGN(-3);

SELECT TRUNCATE(3.14159, 2);

SELECT PI();

SELECT RAND();



