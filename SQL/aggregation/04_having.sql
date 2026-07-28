USE logistix_db;

SELECT
    `Category Name`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Category Name`
HAVING SUM(`Sales`) > 100000
ORDER BY total_sales DESC;

SELECT
    `Customer Country`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Customer Country`
HAVING SUM(`Sales`) > 500000
ORDER BY total_sales DESC;

SELECT
    `Shipping Mode`,
    AVG(`Days for shipping (real)`) AS average_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
HAVING AVG(`Days for shipping (real)`) > 3;

SELECT
    `Customer Segment`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Customer Segment`
HAVING COUNT(*) > 10000;

SELECT
    `Department Name`,
    AVG(`Benefit per order`) AS average_benefit
FROM fact_orders
GROUP BY `Department Name`
HAVING AVG(`Benefit per order`) > 20
ORDER BY average_benefit DESC;

SELECT
    `Order Region`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Order Region`
HAVING SUM(`Sales`) > 1000000
ORDER BY total_sales DESC;

SELECT
    `Product Name`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Product Name`
HAVING SUM(`Sales`) > 50000
ORDER BY total_sales DESC;

SELECT
    `Order Status`,
    COUNT(*) AS total_orders
FROM fact_orders
GROUP BY `Order Status`
HAVING COUNT(*) > 1000;

SELECT
    `Market`,
    AVG(`Sales`) AS average_sales
FROM fact_orders
GROUP BY `Market`
HAVING AVG(`Sales`) > 200;

SELECT
    `Category Name`,
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM fact_orders
GROUP BY `Category Name`
HAVING COUNT(DISTINCT `Order Id`) > 1000
ORDER BY total_orders DESC;