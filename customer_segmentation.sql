-- Query 1: Total Spending Per Customer
SELECT customer_name, segment, 
  ROUND(SUM(sales),2) AS total_spent 
FROM superstore 
GROUP BY customer_name, segment
ORDER BY SUM(sales) DESC;

-- Query 2: Segment Customers By Spending Tier
WITH customer_spending AS (
  SELECT customer_name, segment,
    ROUND(SUM(sales),2) AS total_spent
  FROM superstore
  GROUP BY customer_name, segment
)
SELECT customer_name, segment, total_spent,
  CASE
    WHEN total_spent > 10000 THEN 'Platinum'
    WHEN total_spent > 5000 AND total_spent < 10000 THEN 'Gold'
    WHEN total_spent > 1000 AND total_spent < 5000 THEN 'Silver'
    ELSE 'Bronze'
  END AS customer_tier
FROM customer_spending
ORDER BY total_spent DESC;

-- Query 3: Count Customers And Revenue Per Tier
WITH customer_spending AS (
  SELECT customer_name, segment,
    ROUND(SUM(sales),2) AS total_spent
  FROM superstore
  GROUP BY customer_name, segment
),
customer_tiers AS (
  SELECT customer_name, segment, total_spent,
    CASE
      WHEN total_spent > 10000 THEN 'Platinum'
      WHEN total_spent > 5000 AND total_spent < 10000 THEN 'Gold'
      WHEN total_spent > 1000 AND total_spent < 5000 THEN 'Silver'
      ELSE 'Bronze'
    END AS customer_tier
  FROM customer_spending
)
SELECT customer_tier,
  COUNT(customer_name) AS total_customers,
  ROUND(SUM(total_spent),2) AS total_revenue
FROM customer_tiers
GROUP BY customer_tier
ORDER BY total_revenue DESC;

-- Query 4: Average Spend Per Customer Tier
WITH customer_spending AS (
  SELECT customer_name, segment,
    ROUND(SUM(sales),2) AS total_spent
  FROM superstore
  GROUP BY customer_name, segment
),
customer_tiers AS (
  SELECT customer_name, segment, total_spent,
    CASE
      WHEN total_spent > 10000 THEN 'Platinum'
      WHEN total_spent > 5000 AND total_spent < 10000 THEN 'Gold'
      WHEN total_spent > 1000 AND total_spent < 5000 THEN 'Silver'
      ELSE 'Bronze'
    END AS customer_tier
  FROM customer_spending
)
SELECT customer_tier,
  COUNT(customer_name) AS total_customers,
  ROUND(SUM(total_spent),2) AS total_revenue,
  ROUND(SUM(total_spent)/COUNT(customer_name),2) AS avg_spent_per_customer
FROM customer_tiers
GROUP BY customer_tier
ORDER BY total_revenue DESC;

-- Query 5: Most Profitable Customers (Top 10)
WITH customer_profit AS (
  SELECT customer_name, segment,
    ROUND(SUM(profit),2) AS total_profit
  FROM superstore
  GROUP BY customer_name, segment
)
SELECT customer_name, segment, total_profit,
  RANK() OVER(ORDER BY total_profit DESC) AS profit_rank
FROM customer_profit
LIMIT 10;

-- Query 6: Customer Order Frequency (Top 10)
SELECT customer_name, segment, 
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(sales),2) AS total_spent
FROM superstore 
GROUP BY customer_name, segment
ORDER BY COUNT(DISTINCT order_id) DESC 
LIMIT 10;

-- Query 7: Segment wise Profitability
SELECT segment, 
  COUNT(DISTINCT customer_name) AS total_customers,
  ROUND(SUM(sales),2) AS total_revenue,
  ROUND(SUM(profit),2) AS total_profit,
  ROUND(SUM(profit)/COUNT(DISTINCT customer_name),2) AS avg_profit_per_customer 
FROM superstore 
GROUP BY segment 
ORDER BY SUM(profit) DESC;

-- Query 8: Complete Customer Segmentation Summary
WITH customer_spending AS (
  SELECT customer_name, segment,
    ROUND(SUM(sales),2) AS total_spent,
    ROUND(SUM(profit),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
  FROM superstore
  GROUP BY customer_name, segment
),
customer_tiers AS (
  SELECT customer_name, segment, total_spent, total_profit, total_orders,
    CASE
      WHEN total_spent > 10000 THEN 'Platinum'
      WHEN total_spent > 5000 AND total_spent < 10000 THEN 'Gold'
      WHEN total_spent > 1000 AND total_spent < 5000 THEN 'Silver'
      ELSE 'Bronze'
    END AS customer_tier
  FROM customer_spending
)
SELECT customer_tier,
  COUNT(customer_name) AS total_customers,
  ROUND(SUM(total_spent),2) AS total_revenue,
  ROUND(SUM(total_profit),2) AS total_profit,
  ROUND(AVG(total_orders),1) AS avg_orders,
  ROUND(SUM(total_spent)/COUNT(customer_name),2) AS avg_spent_per_customer
FROM customer_tiers
GROUP BY customer_tier
ORDER BY total_revenue DESC;
