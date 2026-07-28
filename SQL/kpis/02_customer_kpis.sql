USE logistix_db;

-- Total Customers
SELECT
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders;

-- Active Customers (Customers with at least one order)
SELECT
    COUNT(DISTINCT `Customer Id`) AS active_customers
FROM fact_orders;

-- Repeat Customers
SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        `Customer Id`
    FROM fact_orders
    GROUP BY `Customer Id`
    HAVING COUNT(DISTINCT `Order Id`) > 1
) AS repeat_customer_list;

-- Average Orders Per Customer
SELECT
    ROUND(
        COUNT(DISTINCT `Order Id`) /
        COUNT(DISTINCT `Customer Id`),
        2
    ) AS average_orders_per_customer
FROM fact_orders;

-- Average Revenue Per Customer
SELECT
    ROUND(
        SUM(`Sales`) /
        COUNT(DISTINCT `Customer Id`),
        2
    ) AS average_revenue_per_customer
FROM fact_orders;

-- Top 10 Customers By Sales
SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    ROUND(SUM(`Sales`), 2) AS total_sales
FROM fact_orders
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY total_sales DESC
LIMIT 10;

-- Customers By Segment
SELECT
    `Customer Segment`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY total_customers DESC;

-- Customers By Country
SELECT
    `Customer Country`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Customer Country`
ORDER BY total_customers DESC;

-- Customers By State
SELECT
    `Customer State`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Customer State`
ORDER BY total_customers DESC;

-- Top 10 Customers By Orders
SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY total_orders DESC
LIMIT 10;