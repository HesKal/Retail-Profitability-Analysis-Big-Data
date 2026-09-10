-- ================================================================================
-- Data Products: Profitability & Geographic Performance Analysis
-- Description: Queries designed to feed into BI dashboards to visualize 
-- profit drivers, loss-making categories, and regional performance.
-- ================================================================================

-- --------------------------------------------------------------------------------
-- DATA PRODUCT 1: PROFITABILITY ANALYSIS
-- --------------------------------------------------------------------------------

-- Base Query for Profitability Data Product
SELECT
    category,
    subcategory,
    profit,
    discount,
    sales
FROM megamart_sales;

-- Story 1.1: Average Profit by Product Category
-- Identifies which main product categories are the most and least profitable.
SELECT
    category,
    AVG(profit) AS average_profit
FROM megamart_sales 
GROUP BY category
ORDER BY average_profit DESC;
      
-- Story 1.2: Top Loss-Making Subcategories
-- Pinpoints specific subcategories that are draining profits (negative average profit).
SELECT
    subcategory,
    AVG(profit) AS average_profit
FROM megamart_sales 
GROUP BY subcategory
HAVING AVG(profit) < 0
ORDER BY average_profit ASC; 

-- --------------------------------------------------------------------------------
-- DATA PRODUCT 2: GEOGRAPHIC PERFORMANCE
-- --------------------------------------------------------------------------------

-- Base Query for Geographic Performance Data Product
SELECT
    region,
    state,
    sales,
    profit
FROM megamart_sales;

-- Story 2.1: Total Sales Revenue by Region
-- Shows the contribution of each region to the company's total sales revenue.
SELECT
    region,
    SUM(sales) AS total_sales
FROM megamart_sales 
GROUP BY region
ORDER BY total_sales DESC;

-- Story 2.2: Top 10 Most Profitable States
-- Highlights the key states that are driving the company's overall profitability.
SELECT
    state,
    SUM(profit) AS total_profit
FROM megamart_sales 
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;
