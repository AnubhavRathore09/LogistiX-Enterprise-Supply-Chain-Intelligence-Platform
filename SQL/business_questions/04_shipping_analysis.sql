USE logistix_db;

-- 1. Shipping Mode Performance
SELECT
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY avg_shipping_days;

-- 2. Delivery Status Distribution
SELECT
    `Delivery Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Delivery Status`
ORDER BY total_orders DESC;

-- 3. Late Deliveries by Market
SELECT
    `Market`,
    COUNT(*) AS late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1
GROUP BY `Market`
ORDER BY late_deliveries DESC;

-- 4. Late Deliveries by Region
SELECT
    `Order Region`,
    COUNT(*) AS late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1
GROUP BY `Order Region`
ORDER BY late_deliveries DESC;

-- 5. Average Shipping Days by Category
SELECT
    `Category Name`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Category Name`
ORDER BY avg_shipping_days DESC;

-- 6. Average Shipping Days by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY avg_shipping_days DESC;

-- 7. Scheduled vs Actual Shipping Days
SELECT
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_days,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_days
FROM fact_orders;

-- 8. Top 10 Products with Most Late Deliveries
SELECT
    `Product Name`,
    COUNT(*) AS late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1
GROUP BY `Product Name`
ORDER BY late_deliveries DESC
LIMIT 10;

-- 9. Shipping Mode Late Delivery Rate
SELECT
    `Shipping Mode`,
    ROUND(
        SUM(CASE WHEN `Late_delivery_risk` = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS late_delivery_rate
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY late_delivery_rate DESC;

-- 10. Regions with Fastest Average Shipping
SELECT
    `Order Region`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Order Region`
ORDER BY avg_shipping_days ASC;