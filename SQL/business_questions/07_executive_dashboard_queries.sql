USE logistix_db;

-- 1. Executive KPI Summary
SELECT
    ROUND(SUM(`Sales`), 2) AS total_revenue,
    ROUND(SUM(`Benefit per order`), 2) AS total_profit,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Customer Id`) AS total_customers,
    ROUND(AVG(`Sales`), 2) AS average_sales
FROM fact_orders;

-- 2. Revenue & Profit by Market
SELECT
    `Market`,
    ROUND(SUM(`Sales`), 2) AS revenue,
    ROUND(SUM(`Benefit per order`), 2) AS profit
FROM fact_orders
GROUP BY `Market`
ORDER BY revenue DESC;

-- 3. Top 10 Products by Revenue
SELECT
    `Product Name`,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY `Product Name`
ORDER BY revenue DESC
LIMIT 10;

-- 4. Top 10 Customers by Revenue
SELECT
    `Customer Id`,
    CONCAT(`Customer Fname`, ' ', `Customer Lname`) AS customer_name,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY
    `Customer Id`,
    `Customer Fname`,
    `Customer Lname`
ORDER BY revenue DESC
LIMIT 10;

-- 5. Revenue by Customer Segment
SELECT
    `Customer Segment`,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY `Customer Segment`
ORDER BY revenue DESC;

-- 6. Revenue by Category
SELECT
    `Category Name`,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY `Category Name`
ORDER BY revenue DESC;

-- 7. Profit by Department
SELECT
    `Department Name`,
    ROUND(SUM(`Benefit per order`), 2) AS profit
FROM fact_orders
GROUP BY `Department Name`
ORDER BY profit DESC;

-- 8. Top Regions by Revenue
SELECT
    `Order Region`,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY `Order Region`
ORDER BY revenue DESC;

-- 9. Late Delivery Rate
SELECT
    ROUND(
        SUM(CASE WHEN `Late_delivery_risk` = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS late_delivery_percentage
FROM fact_orders;

-- 10. Shipping Performance
SELECT
    `Shipping Mode`,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_shipping_days
FROM fact_orders
GROUP BY `Shipping Mode`
ORDER BY avg_shipping_days;

-- 11. Profit Margin
SELECT
    ROUND(
        (SUM(`Benefit per order`) / SUM(`Sales`)) * 100,
        2
    ) AS profit_margin_percentage
FROM fact_orders;

-- 12. Monthly Revenue Trend
SELECT
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY order_year, order_month;

-- 13. Monthly Profit Trend
SELECT
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month,
    ROUND(SUM(`Benefit per order`), 2) AS profit
FROM fact_orders
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY order_year, order_month;

-- 14. Top 10 Countries by Revenue
SELECT
    `Customer Country`,
    ROUND(SUM(`Sales`), 2) AS revenue
FROM fact_orders
GROUP BY `Customer Country`
ORDER BY revenue DESC
LIMIT 10;

-- 15. Executive Dashboard Summary
SELECT
    COUNT(DISTINCT `Order Id`) AS orders,
    COUNT(DISTINCT `Customer Id`) AS customers,
    COUNT(DISTINCT `Product Card Id`) AS products,
    ROUND(SUM(`Sales`), 2) AS revenue,
    ROUND(SUM(`Benefit per order`), 2) AS profit,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_shipping_days
FROM fact_orders;