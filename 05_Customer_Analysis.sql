use ecommerce_project;

-- STEP 5: CUSTOMER ANALYSIS
-- 1. Customer overview
select
count(distinct customer_id) AS total_customers,
count(distinct order_id) as total_orders,
round(sum(revenue), 2) as total_revenue,
round(sum(profit), 2) as total_profit
from ecommerce_sales;

-- 2. Revenue and profit by customer segment
select
customer_segment,
count(distinct customer_id) as total_cusotmers,
count(distinct order_id) as total_orders,
round(sum(revenue), 2) as total_revenue,
round(sum(profit), 2) as total_profit
from ecommerce_sales
group by Customer_Segment
order by total_revenue desc;

-- 3. Customer performance by gender
select
customer_gender,
count(distinct customer_id) as total_customers,
count(distinct order_id) as total_orders,
round(sum(revenue), 2) as total_revenue,
round(sum(profit), 2) as total_profit
from ecommerce_sales
group by customer_gender
order by total_revenue desc;

-- 4. Top 10 customers by revenue
SELECT
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY Customer_ID
ORDER BY total_revenue DESC
LIMIT 10;

-- 5. Repeat customer analysis
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) AS one_time_customers
FROM (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS order_count
    FROM ecommerce_sales
    GROUP BY Customer_ID
) AS customer_orders



