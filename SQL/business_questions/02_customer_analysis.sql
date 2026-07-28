USE logistix_db;

-- 1. Top 10 Customers by Revenue
SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY total_revenue DESC
LIMIT 10;

-- 2. Customers with Highest Number of Orders
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

-- 3. Revenue by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY total_revenue DESC;

-- 4. Customers by Country
SELECT
    `Customer Country`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Customer Country`
ORDER BY total_customers DESC;

-- 5. Customers by State
SELECT
    `Customer State`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Customer State`
ORDER BY total_customers DESC;

-- 6. Average Revenue per Customer
SELECT
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Customer Id`),
        2
    ) AS average_revenue_per_customer
FROM fact_orders;

-- 7. Repeat Customers
SELECT
    `Customer Id`,
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders
GROUP BY `Customer Id`
HAVING COUNT(DISTINCT `Order Id`) > 1
ORDER BY total_orders DESC;

-- 8. Customer Segment Average Order Value
SELECT
    `Customer Segment`,
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Order Id`),
        2
    ) AS average_order_value
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY average_order_value DESC;

-- 9. Top 10 Customers by Profit
SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY total_profit DESC
LIMIT 10;

-- 10. Customer Distribution by Market
SELECT
    `Market`,
    COUNT(DISTINCT `Customer Id`) AS total_customers
FROM fact_orders
GROUP BY `Market`
ORDER BY total_customers DESC;