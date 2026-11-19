# Olist E-Commerce SQL Analysis

I analyzed the Brazilian Olist dataset using PostgreSQL to answer key business questions.

**📊 [View the Live Interactive Dashboard](https://cloudbv.github.io/sql-sales-analysis/)**

## Key Insights (Full Dataset)
*   **Total Revenue:** R$ 16,008,872.12
*   **Average Order Value:** R$ 160.99
*   **Average Review Score:** 4.09
*   **Top Selling Category:** `bed_bath_table` (11,115 items sold, R$ 103,698,868.68 in revenue)
*   **Top Seller:** Seller ID `4869f7...` based in state `SP` (R$ 229,472.63 in revenue)
*   **Slowest Delivery State:** `RR` (Roraima) taking an average of 29 days.

> **📝 Data Note (Dashboard vs. README):** The raw total revenue above (R$ 16M) includes all order statuses (canceled, unavailable, etc.) and all years. The live dashboard shows a stricter metric (R$ 15.37M) because it filters *only* for successfully delivered orders between Jan 2017 and Aug 2018 to accurately measure operational performance and revenue trends.

## Repository Contents
*   `01_sales_analysis.sql`: The SQL queries used to extract the initial insights.
*   `02_dashboard_queries.sql`: The aggregation queries used to generate the data for the live dashboard.
*   `index.html`: The custom-built HTML/JS/SVG dashboard.
*   `SOURCES.md`: Link to the Kaggle dataset and download date.
