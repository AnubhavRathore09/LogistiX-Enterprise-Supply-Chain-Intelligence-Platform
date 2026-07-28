USE logistix_db;

SELECT
    `Order Date`,
    `Sales`,
    AVG(`Sales`) OVER (
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_sales_7
FROM fact_orders;

SELECT
    `Order Date`,
    `Benefit per order`,
    AVG(`Benefit per order`) OVER (
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_profit_7
FROM fact_orders;

SELECT
    `Order Date`,
    `Market`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Market`
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS market_moving_avg_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Order Region`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Order Region`
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS region_moving_avg_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Category Name`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Category Name`
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS category_moving_avg_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Customer Segment`,
    `Benefit per order`,
    AVG(`Benefit per order`) OVER (
        PARTITION BY `Customer Segment`
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS segment_moving_avg_profit
FROM fact_orders;

SELECT
    `Order Date`,
    `Shipping Mode`,
    `Days for shipping (real)`,
    AVG(`Days for shipping (real)`) OVER (
        PARTITION BY `Shipping Mode`
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_shipping_days
FROM fact_orders;

SELECT
    `Order Date`,
    `Department Name`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Department Name`
        ORDER BY `Order Date`
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS department_moving_avg_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Customer Id`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Customer Id`
        ORDER BY `Order Date`
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS customer_moving_avg_sales
FROM fact_orders;

SELECT
    `Order Date`,
    `Product Name`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Product Name`
        ORDER BY `Order Date`
        ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS product_moving_avg_sales
FROM fact_orders;