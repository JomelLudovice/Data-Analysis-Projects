/*==============================================================================================
			-- PRODUCT PROFITABILITY ANALYSIS

ANALYSIS OVERVIEW:
1. CATEGORY PERFORMANCE: Ranking product categories by volume, revenue, and profit.
2. MARKET DOMINANCE: Identifying the top 2 regional "anchor" categories using ROW_NUMBER.
3. GRANULAR PRODUCT INSIGHTS: Calculating per-product margin efficiency (Revenue vs. Profit).
4. MARGIN ANALYSIS: Isolating products with high sales but low profitability.
5. DISCOUNT EXPOSURE: Detecting products with high discount sensitivity and their impact on units sold.
==============================================================================================*/
USE [E-commerce Sales];

	-- Popular Product Category
SELECT
	Category,
	SUM(Quantity) AS Units_Sold,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit
FROM E_commerce_sales
GROUP BY Category
ORDER BY Units_Sold DESC;

	-- Top 2 Product Category in each Market
WITH CategoryRegionQty AS ( 
	SELECT
		Market,
		Category,
		SUM(Quantity) AS Units_Sold
	FROM E_commerce_sales
	GROUP BY Market, Category
), RankedCategories AS (
	SELECT 
		Market,
		Category,
		Units_Sold,
		ROW_NUMBER() OVER(PARTITION BY Market ORDER BY Units_Sold DESC) AS rn
	FROM CategoryRegionQty
)
SELECT
	Market, 
	Category AS Top_Category,
	Units_Sold
FROM RankedCategories
WHERE rn <= 2
ORDER BY Market, Units_Sold DESC;


	-- Top 2 Product Category in each Region
WITH CategoryRegionQty AS ( 
	SELECT
		Region,
		Category,
		SUM(Quantity) AS Units_Sold
	FROM E_commerce_sales
	GROUP BY Region, Category
), RankedCategories AS (
	SELECT 
		Region,
		Category,
		Units_Sold,
		ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Units_Sold DESC) AS rn
	FROM CategoryRegionQty
)
SELECT
	Region, 
	Category AS Top_Category,
	Units_Sold
FROM RankedCategories
WHERE rn <= 2
ORDER BY Region, Units_Sold DESC;

	-- Product-level insights:
		-- Quantity Sold		
		-- Revenue vs Profit
		-- Profit Margin
SELECT
	Category,
	Product,
	SUM(Quantity) AS Units_Sold,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit,
	CAST(SUM(Profit) * 100 / SUM(Sales) AS DECIMAL(5,2)) AS Profit_Margin
FROM E_commerce_sales
GROUP BY Category, Product
ORDER BY Total_Sales DESC;

	-- Highly Discounted Products
SELECT
	Product,
	SUM(Quantity) AS Units_Sold,
	AVG(Discount) AS Avg_Discount,
	MAX(Discount) AS Max_Discount,
	MIN(Discount) AS Min_Discount
FROM E_commerce_sales
WHERE Discount > 0
GROUP BY Product
ORDER BY Avg_Discount DESC, Units_Sold DESC;