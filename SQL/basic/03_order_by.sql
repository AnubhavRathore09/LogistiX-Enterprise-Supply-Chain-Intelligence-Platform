USE logistix_db;

SELECT *
FROM fact_orders
ORDER BY `Sales` DESC;

SELECT *
FROM fact_orders
ORDER BY `Sales` ASC;

SELECT *
FROM fact_orders
ORDER BY `Benefit per order` DESC;

SELECT *
FROM fact_orders
ORDER BY `Product Price` DESC;

SELECT *
FROM fact_orders
ORDER BY `Order Item Quantity` DESC;

SELECT *
FROM fact_orders
ORDER BY `Days for shipping (real)` DESC;

SELECT *
FROM fact_orders
ORDER BY `Customer Country` ASC,
         `Customer City` ASC;

SELECT *
FROM fact_orders
ORDER BY `Order Region` ASC,
         `Sales` DESC;

SELECT *
FROM fact_orders
ORDER BY `Order Status` ASC,
         `Order Id` DESC;

SELECT *
FROM fact_orders
ORDER BY `Sales` DESC
LIMIT 10;

SELECT *
FROM fact_orders
ORDER BY `Benefit per order` DESC
LIMIT 20;

SELECT *
FROM fact_orders
ORDER BY `Product Price` ASC
LIMIT 15;