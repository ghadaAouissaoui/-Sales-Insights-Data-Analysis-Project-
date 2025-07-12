SELECT * FROM sales.transactions;

SELECT COUNT(DISTINCT sales.customers.customer_code) AS total_customers FROM sales.customers;

SELECT * FROM sales.transactions WHERE currency = 'USD';

SELECT * FROM sales.markets WHERE zone = 'North';

SELECT DISTINCT markets_code FROM sales.markets WHERE markets_code = 'East';


-- 🔹  Total Revenue and Sales Quantity
SELECT
  SUM(sales_amount) AS total_revenue,
  SUM(sales_qty)    AS total_quantity
FROM sales.transactions;

-- 🔹  Revenue by Market
SELECT
  market_code,
  SUM(sales_amount) AS revenue_by_market
FROM sales.transactions
GROUP BY market_code
ORDER BY revenue_by_market DESC;

-- 🔹  Sales Quantity by Market
SELECT
  market_code,
  SUM(sales_qty) AS quantity_by_market
FROM sales.transactions
GROUP BY market_code
ORDER BY quantity_by_market DESC;

-- 🔹  Revenue Trend by Month (Assumes order_date is DATE type)
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(sales_amount)                AS monthly_revenue
FROM sales.transactions
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month ASC;

-- 🔹  Top 5 Customers by Revenue
SELECT
  customer_code,
  SUM(sales_amount) AS total_revenue
FROM sales.transactions
GROUP BY customer_code
ORDER BY total_revenue DESC
LIMIT 5;

-- 🔹  Top 5 Products by Revenue
SELECT
  product_code,
  SUM(sales_amount) AS total_revenue
FROM sales.transactions
GROUP BY product_code
ORDER BY total_revenue DESC
LIMIT 5;

-- 🔹 Revenue Contribution by Market (in %)
SELECT
  market_code,
  SUM(sales_amount)                            AS market_revenue,
  ROUND(
    SUM(sales_amount) * 100
    / (SELECT SUM(sales_amount) FROM sales.transactions),
    2
  ) AS revenue_contribution_pct
FROM sales.transactions
GROUP BY market_code
ORDER BY market_revenue DESC;


