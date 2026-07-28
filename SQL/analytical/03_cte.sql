USE logistix_db;

WITH category_sales AS (
    SELECT
        `Category Name`,
        SUM(`Sales`) AS total_sales
    FROM fact_orders
    GROUP BY `Category Name`
)
SELECT *
FROM category_sales
ORDER BY total_sales DESC;

WITH customer_orders AS (
    SELECT
        `Customer Id`,
        COUNT(DISTINCT `Order Id`) AS total_orders
    FROM fact_orders
    GROUP BY `Customer Id`
)
SELECT *
FROM customer_orders
WHERE total_orders > 5
ORDER BY total_orders DESC;

WITH market_profit AS (
    SELECT
        `Market`,
        SUM(`Benefit per order`) AS total_profit
    FROM fact_orders
    GROUP BY `Market`
)
SELECT *
FROM market_profit
ORDER BY total_profit DESC;

WITH shipping_stats AS (
    SELECT
        `Shipping Mode`,
        AVG(`Days for shipping (real)`) AS avg_shipping_days
    FROM fact_orders
    GROUP BY `Shipping Mode`
)
SELECT *
FROM shipping_stats
ORDER BY avg_shipping_days;

WITH region_sales AS (
    SELECT
        `Order Region`,
        SUM(`Sales`) AS total_sales
    FROM fact_orders
    GROUP BY `Order Region`
)
SELECT *
FROM region_sales
WHERE total_sales > 1000000
ORDER BY total_sales DESC;

WITH department_summary AS (
    SELECT
        `Department Name`,
        COUNT(*) AS total_orders,
        SUM(`Sales`) AS total_sales
    FROM fact_orders
    GROUP BY `Department Name`
)
SELECT *
FROM department_summary
ORDER BY total_sales DESC;

WITH segment_performance AS (
    SELECT
        `Customer Segment`,
        AVG(`Benefit per order`) AS avg_profit
    FROM fact_orders
    GROUP BY `Customer Segment`
)
SELECT *
FROM segment_performance
ORDER BY avg_profit DESC;

WITH top_products AS (
    SELECT
        `Product Name`,
        SUM(`Sales`) AS total_sales
    FROM fact_orders
    GROUP BY `Product Name`
)
SELECT *
FROM top_products
LIMIT 10;

WITH delivery_summary AS (
    SELECT
        `Delivery Status`,
        COUNT(*) AS total_orders
    FROM fact_orders
    GROUP BY `Delivery Status`
)
SELECT *
FROM delivery_summary
ORDER BY total_orders DESC;

WITH country_sales AS (
    SELECT
        `Customer Country`,
        SUM(`Sales`) AS total_sales
    FROM fact_orders
    GROUP BY `Customer Country`
)
SELECT *
FROM country_sales
ORDER BY total_sales DESC;