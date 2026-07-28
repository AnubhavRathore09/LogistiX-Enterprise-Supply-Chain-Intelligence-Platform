USE logistix_db;

-- 1. Total Revenue
SELECT
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders;

-- 2. Monthly Revenue Trend
SELECT
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month,
    ROUND(SUM(`Sales`), 2) AS monthly_revenue
FROM fact_orders
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY order_year, order_month;

-- 3. Revenue by Market
SELECT
    `Market`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Market`
ORDER BY total_revenue DESC;

-- 4. Revenue by Region
SELECT
    `Order Region`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Order Region`
ORDER BY total_revenue DESC;

-- 5. Revenue by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY total_revenue DESC;

-- 6. Top 10 Products by Revenue
SELECT
    `Product Name`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_revenue DESC
LIMIT 10;

-- 7. Top 10 Categories by Revenue
SELECT
    `Category Name`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Category Name`
ORDER BY total_revenue DESC
LIMIT 10;

-- 8. Revenue by Shipping Mode
SELECT
    `Shipping Mode`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY total_revenue DESC;

-- 9. Revenue by Order Status
SELECT
    `Order Status`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Order Status`
ORDER BY total_revenue DESC;

-- 10. Average Order Value
SELECT
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Order Id`),
        2
    ) AS average_order_value
FROM fact_orders;