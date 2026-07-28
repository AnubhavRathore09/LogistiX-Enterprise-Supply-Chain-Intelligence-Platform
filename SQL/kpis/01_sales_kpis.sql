USE logistix_db;

-- Total Sales
SELECT
    ROUND(SUM(`Sales`), 2) AS total_sales
FROM fact_orders;

-- Total Orders
SELECT
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders;

-- Average Order Value
SELECT
    ROUND(SUM(`Sales`) / COUNT(DISTINCT `Order Id`), 2) AS average_order_value
FROM fact_orders;

-- Average Sales Per Order Item
SELECT
    ROUND(AVG(`Sales`), 2) AS average_sales
FROM fact_orders;

-- Total Quantity Sold
SELECT
    SUM(`Order Item Quantity`) AS total_quantity_sold
FROM fact_orders;

-- Total Revenue
SELECT
    ROUND(SUM(`Order Item Total`), 2) AS total_revenue
FROM fact_orders;

-- Total Discount Given
SELECT
    ROUND(SUM(`Order Item Discount`), 2) AS total_discount
FROM fact_orders;

-- Average Discount
SELECT
    ROUND(AVG(`Order Item Discount`), 2) AS average_discount
FROM fact_orders;

-- Highest Single Sale
SELECT
    MAX(`Sales`) AS highest_sale
FROM fact_orders;

-- Lowest Single Sale
SELECT
    MIN(`Sales`) AS lowest_sale
FROM fact_orders;

-- Sales by Market
SELECT
    `Market`,
    ROUND(SUM(`Sales`), 2) AS total_sales
FROM fact_orders
GROUP BY `Market`
ORDER BY total_sales DESC;

-- Sales by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(SUM(`Sales`), 2) AS total_sales
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY total_sales DESC;