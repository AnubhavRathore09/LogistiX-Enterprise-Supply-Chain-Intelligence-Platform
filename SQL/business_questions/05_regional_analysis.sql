USE logistix_db;

-- 1. Revenue by Market
SELECT
    `Market`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Market`
ORDER BY total_revenue DESC;

-- 2. Revenue by Region
SELECT
    `Order Region`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Order Region`
ORDER BY total_revenue DESC;

-- 3. Revenue by Country
SELECT
    `Customer Country`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Customer Country`
ORDER BY total_revenue DESC;

-- 4. Profit by Region
SELECT
    `Order Region`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Order Region`
ORDER BY total_profit DESC;

-- 5. Average Shipping Days by Region
SELECT
    `Order Region`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Order Region`
ORDER BY average_shipping_days;

-- 6. Total Customers by Country
SELECT
    `Customer Country`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Customer Country`
ORDER BY total_customers DESC;

-- 7. Total Orders by Region
SELECT
    `Order Region`,
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders
GROUP BY `Order Region`
ORDER BY total_orders DESC;

-- 8. Average Order Value by Market
SELECT
    `Market`,
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Order Id`),
        2
    ) AS average_order_value
FROM fact_orders
GROUP BY `Market`
ORDER BY average_order_value DESC;

-- 9. Late Delivery Rate by Region
SELECT
    `Order Region`,
    ROUND(
        SUM(CASE WHEN `Late_delivery_risk` = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS late_delivery_rate
FROM fact_orders
GROUP BY `Order Region`
ORDER BY late_delivery_rate DESC;

-- 10. Top 10 States by Revenue
SELECT
    `Customer State`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Customer State`
ORDER BY total_revenue DESC
LIMIT 10;