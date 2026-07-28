USE logistix_db;

SELECT DISTINCT `Market`
FROM fact_orders;

SELECT DISTINCT `Customer Country`
FROM fact_orders;

SELECT DISTINCT `Customer State`
FROM fact_orders;

SELECT DISTINCT `Customer Segment`
FROM fact_orders;

SELECT DISTINCT `Order Region`
FROM fact_orders;

SELECT DISTINCT `Order Status`
FROM fact_orders;

SELECT DISTINCT `Shipping Mode`
FROM fact_orders;

SELECT DISTINCT `Category Name`
FROM fact_orders;

SELECT DISTINCT `Department Name`
FROM fact_orders;

SELECT DISTINCT
       `Customer Country`,
       `Customer Segment`
FROM fact_orders;

SELECT DISTINCT
       `Market`,
       `Order Region`
FROM fact_orders;

SELECT COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders;

SELECT COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders;

SELECT COUNT(DISTINCT `Product Card Id`) AS total_products
FROM fact_orders;