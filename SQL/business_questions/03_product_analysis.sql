USE logistix_db;

-- 1. Top 10 Products by Revenue
SELECT
    `Product Name`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_revenue DESC
LIMIT 10;

-- 2. Bottom 10 Products by Revenue
SELECT
    `Product Name`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_revenue ASC
LIMIT 10;

-- 3. Top Categories by Revenue
SELECT
    `Category Name`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Category Name`
ORDER BY total_revenue DESC;

-- 4. Top Departments by Revenue
SELECT
    `Department Name`,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Department Name`
ORDER BY total_revenue DESC;

-- 5. Average Product Price by Category
SELECT
    `Category Name`,
    ROUND(AVG(`Product Price`), 2) AS average_price
FROM fact_orders
GROUP BY `Category Name`
ORDER BY average_price DESC;

-- 6. Most Ordered Products
SELECT
    `Product Name`,
    SUM(`Order Item Quantity`) AS total_quantity
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_quantity DESC
LIMIT 10;

-- 7. Highest Profit Products
SELECT
    `Product Name`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;

-- 8. Average Discount by Category
SELECT
    `Category Name`,
    ROUND(AVG(`Order Item Discount`), 2) AS average_discount
FROM fact_orders
GROUP BY `Category Name`
ORDER BY average_discount DESC;

-- 9. Products with Highest Average Sales
SELECT
    `Product Name`,
    ROUND(AVG(`Sales`), 2) AS average_sales
FROM fact_orders
GROUP BY `Product Name`
ORDER BY average_sales DESC
LIMIT 10;

-- 10. Product Performance by Market
SELECT
    `Market`,
    COUNT(DISTINCT `Product Card Id`) AS unique_products,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM fact_orders
GROUP BY `Market`
ORDER BY total_revenue DESC;