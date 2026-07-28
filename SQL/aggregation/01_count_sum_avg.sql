USE logistix_db;

SELECT COUNT(*) AS total_records
FROM fact_orders;

SELECT COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders;

SELECT COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders;

SELECT COUNT(DISTINCT `Product Card Id`) AS total_products
FROM fact_orders;

SELECT COUNT(DISTINCT `Category Id`) AS total_categories
FROM fact_orders;

SELECT SUM(`Sales`) AS total_sales
FROM fact_orders;

SELECT SUM(`Benefit per order`) AS total_benefit
FROM fact_orders;

SELECT SUM(`Order Item Quantity`) AS total_quantity
FROM fact_orders;

SELECT SUM(`Order Item Total`) AS total_revenue
FROM fact_orders;

SELECT AVG(`Sales`) AS average_sales
FROM fact_orders;

SELECT AVG(`Benefit per order`) AS average_benefit
FROM fact_orders;

SELECT AVG(`Product Price`) AS average_product_price
FROM fact_orders;

SELECT AVG(`Days for shipping (real)`) AS average_shipping_days
FROM fact_orders;

SELECT AVG(`Order Item Quantity`) AS average_quantity
FROM fact_orders;