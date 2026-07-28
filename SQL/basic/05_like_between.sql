USE logistix_db;

SELECT *
FROM fact_orders
WHERE `Customer Fname` LIKE 'A%';

SELECT *
FROM fact_orders
WHERE `Customer Lname` LIKE '%son';

SELECT *
FROM fact_orders
WHERE `Product Name` LIKE '%Nike%';

SELECT *
FROM fact_orders
WHERE `Category Name` LIKE '%Golf%';

SELECT *
FROM fact_orders
WHERE `Customer Email` LIKE '%gmail%';

SELECT *
FROM fact_orders
WHERE `Customer Country` LIKE 'United%';

SELECT *
FROM fact_orders
WHERE `Sales` BETWEEN 100 AND 500;

SELECT *
FROM fact_orders
WHERE `Product Price` BETWEEN 50 AND 200;

SELECT *
FROM fact_orders
WHERE `Benefit per order` BETWEEN 20 AND 100;

SELECT *
FROM fact_orders
WHERE `Days for shipping (real)` BETWEEN 2 AND 5;

SELECT *
FROM fact_orders
WHERE `Order Item Quantity` BETWEEN 2 AND 10;

SELECT *
FROM fact_orders
WHERE `Sales` NOT BETWEEN 100 AND 500;

SELECT *
FROM fact_orders
WHERE `Product Price` NOT BETWEEN 50 AND 200;

SELECT *
FROM fact_orders
WHERE `Customer Fname` LIKE '_a%';

SELECT *
FROM fact_orders
WHERE `Product Name` LIKE '%Bike%';