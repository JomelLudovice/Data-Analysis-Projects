--===============================================================================
-- PRODUCT LEVEL MARKET BASKET ANALYSIS (ITEM-TO-ITEM)
--===============================================================================
/* DESCRIPTION: 
This SQL script identifies specific product-to-product relationships by 
joining transaction data to itself. This provides a granular view of 
buying behavior at the individual SKU level.

PURPOSE:
1. To extract and transform raw transaction logs into a structured 
   product-pairing dataset.
2. To calculate item-level affinity metrics (Support, Confidence, and Lift) 
   required for the Recommendation Dashboard.
3. To isolate significant product associations by filtering out statistical 
   noise and low-frequency transactions.
*/


USE Instacart;

-- Create a joined table for orders and product
DROP TABLE IF EXISTS order_product;
CREATE TABLE order_product (
	order_id INT,
	product_name NVARCHAR(225),
); 
INSERT INTO order_product (order_id, product_name)
SELECT 
	o.order_id,
	p.product_name
FROM orders o
JOIN product p
	ON o.product_id = p.product_id

-- Step 1: Identify Transactions with Multiple Products
SELECT 
	order_id,
	COUNT(DISTINCT product_name) AS product_count
FROM order_product
GROUP BY order_id
HAVING COUNT(DISTINCT product_name) > 1
ORDER BY product_count DESC;

-- Step 2: Generate Product Pairs
SELECT 
	t1.product_name AS Product_A,
	t2.product_name AS Product_B,
	COUNT(DISTINCT t1.order_id) AS Pair_count
FROM order_product t1
JOIN order_product t2
	ON t1.order_id = t2.order_id
	AND t1.product_name < t2.product_name
GROUP BY 
	t1.product_name,
	t2.product_name
HAVING COUNT(DISTINCT t1.order_id) > 1
ORDER BY Pair_count DESC;

-- Step 3: Calculate Support
SELECT
	product_name,
	COUNT(DISTINCT order_id) AS Order_count,
	COUNT(DISTINCT order_id) * 1.0 / (SELECT COUNT(DISTINCT order_id) FROM order_product) AS Support
FROM order_product
GROUP BY product_name
ORDER BY Support DESC;

-- Step 4: Calculate Confidence and Lift
WITH ProductSupport AS (
	SELECT
		product_name,
		COUNT(DISTINCT order_id) AS Order_count,
		COUNT(DISTINCT order_id) * 1.0 / (SELECT COUNT(DISTINCT order_id) FROM order_product) AS Support
	FROM order_product
	GROUP BY product_name
),
PairSupport AS (
	SELECT 
		t1.product_name AS Product_A,
		t2.product_name AS Product_B,
		COUNT(DISTINCT t1.order_id) AS PairOrder_count,
		COUNT(DISTINCT t1.order_id) * 1.0 / (SELECT COUNT(DISTINCT order_id) FROM order_product) AS Pair_support
	FROM order_product t1
	JOIN order_product t2
		ON t1.order_id = t2.order_id
		AND t1.product_name < t2.product_name
	GROUP BY 
		t1.product_name,
		t2.product_name
)
SELECT
	ps.Product_A,
	ps.Product_B,
	ps.PairOrder_count,
	CAST(ps.Pair_support AS DECIMAL(10,4)) AS SupportAB,
	CAST(ps.Pair_support / NULLIF(p1.Support,0) AS DECIMAL (10,2)) AS Confidence_AtoB,
	CAST(ps.Pair_support / NULLIF(p2.Support,0) AS DECIMAL (10,2)) AS Confidence_BtoA,
	CAST(ps.Pair_support / NULLIF(p1.Support * p2.Support,0) AS DECIMAL (10,2)) AS Lift
FROM PairSupport ps
	JOIN ProductSupport p1 ON ps.Product_A = p1.product_name
	JOIN ProductSupport p2 ON ps.Product_B = p2.product_name
ORDER BY 
	PairOrder_count DESC, 
	Lift DESC;



-- Top 10 Products by OrdersCount
SELECT TOP 10
	product_name,
	COUNT(DISTINCT order_id) AS order_count
FROM order_product 
GROUP BY product_name
ORDER BY order_count DESC;



-- Generate Department Pairs
SELECT 
    d1.department AS Department_A,
    d2.department AS Department_B,
    COUNT(DISTINCT o1.order_id) AS Pair_count
FROM orders o1
-- Join to the same order table to find OTHER products in that same order
JOIN orders o2 ON o1.order_id = o2.order_id 
-- Join to get the department name for the first product
JOIN product p1 ON o1.product_id = p1.product_id
JOIN departments d1 ON p1.department_id = d1.department_id
-- Join to get the department name for the second product
JOIN product p2 ON o2.product_id = p2.product_id
JOIN departments d2 ON p2.department_id = d2.department_id
-- This ensures we don't pair a department with itself and avoids "A-B, B-A" duplicates
WHERE d1.department < d2.department
GROUP BY 
    d1.department, 
    d2.department
ORDER BY Pair_count DESC;




