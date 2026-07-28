USE logistix_db;

-- Average Actual Shipping Days
SELECT
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_actual_shipping_days
FROM fact_orders;

-- Average Scheduled Shipping Days
SELECT
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS average_scheduled_shipping_days
FROM fact_orders;

-- Total Late Deliveries
SELECT
    COUNT(*) AS total_late_deliveries
FROM fact_orders
WHERE `Late_delivery_risk` = 1;

-- Late Delivery Percentage
SELECT
    ROUND(
        SUM(CASE WHEN `Late_delivery_risk` = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS late_delivery_percentage
FROM fact_orders;

-- On-Time Delivery Percentage
SELECT
    ROUND(
        SUM(CASE WHEN `Late_delivery_risk` = 0 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS on_time_delivery_percentage
FROM fact_orders;

-- Shipping Mode Performance
SELECT
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY average_shipping_days;

-- Delivery Status Distribution
SELECT
    `Delivery Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Delivery Status`
ORDER BY total_orders DESC;

-- Average Shipping Days by Region
SELECT
    `Order Region`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Order Region`
ORDER BY average_shipping_days;

-- Average Shipping Days by Market
SELECT
    `Market`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Market`
ORDER BY average_shipping_days;

-- Shipping Performance by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY average_shipping_days;

-- Fastest Shipping Mode
SELECT
    `Shipping Mode`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY average_shipping_days
LIMIT 1;

-- Slowest Shipping Mode
SELECT
    `Shipping Mode`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS average_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY average_shipping_days DESC
LIMIT 1;