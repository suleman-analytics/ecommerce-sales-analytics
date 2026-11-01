use ecommerce_project;
-- 1. Monthly Revenue
select
year,
month,
round(sum(revenue), 2) as monthly_revenue
from ecommerce_sales
group by year, month
order by year,month;

-- 2. Monthly Orders
select
year,
month,
count(distinct order_id) as monthly_orders
from ecommerce_sales
group by year, month
order by year, month;

-- 3. Monthly Profit
select
year,
month,
round(sum(profit), 2) as monthly_profit
from ecommerce_sales
group by year, month
order by year, month;

-- 4. Monthly Cost
SELECT
    Year,
    Month,
    ROUND(SUM(Cost), 2) AS monthly_cost
FROM ecommerce_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- 5. Monthly Revenue & Profit
SELECT
    Year,
    Month,
    ROUND(SUM(Revenue), 2) AS monthly_revenue,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM ecommerce_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- 6. Monthly Profit Margin
SELECT
    Year,
    Month,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS monthly_profit_margin_pct
FROM ecommerce_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- 7. Yearly Revenue
SELECT
    Year,
    ROUND(SUM(Revenue), 2) AS yearly_revenue
FROM ecommerce_sales
GROUP BY Year
ORDER BY Year;

-- 8. Yearly Profit
SELECT
    Year,
    ROUND(SUM(Profit), 2) AS yearly_profit
FROM ecommerce_sales
GROUP BY Year
ORDER BY Year;

-- 9. Yearly Revenue & Profit
SELECT
    Year,
    ROUND(SUM(Revenue), 2) AS yearly_revenue,
    ROUND(SUM(Profit), 2) AS yearly_profit
FROM ecommerce_sales
GROUP BY Year
ORDER BY Year;

-- 10. Yearly Profit Margin
select
year,
round(
sum(profit) / nullif(sum(revenue), 0) * 100,
2
) as yearly_profit_margin_pct
from ecommerce_sales
group by year
order by year;

