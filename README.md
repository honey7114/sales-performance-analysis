# 📊 Sales Performance Analysis — SQL Project

## 🔍 Project Overview
Analyzed the Superstore Sales dataset containing 9,994 records 
across 4 regions, 3 categories and 793 customers to uncover 
revenue trends, profitability gaps and business growth opportunities.

**Tools Used:** SQL (SQLite) | Excel | Power BI

---

## 📁 Dataset
- **Source:** Superstore Sales Dataset (Kaggle)
- **Records:** 9,994 orders
- **Period:** 2014 – 2017
- **Fields:** Region, Category, Sub-Category, Sales, 
  Profit, Discount, Customer Segment

---

## 🎯 Business Questions Answered

| # | Question | Concept Used |
|---|----------|-------------|
| 1 | Which region has highest total sales? | GROUP BY, SUM |
| 2 | Top 5 sub-categories by revenue? | GROUP BY, LIMIT |
| 3 | Which category has best profit margin? | ROUND, SUM |
| 4 | Month over month sales growth? | LAG, Window Function |
| 5 | Which customer segment orders most? | COUNT, GROUP BY |
| 6 | Sales vs Profit by region? | CASE WHEN, GROUP BY |
| 7 | Top 3 products per category? | RANK, CTE |
| 8 | Which region discounts the most? | AVG, GROUP BY |
| 9 | Customers who spent above average? | CTE, Subquery |
| 10 | Region performance grade? | CASE WHEN, GROUP BY |

---

## 💡 Key Insights

1. **West region leads** with 7.25L in revenue — 31% of total business
2. **Phones & Chairs** are top revenue drivers — contributing 28% combined
3. **Furniture has only 2.49% profit margin** despite strong sales — major concern
4. **Clear seasonality** — sales peak every Sep-Nov across all 4 years
5. **Consumer segment** drives 50% of total revenue
6. **Central region over-discounts at 24%** — hurting profitability despite good sales
7. **Canon imageCLASS Copier** alone contributes significantly to Technology dominance
8. **300+ customers** spend above average — Sean Miller tops at 25K
9. **West is the only Excellent** performing region — high sales AND profit
10. **Central's discounting strategy** directly explains its low profit vs high sales

---

## 🔗 Key Finding
> Central region applies the highest discounts (24%) driving higher 
> sales volume — but significantly hurting profitability with the 
> lowest profit despite being the 2nd highest revenue region. 
> A review of Central's discounting strategy is recommended.

---

## 📂 Files
- `queries.sql` — All 10 SQL queries with comments
- `README.md` — Project overview and insights

---

## 👤 Author
**Harsh Yadav**  
Aspiring Data Analyst | SQL | Excel | Power BI  
[LinkedIn](https://linkedin.com/in/harsh-yadav)
