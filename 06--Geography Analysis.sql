use ecommerce_project;

-- 1. Overall performance by region
select
region,
count(distinct order_id) as total_orders,
count(distinct customer_id) as total_customers,
round(sum(revenue), 2) as total_revenue,
round(sum(profit) / nullif(sum(revenue), 0) * 100, 2) as profit_margin_pct
from ecommerce_sales
group by region
order by total_revenue desc;

-- 2. Country-wise performance
SELECT
    Country,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100, 2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Country
ORDER BY total_revenue DESC;

-- 3. Top 10 countries by profit
select
    Country,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100, 2) AS profit_margin_pct
FROM ecommerce_sales
GROUP BY Country
ORDER BY total_profit DESC
LIMIT 10;


-- 4. Order status by region
SELECT
    Region,
    Order_Status,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM ecommerce_sales
GROUP BY Region, Order_Status
ORDER BY Region, total_orders DESC;



