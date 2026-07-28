USE logistix_db;

-- 1. Overall Late Delivery Rate
SELECT
    ROUND(
        SUM(CASE WHEN `Late_delivery_risk` = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS late_delivery_rate
FROM fact_orders;

-- 2. Delivery Status Performance
SELECT
    `Delivery Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Delivery Status`
ORDER BY total_orders DESC;

-- 3. Shipping Mode Performance
SELECT
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(`Days for shipping (real)`),2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY avg_shipping_days;

-- 4. Categories with Highest Late Deliveries
SELECT
    `Category Name`,
    COUNT(*) AS late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1
GROUP BY `Category Name`
ORDER BY late_deliveries DESC
LIMIT 10;

-- 5. Markets with Highest Late Deliveries
SELECT
    `Market`,
    COUNT(*) AS late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1
GROUP BY `Market`
ORDER BY late_deliveries DESC;

-- 6. Regions with Highest Late Deliveries
SELECT
    `Order Region`,
    COUNT(*) AS late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1
GROUP BY `Order Region`
ORDER BY late_deliveries DESC;

-- 7. Average Shipping Time by Market
SELECT
    `Market`,
    ROUND(AVG(`Days for shipping (real)`),2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Market`
ORDER BY avg_shipping_days;

-- 8. Average Shipping Time by Category
SELECT
    `Category Name`,
    ROUND(AVG(`Days for shipping (real)`),2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Category Name`
ORDER BY avg_shipping_days DESC;

-- 9. Top 10 Products with Highest Shipping Delay
SELECT
    `Product Name`,
    ROUND(AVG(`Days for shipping (real)`),2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Product Name`
ORDER BY avg_shipping_days DESC
LIMIT 10;

-- 10. Order Status Distribution
SELECT
    `Order Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Order Status`
ORDER BY total_orders DESC;

-- 11. Average Scheduled vs Actual Shipping Days
SELECT
    ROUND(AVG(`Days for shipment (scheduled)`),2) AS scheduled_days,
    ROUND(AVG(`Days for shipping (real)`),2) AS actual_days
FROM fact_orders;

-- 12. Shipping Performance by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(AVG(`Days for shipping (real)`),2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY avg_shipping_days;