# 👥 Customer Segmentation Analysis — SQL Project

## 🔍 Project Overview
Analyzed 793 unique customers from the Superstore Sales dataset 
to segment them by spending behavior, profitability and order 
frequency — enabling targeted business strategy per customer tier.

**Tools Used:** SQL (SQLite)

---

## 📁 Dataset
- **Source:** Superstore Sales Dataset (Kaggle)
- **Customers:** 793 unique customers
- **Period:** 2014 – 2017
- **Fields:** Customer Name, Segment, Sales, Profit, Order ID

---

## 🎯 Business Questions Answered

| # | Question | Concept Used |
|---|----------|-------------|
| 1 | Total spending per customer? | GROUP BY, SUM |
| 2 | Segment customers by spending tier? | CASE WHEN, CTE |
| 3 | How many customers in each tier? | Multiple CTEs |
| 4 | Average spend per tier? | SUM, COUNT, CTE |
| 5 | Most profitable customers? | RANK, Window Function |
| 6 | Most frequent customers? | COUNT DISTINCT |
| 7 | Segment wise profitability? | GROUP BY, AVG |
| 8 | Complete segmentation summary? | Multiple CTEs, AVG |

---

## 💡 Key Insights

1. **793 customers** with spending ranging from 4.83 to 25,043
2. **20 Platinum customers** (3%) generate 11% of total revenue
3. **Platinum customers spend 24x more** than Bronze — 13,245 vs 553
4. **Tamara Chand** is most profitable despite Sean Miller spending most
5. **Emily Phan** orders most frequently (17 orders) but not highest spender
6. **Home Office** most profitable per customer at 407 — despite smallest size
7. **Gold tier** most engaged with 8.1 avg orders — best upsell opportunity
8. **Top 12%** of customers (Platinum + Gold) generate 39% of total revenue

---

## 🔗 Key Finding
> Gold customers place the most orders on average (8.1) — even more 
> than Platinum (7.9) — making them the perfect candidates for 
> targeted upsell campaigns to push them into Platinum tier.

---

## 📊 Customer Tier Summary

| Tier | Customers | Revenue | Profit | Avg Orders | Avg Spent |
|------|-----------|---------|--------|------------|-----------|
| Platinum | 20 | 2,64,910 | 55,536 | 7.9 | 13,245 |
| Gold | 97 | 6,47,049 | 84,777 | 8.1 | 6,671 |
| Silver | 509 | 12,92,909 | 1,34,910 | 6.6 | 2,540 |
| Bronze | 167 | 92,333 | 11,174 | 4.1 | 553 |

---

## 📂 Files
- `customer_segmentation.sql` — All 8 SQL queries with comments
- `customer_segmentation_readme.md` — Project overview and insights

---

## 👤 Author
**Harsh Yadav**
Aspiring Data Analyst | SQL | Excel | Power BI
[LinkedIn](https://linkedin.com/in/harsh-yadav)
[GitHub](https://github.com/honey7114)
