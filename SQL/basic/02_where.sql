USE logistix_db;

SELECT *
FROM fact_orders
WHERE `Sales` > 500;

SELECT *
FROM fact_orders
WHERE `Delivery Status` = 'Late delivery';

SELECT *
FROM fact_orders
WHERE `Customer Country` = 'India';

SELECT *
FROM fact_orders
WHERE `Order Status` = 'COMPLETE';

SELECT *
FROM fact_orders
WHERE `Product Price` > 1000;

SELECT *
FROM fact_orders
WHERE `Category Name` = 'Fishing';

SELECT *
FROM fact_orders
WHERE `Customer Segment` = 'Consumer';

SELECT *
FROM fact_orders
WHERE `Late_delivery_risk` = 1;

SELECT *
FROM fact_orders
WHERE `Shipping Mode` = 'Standard Class';

SELECT *
FROM fact_orders
WHERE `Order Region` = 'Western Europe';

SELECT *
FROM fact_orders
WHERE `Sales` > 500
  AND `Order Status` = 'COMPLETE';

SELECT *
FROM fact_orders
WHERE `Sales` > 500
   OR `Benefit per order` > 100;

SELECT *
FROM fact_orders
WHERE `Customer Country` <> 'United States';

SELECT *
FROM fact_orders
WHERE `Order Item Quantity` >= 5;

SELECT *
FROM fact_orders
WHERE `Product Status` = 0;