USE logistix_db;

SELECT MIN(`Sales`) AS minimum_sales
FROM fact_orders;

SELECT MAX(`Sales`) AS maximum_sales
FROM fact_orders;

SELECT MIN(`Benefit per order`) AS minimum_benefit
FROM fact_orders;

SELECT MAX(`Benefit per order`) AS maximum_benefit
FROM fact_orders;

SELECT MIN(`Product Price`) AS minimum_product_price
FROM fact_orders;

SELECT MAX(`Product Price`) AS maximum_product_price
FROM fact_orders;

SELECT MIN(`Order Item Quantity`) AS minimum_quantity
FROM fact_orders;

SELECT MAX(`Order Item Quantity`) AS maximum_quantity
FROM fact_orders;

SELECT MIN(`Days for shipping (real)`) AS minimum_shipping_days
FROM fact_orders;

SELECT MAX(`Days for shipping (real)`) AS maximum_shipping_days
FROM fact_orders;

SELECT MIN(`Order Item Discount`) AS minimum_discount
FROM fact_orders;

SELECT MAX(`Order Item Discount`) AS maximum_discount
FROM fact_orders;

SELECT MIN(`Latitude`) AS minimum_latitude,
       MAX(`Latitude`) AS maximum_latitude
FROM fact_orders;

SELECT MIN(`Longitude`) AS minimum_longitude,
       MAX(`Longitude`) AS maximum_longitude
FROM fact_orders;