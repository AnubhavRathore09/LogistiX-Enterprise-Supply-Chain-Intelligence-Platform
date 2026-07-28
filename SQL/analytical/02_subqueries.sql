USE logistix_db;

SELECT *
FROM fact_orders
WHERE `Sales` > (
    SELECT AVG(`Sales`)
    FROM fact_orders
);

SELECT *
FROM fact_orders
WHERE `Benefit per order` = (
    SELECT MAX(`Benefit per order`)
    FROM fact_orders
);

SELECT *
FROM fact_orders
WHERE `Product Price` = (
    SELECT MIN(`Product Price`)
    FROM fact_orders
);

SELECT
    `Category Name`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Category Name`
HAVING SUM(`Sales`) > (
    SELECT AVG(category_sales)
    FROM (
        SELECT SUM(`Sales`) AS category_sales
        FROM fact_orders
        GROUP BY `Category Name`
    ) AS category_summary
);

SELECT *
FROM fact_orders
WHERE `Customer Id` IN (
    SELECT `Customer Id`
    FROM fact_orders
    GROUP BY `Customer Id`
    HAVING COUNT(DISTINCT `Order Id`) > 5
);

SELECT *
FROM fact_orders
WHERE `Order Region` = (
    SELECT `Order Region`
    FROM fact_orders
    GROUP BY `Order Region`
    ORDER BY SUM(`Sales`) DESC
    LIMIT 1
);

SELECT *
FROM fact_orders
WHERE `Sales` = (
    SELECT MAX(`Sales`)
    FROM fact_orders
    WHERE `Customer Segment` = 'Consumer'
);

SELECT
    `Market`,
    SUM(`Sales`) AS total_sales
FROM fact_orders
GROUP BY `Market`
HAVING SUM(`Sales`) > (
    SELECT AVG(market_sales)
    FROM (
        SELECT SUM(`Sales`) AS market_sales
        FROM fact_orders
        GROUP BY `Market`
    ) AS market_summary
);

SELECT *
FROM fact_orders
WHERE `Days for shipping (real)` > (
    SELECT AVG(`Days for shipping (real)`)
    FROM fact_orders
);

SELECT *
FROM fact_orders
WHERE `Order Item Quantity` = (
    SELECT MAX(`Order Item Quantity`)
    FROM fact_orders
);