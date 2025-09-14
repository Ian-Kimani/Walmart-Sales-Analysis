SELECT * 
FROM walmart_data;

ALTER TABLE walmart_data RENAME COLUMN "Sales" TO sales;

ALTER TABLE walmart_data RENAME COLUMN "Branch" TO branch;

ALTER TABLE walmart_data RENAME COLUMN "City" TO city;

ALTER TABLE walmart_data RENAME COLUMN "Month_name" TO month_name;

ALTER TABLE walmart_data RENAME COLUMN "Month" TO month;

ALTER TABLE walmart_data RENAME COLUMN "Year" TO year;

-- To find the total sales made
SELECT ROUND(CAST(SUM(sales)  AS DECIMAL), 2) AS Total_Sales
FROM walmart_data;

-- To find the sales made per YEAR
SELECT year,
	   ROUND(CAST(SUM(sales)  AS DECIMAL), 2)  AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- The average rating
SELECT ROUND(CAST(AVG(rating) AS DECIMAL), 2) AS Avg_rating
FROM walmart_data;

-- Total profit margin
SELECT ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS Total_Profit
FROM walmart_data;

-- Total sales made by each branch
SELECT branch,
	   ROUND(CAST(SUM(sales)  AS DECIMAL), 2) AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Total Sales made by city
SELECT city,
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Sales made by Category
SELECT category,
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Sales by payment METHOD
SELECT payment_method,ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Monthly sales trends
SELECT month_name,
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Daily sales trends
SELECT day_of_week,
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS Total_Sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Hourly Trends
SELECT EXTRACT(HOUR FROM CAST(time AS time)) AS Hour,
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS total_sales
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Average customer rating per category
-- Which category was most rated
SELECT category,
	   ROUND(CAST(AVG(rating) AS DECIMAL), 2) AS Ag_Rating
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Average Customer Rating BY Branch Top 5
SELECT branch,
	   ROUND(CAST(AVG(rating) AS DECIMAL), 2) AS Ag_Rating
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- To find the profit margin analysis per category
SELECT category, 
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS total_sales,
	   ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS total_profit,
	   ROUND(CAST(AVG(profit_margin) AS DECIMAL), 2) AS avg_profit_margin
FROM walmart_data
GROUP BY 1
ORDER BY 3 DESC;

-- To find the profit margin analysis per year
SELECT year,
	   ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS total_profit,
	   ROUND(CAST(AVG(profit_margin) AS DECIMAL), 2) AS avg_profit_margin
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- To find the profit margin analysis per month
SELECT month_name,
	   ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS total_profit,
	   ROUND(CAST(AVG(profit_margin) AS DECIMAL), 2) AS avg_profit_margin
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- To find the hourly sales pattern
SELECT EXTRACT(HOUR FROM CAST(time AS time)) AS Hour,
	   ROUND(CAST(SUM(sales) AS DECIMAL), 2) AS total_sales
FROM walmart_data
GROUP BY 1
ORDER BY 1;

-- To find the profit margin analysis by branch -- Top 5
SELECT branch,
	   ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS total_profit,
	   ROUND(CAST(AVG(profit_margin) AS DECIMAL), 2) AS avg_profit_margin
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- To find the profit margin analysis by city
SELECT city,
	   ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS total_profit,
	   ROUND(CAST(AVG(profit_margin) AS DECIMAL), 2) AS avg_profit_margin
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

--  
SELECT * 
FROM walmart_data;

-- Comparing branches by customer rating
SELECT branch,
	   ROUND(CAST(AVG(rating) AS DECIMAL), 2) AS Avg_rating
FROM walmart_data
GROUP BY 1
ORDER BY 2;

-- Comparing unit price vs quantity sold and check if cheaper items sell more
-- Group data by unit price ranges(bins)
-- Sum quantity sold per price bin
-- See if lower prices correspond to higher quantities
SELECT 
	CASE
		WHEN unit_price < 20 THEN '< 20'
		WHEN unit_price BETWEEN 20 AND 50 THEN '20 - 50'
		WHEN unit_price BETWEEN 50 AND 100 THEN '50 - 100'
        ELSE '> 100'
	END AS price_range,
	SUM(quantity) AS total_quantity,
	ROUND(CAST(AVG(unit_price) AS DECIMAL), 2) AS avg_price
FROM walmart_data
GROUP BY 1
ORDER BY 3 DESC; 
-- means higher priced items are selling more
-- or customers prefers quality / brand over price

-- Comparing price range by rating
SELECT 
	CASE
		WHEN unit_price < 20 THEN '< 20'
		WHEN unit_price BETWEEN 20 AND 50 THEN '20 - 50'
		WHEN unit_price BETWEEN 50 AND 100 THEN '50 - 100'
        ELSE '> 100'
	END AS price_range,
	ROUND(CAST(AVG(rating) AS DECIMAL), 2) AS avg_rating
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC; 

-- To check the categories that sell most in that price RANGE
SELECT category,
	   SUM(quantity) AS total_quantity,
	   ROUND(CAST(AVG(unit_price) AS DECIMAL), 2) AS avg_price
FROM walmart_data
where unit_price BETWEEN 50 AND 100
GROUP BY 1
ORDER BY 3 DESC;

-- Are expensive items well rated
SELECT category,
	   ROUND(CAST(AVG(rating) AS DECIMAL), 2) AS avg_rating
FROM walmart_data
WHERE unit_price BETWEEN 50 AND 100
GROUP BY 1
ORDER BY 2 DESC;


-- Relationship between quantity bought and rating
SELECT ROUND(rating) AS rating_level,
	   ROUND(CAST(AVG(quantity) AS DECIMAL), 2) AS avg_quantity
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;
-- shows higher rating are associated with buying more

-- To find the correlation
SELECT CORR(rating::numeric, quantity::numeric) AS correlation
FROM walmart_data;
-- A result near +1 shows a strong positive correlation (higher rating = more quantity)
-- near 0 no relationship
-- near -1 inverse relationship

-- correlation of 0.13674 means there's a very weak positive relationship between rating and quantity
-- In simple terms higher ratings align with buying more but the effect is SMALL

-- Customers might rate on experience not how much they bought
-- Quantity purchased does not strongly affect satisfaction
-- Other factors like category, price, or service may influence ratings more

-- Correlation by category
SELECT category,
	   CORR(rating::numeric, quantity::numeric) AS correlation
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- Correlation by payment method
SELECT payment_method,
	   CORR(rating::numeric, quantity::numeric) AS correlation
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- To check whether payment method affect profit or sales
-- Total profit by payment method
SELECT payment_method,
	   ROUND(CAST(SUM(profit_margin) AS DECIMAL), 2) AS total_profit
FROM walmart_data
GROUP BY 1
ORDER BY 2 DESC;

-- To find the correalation between quantity and profit
-- tells if buying more increases total profit
-- Assuming profit = profit_margin * quantity
SELECT CORR(quantity::numeric, (profit_margin * quantity)::numeric ) AS quantity_profit_correlation
FROM walmart_data;
-- You can trust that boosting sales volume directly increases profit

-- Correlation between rating and sales
-- Checks if higher rated transactions bring in more money
SELECT CORR(rating::numeric, sales::numeric) AS rating_sales_correlation
FROM walmart_data;
-- satisfaction might not directly depend on amount spent


-- Correlation between unit price and rating
-- Checks if higher priced items are rated better or worse
SELECT CORR(unit_price::numeric, rating::numeric) AS price_rating_correlation
FROM walmart_data;
-- customers dont seem to rate higher priced items better or worse
-- ratings are likely influenced by service, experience, or product quality not price


-- To find which categories perform best in each branch / city, 
-- so we can suggest what each branch / city should focus ON
SELECT city, category, SUM(sales) AS total_sales
FROM walmart_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- to get top category sold by each city
SELECT DISTINCT ON(city) city, category, 
	   SUM(sales) AS total_sales
FROM walmart_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- To get top category by branch
SELECT branch, category, SUM(sales) AS total_sales
FROM walmart_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- To get the top sold category by branch
SELECT DISTINCT ON(branch) branch, category, SUM(sales) AS total_sales
FROM walmart_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- to get the worst category sold by each city
SELECT DISTINCT ON(city) city, category, 
	   SUM(sales) AS total_sales
FROM walmart_data
GROUP BY 1, 2
ORDER BY 1, 3 ASC;

-- To get the worst sold category by branch
SELECT DISTINCT ON(branch) branch, category, SUM(sales) AS total_sales
FROM walmart_data
GROUP BY 1, 2
ORDER BY 1, 3 ASC;


















