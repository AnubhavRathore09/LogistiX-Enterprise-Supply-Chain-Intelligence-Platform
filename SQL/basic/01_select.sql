USE logistix_db;

SELECT *
FROM fact_orders;

SELECT *
FROM fact_orders
LIMIT 10;

SELECT
    `Order Id`,
    `Customer Id`,
    `Product Name`,
    `Sales`,
    `Order Status`
FROM fact_orders;

SELECT
    `Customer Fname`,
    `Customer Lname`,
    `Customer City`,
    `Customer Country`
FROM fact_orders
LIMIT 20;

SELECT
    `Product Name`,
    `Category Name`,
    `Product Price`
FROM fact_orders;

SELECT
    `Order Id`,
    `Shipping Mode`,
    `Delivery Status`,
    `Days for shipping (real)`
FROM fact_orders;

SELECT DISTINCT `Market`
FROM fact_orders;

SELECT DISTINCT `Order Region`
FROM fact_orders;

SELECT DISTINCT `Customer Segment`
FROM fact_orders;

SELECT DISTINCT `Shipping Mode`
FROM fact_orders;