/*==============================================================================================
				CUSTOMER VALUE ANALYSIS

ANALYSIS OVERVIEW:
1. CORE KPIs: Measuring Total Sales, Profit, and Discount Dependency.
2. SEGMENTATION: Analyzing customer distribution and volume per segment.
3. CONTRIBUTION ANALYSIS: Comparing Sales vs. Profit share by segment.
4. PARETO PRINCIPLE (80/20): Identifying top-tier customers driving 80% of profit.
5. ANOMALY DETECTION: Isolating high-revenue customers with negative margins.
==============================================================================================*/
USE [E-commerce Sales];


	-- Key Performance Indicators (KPIs)
SELECT 
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit,
	COUNT(Order_ID) AS Total_Orders,
	COUNT(DISTINCT Customer_ID) AS Total_Customers,
	CAST(SUM(Sales) / COUNT(Order_ID) AS DECIMAL(10,2)) AS Avg_Order_Value,
	  SUM(CASE WHEN Discount > 0 THEN Profit ELSE 0 END) AS Discounted_Profit,
	CAST(SUM(CASE WHEN Discount > 0 THEN Profit ELSE 0 END) 
		/ SUM(Profit) *100 AS DECIMAL(5,2))  AS Discount_Dependency_Pct
FROM E_commerce_sales;

	-- Customer Count in each Segment
SELECT 
	Segment,
	COUNT(DISTINCT Customer_ID) AS Customers_Count,
	COUNT(DISTINCT Customer_ID) * 100 / SUM(COUNT(DISTINCT Customer_ID)) OVER () AS Customer_Percent
FROM E_commerce_sales
GROUP BY Segment
ORDER BY Customers_Count DESC

	-- Customer Segment - Sales / Profit Contribution
WITH SegmentSalesProfit AS (
	SELECT 
		Segment,
		SUM(Sales) AS Total_Sales,
		SUM(Profit) AS Total_Profit
	FROM E_commerce_sales
	GROUP BY Segment
)
SELECT 
		Segment,
		Total_Sales,
		CAST(Total_Sales * 100 / SUM(Total_Sales) OVER() AS DECIMAL(5,2)) AS Sales_Share,
		Total_Profit,
		CAST(Total_Profit * 100 / SUM(Total_Profit) OVER() AS DECIMAL(5,2))  AS Profit_Share
FROM SegmentSalesProfit
ORDER BY Profit_Share DESC;

	-- Pareto Principle (80/20)
WITH CustomerProfit AS (
    SELECT 
        Customer_ID, 
        SUM(Profit) AS TotalProfit
    FROM E_commerce_sales
    GROUP BY Customer_ID
    HAVING SUM(Profit) > 0  -- Only include customers with positive profit
),
CustomerRank AS (
    SELECT 
        Customer_ID,
        TotalProfit,
        ROW_NUMBER() OVER (ORDER BY TotalProfit DESC) AS Rank,
        COUNT(*) OVER () AS TotalCustomerCount,
        SUM(TotalProfit) OVER () AS GrandTotalProfit  -- total positive profit
    FROM CustomerProfit
),
Top20Percent AS (
    SELECT *
    FROM CustomerRank
    WHERE Rank <= CEILING(TotalCustomerCount * 0.20)  -- Top 20% of customers
)
SELECT 
    COUNT(*) AS CustomersInTop20,
    MAX(TotalCustomerCount) AS TotalCustomerCount,
    CAST(COUNT(*) AS FLOAT) / MAX(TotalCustomerCount) * 100 AS CustomerBasePercentage,
    SUM(TotalProfit) AS ProfitFromTop20,
    SUM(TotalProfit) * 100.0 / MAX(GrandTotalProfit) AS Top20ProfitPercentageOfTotal
FROM Top20Percent;

	-- High Sales Customer but Low/Negative Profit
SELECT
    Customer_ID,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Profit) * 1.0 / SUM(Sales) AS Profit_Margin
FROM E_commerce_sales
GROUP BY Customer_ID
HAVING SUM(Sales) > 3500 AND SUM(Profit) <= 0  -- Example threshold
ORDER BY Total_Sales DESC;
