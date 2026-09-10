-- ================================================================================
-- Advanced Data Analysis with Complex Queries
-- Description: Creating summary tables and using Joins/Subqueries to identify 
-- top-performing products and analyze specific transaction details.
-- ================================================================================

-- --------------------------------------------------------------------------------
-- Create New tables to use in Joins:
-- --------------------------------------------------------------------------------

-- Table 1: Create a table for the top 100 most profitable products
CREATE TABLE top_100_profit_products AS
(SELECT
    product_name,
    SUM(profit) as total_profit
FROM megamart_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 100);

-- Display Table 1 
SELECT *
FROM top_100_profit_products;

-- --------------------------------------------------------------------------------

-- Table 2: Create a table for the top 100 best-selling products by quantity
CREATE TABLE top_100_sales_products AS
SELECT
    product_name,
    SUM(quantity) as total_quantity_sold
FROM megamart_sales
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 100;

-- Display Table 2
SELECT *
FROM top_100_sales_products;

-- --------------------------------------------------------------------------------
-- Complex Queries (Joins & Subqueries)
-- --------------------------------------------------------------------------------

-- a. Inner Join: Find products that are in both top 100 lists using our new tables.
-- (Identifying "Superstar" Products)
SELECT
    p.product_name,
    p.total_profit,
    s.total_quantity_sold
FROM top_100_profit_products p
INNER JOIN top_100_sales_products s
 ON p.product_name = s.product_name;
 
-- --------------------------------------------------------------------------------

-- b. Left Outer Join: Find which of our top profit products are NOT top sellers.
-- (Identifying "Hidden Gem" Products)
SELECT
    p.product_name,
    p.total_profit
FROM top_100_profit_products p
LEFT JOIN top_100_sales_products s 
 ON p.product_name = s.product_name
WHERE s.product_name IS NULL;
 
-- --------------------------------------------------------------------------------

-- c. Subquery: Find the transaction details for the single most profitable sale ever recorded.
-- (Analyzing the "Perfect Sale")
SELECT order_id, product_name, sales, discount, profit
FROM megamart_sales
WHERE
    profit = (
        SELECT MAX(profit)
        FROM megamart_sales
    );
