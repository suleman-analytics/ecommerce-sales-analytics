-- 1. Total rows and unique orders
SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT Order_ID) AS unique_orders
FROM ecommerce_sales;

-- 2. Date range
SELECT 
MIN(Order_Date) AS first_order_date,
MAX(order_date) AS last_order_date
FROM ecommerce_sales;

-- 3. Unique customers
SELECT 
    COUNT(DISTINCT Customer_ID) AS unique_customers
FROM ecommerce_sales;

-- 4. Orders by category
SELECT
Category,
COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY Category
order by total_orders desc;

-- 5. Orders by country
select
Country,
count(*) AS total_orders
FROM ecommerce_sales
group by country
order by total_orders desc;

-- 6. Order status distribution
select
order_status,
count(*) AS total_orders
from ecommerce_sales
group by Order_Status
order by total_orders desc;