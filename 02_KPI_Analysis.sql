USE ecommerce_project;

-- KPI 1: Total Orders
select
count(distinct order_id) as total_orders
from ecommerce_sales;

-- KPI 2: Total Customers
select
count(distinct customer_id) as total_customers
from ecommerce_sales;

 -- KPI 3: Total Revenue
 SELECT 
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM ecommerce_sales;

-- KPI 4: Total Cost
select
round(sum(cost), 2) as total_cost
from ecommerce_sales;

-- KPI 5: Total Profit
select
round(sum(profit), 2) as total_profit
from ecommerce_sales;

-- KPI 6: Total Units Sold
select
sum(quantity) as total_units_sold
from ecommerce_sales;


-- KPI 7: Average Order Value
SELECT 
    ROUND(AVG(Revenue), 2) AS average_order_value
FROM ecommerce_sales;

-- KPI 8: Average Profit Margin
SELECT 
    ROUND(AVG(Profit_Margin_Pct), 2) AS average_profit_margin
FROM ecommerce_sales;





    
describe ecommerce_sales;
