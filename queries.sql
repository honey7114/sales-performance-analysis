-- Query 1: Region wise Sales
SELECT region, ROUND(SUM(sales),2) AS total_sales 
FROM superstore 
GROUP BY region 
ORDER BY SUM(sales) DESC;

-- Query 2: Top 5 Sub-Categories by Revenue
SELECT sub_category, ROUND(SUM(sales),2) AS total_sales 
FROM superstore 
GROUP BY sub_category 
ORDER BY SUM(sales) DESC 
LIMIT 5;

-- Query 3: Profit Margin by Category
SELECT category, 
  ROUND(SUM(profit),2) AS total_profit,
  ROUND(SUM(sales),2) AS total_sales,
  ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin_pct 
FROM superstore 
GROUP BY category 
ORDER BY SUM(profit)/SUM(sales) DESC;

-- Query 4: Month over Month Sales Growth
SELECT 
  substr(order_date, -4) || '-' || 
  CASE WHEN instr(order_date, '/') < 3 
    THEN '0' || substr(order_date, 1, instr(order_date, '/')-1)
    ELSE substr(order_date, 1, instr(order_date, '/')-1)
  END AS month,
  ROUND(SUM(sales), 2) AS monthly_sales,
  ROUND(SUM(sales) - LAG(ROUND(SUM(sales),2)) OVER(
    ORDER BY substr(order_date, -4) || substr(order_date, 1, instr(order_date, '/')-1)
  ), 2) AS sales_growth
FROM superstore
GROUP BY month
ORDER BY month;

-- Query 5: Customer Segment Analysis
SELECT segment, COUNT(order_id) AS total_orders, 
  ROUND(SUM(sales),2) AS total_sales 
FROM superstore 
GROUP BY segment 
ORDER BY SUM(sales) DESC;

-- Query 6: Sales vs Profit by Region
SELECT region, ROUND(SUM(sales),2) AS total_sales, 
  ROUND(SUM(profit),2) AS total_profit,
  CASE 
    WHEN SUM(profit) > 50000 THEN 'High'
    WHEN SUM(profit) > 20000 AND SUM(profit) < 50000 THEN 'Medium'
    ELSE 'Low'
  END AS performance 
FROM superstore 
GROUP BY region 
ORDER BY SUM(profit) DESC;

-- Query 7: Top 3 Products per Category
WITH ranked_products AS (
  SELECT category, product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    RANK() OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS rnk
  FROM superstore
  GROUP BY category, product_name
)
SELECT category, product_name, total_sales, rnk
FROM ranked_products
WHERE rnk <= 3
ORDER BY category, rnk;

-- Query 8: Discounting by Region
SELECT region, ROUND(AVG(discount), 2) AS avg_discount
FROM superstore 
GROUP BY region
ORDER BY AVG(discount) DESC;

-- Query 9: Customers Who Spent Above Average
WITH customer_spending AS (
  SELECT customer_name, segment,
    ROUND(SUM(sales), 2) AS total_spent
  FROM superstore
  GROUP BY customer_name, segment
)
SELECT customer_name, segment, total_spent
FROM customer_spending
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_spending)
ORDER BY total_spent DESC;

-- Query 10: Region Performance Grade
SELECT region, ROUND(SUM(sales),2) AS total_sales, 
  ROUND(SUM(profit),2) AS total_profit,
  CASE
    WHEN SUM(sales) > 700000 THEN 'Excellent'
    WHEN SUM(sales) > 500000 AND SUM(sales) < 700000 THEN 'Good'
    ELSE 'Needs Improvement'
  END AS performance_grade
FROM superstore
GROUP BY region
ORDER BY SUM(sales) DESC;
