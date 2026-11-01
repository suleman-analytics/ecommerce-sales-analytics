USE ecommerce_project;
-- 1. Category Performance
USE ecommerce_project;
select
    Category,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_units_sold
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_profit DESC;

-- 2. Revenue by Category
select
category,
round(sum(revenue), 2) as total_revenue
from ecommerce_sales
group by category
order by total_revenue desc;

-- 3. Profit by Category
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_profit DESC;

-- 4. Profit Margin by Category
select
category,
round(
sum(profit) / nullif(sum(revenue), 0) *100,
2
) as profit_margin_pct
from ecommerce_sales
group by category
order by profit_margin_pct desc;

-- 5. Sub-Category Performance
SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_units_sold
FROM ecommerce_sales
GROUP BY Category, Sub_Category
ORDER BY total_profit DESC;

-- 6. Top 10 Products by Revenue
select
product_name,
round(sum(revenue), 2) as total_revenue,
sum(quantity) as total_units_sold
from ecommerce_sales
group by Product_Name
order by total_revenue desc
limit 10;

-- 7. Top 10 Products by Profit
SELECT
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_units_sold
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 10;


-- 8. Bottom 10 Products by Profit
SELECT
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_units_sold
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_profit ASC
LIMIT 10;

-- 9. Product Profit Margin
SELECT
    Product_Name,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS profit_margin_pct,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY profit_margin_pct DESC
LIMIT 10;

-- 10. Discount vs Profit Margin
SELECT
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        ELSE 'Discounted'
    END AS discount_status,
    ROUND(AVG(Profit_Margin_Pct), 2) AS avg_profit_margin,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY discount_status;

-- 11. Category + Discount Analysis
SELECT
    Category,
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        ELSE 'Discounted'
    END AS discount_status,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Profit_Margin_Pct), 2) AS avg_profit_margin
FROM ecommerce_sales
GROUP BY Category, discount_status
ORDER BY Category, total_profit DESC;

