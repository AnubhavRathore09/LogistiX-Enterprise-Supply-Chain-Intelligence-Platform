USE logistix_db;

SELECT
    `Product Name`,
    SUM(`Sales`) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(`Sales`) DESC
    ) AS sales_rank
FROM fact_orders
GROUP BY `Product Name`;

SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    SUM(`Sales`) AS total_spent,
    DENSE_RANK() OVER (
        ORDER BY SUM(`Sales`) DESC
    ) AS customer_rank
FROM fact_orders
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`;

SELECT
    `Customer Country`,
    SUM(`Sales`) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(`Sales`) DESC
    ) AS country_rank
FROM fact_orders
GROUP BY `Customer Country`;

SELECT
    `Category Name`,
    SUM(`Benefit per order`) AS total_profit,
    DENSE_RANK() OVER (
        ORDER BY SUM(`Benefit per order`) DESC
    ) AS profit_rank
FROM fact_orders
GROUP BY `Category Name`;

SELECT
    `Order Region`,
    SUM(`Sales`) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(`Sales`) DESC
    ) AS region_rank
FROM fact_orders
GROUP BY `Order Region`;

SELECT
    `Market`,
    AVG(`Sales`) AS average_sales,
    DENSE_RANK() OVER (
        ORDER BY AVG(`Sales`) DESC
    ) AS market_rank
FROM fact_orders
GROUP BY `Market`;

SELECT
    `Department Name`,
    SUM(`Sales`) AS total_sales,
    ROW_NUMBER() OVER (
        ORDER BY SUM(`Sales`) DESC
    ) AS department_rank
FROM fact_orders
GROUP BY `Department Name`;

SELECT
    `Shipping Mode`,
    AVG(`Days for shipping (real)`) AS average_shipping_days,
    RANK() OVER (
        ORDER BY AVG(`Days for shipping (real)`)
    ) AS shipping_rank
FROM fact_orders
GROUP BY `Shipping Mode`;

SELECT
    `Customer Segment`,
    SUM(`Sales`) AS total_sales,
    DENSE_RANK() OVER (
        ORDER BY SUM(`Sales`) DESC
    ) AS segment_rank
FROM fact_orders
GROUP BY `Customer Segment`;

SELECT
    `Product Name`,
    SUM(`Order Item Quantity`) AS total_quantity,
    RANK() OVER (
        ORDER BY SUM(`Order Item Quantity`) DESC
    ) AS quantity_rank
FROM fact_orders
GROUP BY `Product Name`
LIMIT 20;