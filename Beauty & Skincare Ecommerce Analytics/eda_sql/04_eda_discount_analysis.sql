/*==============================================================================================
			-- DISCOUNT EFFECTIVENESS ANALYSIS

ANALYSIS OVERVIEW:
1. DISCOUNT BANDING: Categorizing discount levels to find the "sweet spot" for profit.
2. REGIONAL SENSITIVITY: Identifying which markets rely most on discounts to move units.
3. GEOGRAPHIC IMPACT: Mapping city-level profitability under promotional pressure.
4. MARGIN DYNAMICS: Comparing "Discounted Margin %" vs. "Full Price Margin %."
5. LIFT VS. EROSION: Determining if increased sales volume justifies profit loss.
==============================================================================================*/
USE [E-commerce Sales];

	-- Profit by Discount Band 
SELECT
	Discount_Band,
	SUM(Profit) AS Total_Profit
FROM (
	SELECT
		Profit,
		CASE
			WHEN Discount = 0 THEN 'No Discount'
			WHEN Discount <= 0.20 THEN '20% & less'
			WHEN Discount <= 0.40 THEN '21-40%'
			WHEN Discount <= 0.60 THEN '41-60%'
			WHEN Discount <= 0.80 THEN '61-80%'
			ELSE 'Above 80%'
		END AS Discount_Band
	FROM E_commerce_sales
	)t
GROUP BY Discount_Band
ORDER BY Discount_Band;

	-- Discount impact by Market/Region
SELECT
Market,
Region,
SUM(CASE WHEN Discount > 0 THEN Quantity ELSE 0 END) AS Discounted_Units_Sold,
SUM(CASE WHEN Discount = 0 THEN Quantity ELSE 0 END) AS FullPrice_Units_Sold,
-- (negative difference = strong price sensitivity)
SUM(CASE WHEN Discount = 0 THEN Quantity ELSE 0 END) - SUM(CASE WHEN Discount > 0 THEN Quantity ELSE 0 END) AS Difference
FROM E_commerce_sales
GROUP BY Market, Region
ORDER BY Discounted_Units_Sold DESC; 

	-- Geography + Discount Interaction
SELECT
Region,
City,
SUM(Profit) AS Total_Profit,
SUM(CASE WHEN Discount > 0 THEN Profit ELSE 0 END) AS Discounted_Profit
FROM E_commerce_sales
GROUP BY Region, City
ORDER BY Discounted_Profit;

	-- Sales Lift vs. Profit Erosion / Discounted vs Full Price Profit Comparison
SELECT
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit,
	SUM(CASE WHEN Discount > 0 THEN Sales ELSE 0 END) AS Discounted_Sales,
	SUM(CASE WHEN Discount > 0 THEN Profit ELSE 0 END) AS Discounted_Profit,
	SUM(CASE WHEN Discount > 0 THEN Profit ELSE 0 END) / SUM(CASE WHEN Discount > 0 THEN Sales ELSE 0 END) * 100 AS Discount_Margin, 
	SUM(CASE WHEN Discount = 0 THEN Sales ELSE 0 END) AS FullPrice_Sales,
	SUM(CASE WHEN Discount = 0 THEN Profit ELSE 0 END) AS FullPrice_Profit,
	SUM(CASE WHEN Discount = 0 THEN Profit ELSE 0 END) / SUM(CASE WHEN Discount = 0 THEN Sales ELSE 0 END) * 100 AS FullPrice_Margin,
	SUM(CASE WHEN Discount = 0 THEN Sales ELSE 0 END) - SUM(CASE WHEN Discount > 0 THEN Sales ELSE 0 END) AS Sales_Diff
FROM E_commerce_sales;





