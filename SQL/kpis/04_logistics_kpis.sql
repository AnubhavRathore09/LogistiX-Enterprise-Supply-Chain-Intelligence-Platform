USE logistix_db;

-- Total Profit
SELECT
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders;

-- Average Profit Per Order Item
SELECT
    ROUND(AVG(`Benefit per order`), 2) AS average_profit
FROM fact_orders;

-- Profit Margin Percentage
SELECT
    ROUND(
        (SUM(`Benefit per order`) / SUM(`Sales`)) * 100,
        2
    ) AS profit_margin_percentage
FROM fact_orders;

-- Most Profitable Category
SELECT
    `Category Name`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Category Name`
ORDER BY total_profit DESC
LIMIT 10;

-- Most Profitable Department
SELECT
    `Department Name`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Department Name`
ORDER BY total_profit DESC;

-- Most Profitable Market
SELECT
    `Market`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Market`
ORDER BY total_profit DESC;

-- Most Profitable Region
SELECT
    `Order Region`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Order Region`
ORDER BY total_profit DESC;

-- Profit by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY total_profit DESC;

-- Top 10 Most Profitable Products
SELECT
    `Product Name`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;

-- Top 10 Most Profitable Customers
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

-- Average Profit by Shipping Mode
SELECT
    `Shipping Mode`,
    ROUND(AVG(`Benefit per order`), 2) AS average_profit
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY average_profit DESC;

-- Profit by Order Status
SELECT
    `Order Status`,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit
FROM fact_orders
GROUP BY `Order Status`
ORDER BY total_profit DESC;