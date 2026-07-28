USE logistix_db;

SELECT
    `Order Id`,
    `Sales`,
    CASE
        WHEN `Sales` >= 1000 THEN 'High'
        WHEN `Sales` >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category
FROM fact_orders;

SELECT
    `Order Id`,
    `Benefit per order`,
    CASE
        WHEN `Benefit per order` > 100 THEN 'High Profit'
        WHEN `Benefit per order` >= 0 THEN 'Profit'
        ELSE 'Loss'
    END AS profit_status
FROM fact_orders;

SELECT
    `Order Id`,
    `Days for shipping (real)`,
    CASE
        WHEN `Days for shipping (real)` <= 2 THEN 'Fast'
        WHEN `Days for shipping (real)` <= 5 THEN 'Normal'
        ELSE 'Slow'
    END AS shipping_speed
FROM fact_orders;

SELECT
    `Order Id`,
    `Late_delivery_risk`,
    CASE
        WHEN `Late_delivery_risk` = 1 THEN 'At Risk'
        ELSE 'On Time'
    END AS delivery_risk
FROM fact_orders;

SELECT
    `Customer Segment`,
    SUM(`Sales`) AS total_sales,
    CASE
        WHEN SUM(`Sales`) >= 5000000 THEN 'Excellent'
        WHEN SUM(`Sales`) >= 1000000 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance
FROM fact_orders
GROUP BY `Customer Segment`;

SELECT
    `Market`,
    AVG(`Benefit per order`) AS avg_profit,
    CASE
        WHEN AVG(`Benefit per order`) > 50 THEN 'Highly Profitable'
        WHEN AVG(`Benefit per order`) > 20 THEN 'Profitable'
        ELSE 'Low Profit'
    END AS profitability
FROM fact_orders
GROUP BY `Market`;

SELECT
    `Product Name`,
    `Product Price`,
    CASE
        WHEN `Product Price` >= 500 THEN 'Premium'
        WHEN `Product Price` >= 100 THEN 'Mid Range'
        ELSE 'Budget'
    END AS price_category
FROM fact_orders;

SELECT
    `Order Status`,
    COUNT(*) AS total_orders,
    CASE
        WHEN COUNT(*) >= 50000 THEN 'High Volume'
        ELSE 'Normal Volume'
    END AS order_volume
FROM fact_orders
GROUP BY `Order Status`;

SELECT
    `Category Name`,
    AVG(`Sales`) AS avg_sales,
    CASE
        WHEN AVG(`Sales`) >= 300 THEN 'Top Category'
        ELSE 'Regular Category'
    END AS category_performance
FROM fact_orders
GROUP BY `Category Name`;

SELECT
    `Shipping Mode`,
    AVG(`Days for shipping (real)`) AS avg_days,
    CASE
        WHEN AVG(`Days for shipping (real)`) <= 2 THEN 'Excellent'
        WHEN AVG(`Days for shipping (real)`) <= 4 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS shipping_rating
FROM fact_orders
GROUP BY `Shipping Mode`;