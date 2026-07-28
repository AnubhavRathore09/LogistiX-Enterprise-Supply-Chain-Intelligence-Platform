USE logistix_db;

SELECT
    `Market`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Market`;

SELECT
    `Customer Segment`,
    COUNT(*) AS total_customers
FROM fact_orders
GROUP BY `Customer Segment`;

SELECT
    `Category Name`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Category Name`
ORDER BY total_sales DESC;

SELECT
    `Department Name`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Department Name`
ORDER BY total_sales DESC;

SELECT
    `Shipping Mode`,
    AVG(`Days for shipping (real)`) AS average_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`;

SELECT
    `Delivery Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Delivery Status`;

SELECT
    `Order Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Order Status`;

SELECT
    `Customer Country`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Customer Country`
ORDER BY total_sales DESC;

SELECT
    `Order Region`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Order Region`
ORDER BY total_sales DESC;

SELECT
    `Product Name`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    `Customer State`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Customer State`
ORDER BY total_orders DESC;

SELECT
    `Category Name`,
    AVG(`Benefit per order`) AS average_benefit
FROM fact_orders
GROUP BY `Category Name`
ORDER BY average_benefit DESC;