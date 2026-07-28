USE logistix_db;

SELECT
    `Order Id`,
    `Customer Id`,
    `Sales`,
    ROW_NUMBER() OVER (
        ORDER BY `Sales` DESC
    ) AS row_num
FROM fact_orders;

SELECT
    `Order Id`,
    `Customer Segment`,
    `Sales`,
    ROW_NUMBER() OVER (
        PARTITION BY `Customer Segment`
        ORDER BY `Sales` DESC
    ) AS segment_row_number
FROM fact_orders;

SELECT
    `Order Id`,
    `Market`,
    `Sales`,
    RANK() OVER (
        PARTITION BY `Market`
        ORDER BY `Sales` DESC
    ) AS sales_rank
FROM fact_orders;

SELECT
    `Order Id`,
    `Market`,
    `Sales`,
    DENSE_RANK() OVER (
        PARTITION BY `Market`
        ORDER BY `Sales` DESC
    ) AS dense_sales_rank
FROM fact_orders;

SELECT
    `Order Id`,
    `Customer Id`,
    `Sales`,
    LAG(`Sales`, 1) OVER (
        PARTITION BY `Customer Id`
        ORDER BY `Order Date`
    ) AS previous_sale
FROM fact_orders;

SELECT
    `Order Id`,
    `Customer Id`,
    `Sales`,
    LEAD(`Sales`, 1) OVER (
        PARTITION BY `Customer Id`
        ORDER BY `Order Date`
    ) AS next_sale
FROM fact_orders;

SELECT
    `Order Id`,
    `Category Name`,
    `Sales`,
    FIRST_VALUE(`Sales`) OVER (
        PARTITION BY `Category Name`
        ORDER BY `Sales` DESC
    ) AS highest_sale_in_category
FROM fact_orders;

SELECT
    `Order Id`,
    `Category Name`,
    `Sales`,
    LAST_VALUE(`Sales`) OVER (
        PARTITION BY `Category Name`
        ORDER BY `Sales`
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_sale_in_category
FROM fact_orders;

SELECT
    `Order Id`,
    `Sales`,
    NTILE(4) OVER (
        ORDER BY `Sales` DESC
    ) AS sales_quartile
FROM fact_orders;

SELECT
    `Order Id`,
    `Order Region`,
    `Sales`,
    AVG(`Sales`) OVER (
        PARTITION BY `Order Region`
    ) AS regional_average_sales
FROM fact_orders;