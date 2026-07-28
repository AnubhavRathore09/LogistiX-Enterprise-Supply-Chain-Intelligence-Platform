USE logistix_db;

SELECT
    `Order Date`,
    `Sales`,
    SUM(`Sales`) OVER (
        ORDER BY `Order Date`
    ) AS running_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Benefit per order`,
    SUM(`Benefit per order`) OVER (
        ORDER BY `Order Date`
    ) AS running_profit
FROM fact_orders;

SELECT
    `Order Date`,
    `Order Item Quantity`,
    SUM(`Order Item Quantity`) OVER (
        ORDER BY `Order Date`
    ) AS running_quantity
FROM fact_orders;

SELECT
    `Order Date`,
    `Market`,
    `Sales`,
    SUM(`Sales`) OVER (
        PARTITION BY `Market`
        ORDER BY `Order Date`
    ) AS market_running_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Order Region`,
    `Sales`,
    SUM(`Sales`) OVER (
        PARTITION BY `Order Region`
        ORDER BY `Order Date`
    ) AS region_running_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Customer Id`,
    `Sales`,
    SUM(`Sales`) OVER (
        PARTITION BY `Customer Id`
        ORDER BY `Order Date`
    ) AS customer_running_spending
FROM fact_orders;

SELECT
    `Order Date`,
    `Category Name`,
    `Sales`,
    SUM(`Sales`) OVER (
        PARTITION BY `Category Name`
        ORDER BY `Order Date`
    ) AS category_running_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Department Name`,
    `Sales`,
    SUM(`Sales`) OVER (
        PARTITION BY `Department Name`
        ORDER BY `Order Date`
    ) AS department_running_sales
FROM fact_orders;

SELECT
    `Order Date`,
    COUNT(*) OVER (
        ORDER BY `Order Date`
    ) AS cumulative_orders
FROM fact_orders;

SELECT
    `Order Date`,
    `Customer Segment`,
    `Benefit per order`,
    SUM(`Benefit per order`) OVER (
        PARTITION BY `Customer Segment`
        ORDER BY `Order Date`
    ) AS segment_running_profit
FROM fact_orders;