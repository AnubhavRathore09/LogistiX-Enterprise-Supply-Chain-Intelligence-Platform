USE logistix_db;

SELECT COUNT(*) AS total_records
FROM fact_orders;

SELECT COUNT(*) AS total_columns
FROM information_schema.columns
WHERE table_schema = 'logistix_db'
AND table_name = 'fact_orders';

SELECT *
FROM fact_orders
LIMIT 10;

SELECT
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Customer Id`) AS total_customers,
    COUNT(DISTINCT `Product Card Id`) AS total_products,
    COUNT(DISTINCT `Category Id`) AS total_categories
FROM fact_orders;

SHOW TABLES;

DESCRIBE fact_orders;