-- Create table to import SQL data into.

USE [E-commerce Sales];

DROP TABLE IF EXISTS e_commerce_data;
CREATE TABLE e_commerce_data (
    Row_ID INT,
    Order_ID NVARCHAR(50),
    Order_Date DATE,
    Customer_ID NVARCHAR(50),
    Segment NVARCHAR(50),
    City NVARCHAR(50),
    State NVARCHAR(50),
    Country NVARCHAR(50),
    Country_latitude DECIMAL(9, 6),
    Country_longitude DECIMAL(9, 6),
    Region NVARCHAR(50),
    Market NVARCHAR(50),
    Subcategory NVARCHAR(100),
    Category NVARCHAR(50),
    Product NVARCHAR(100),
    Quantity INT,
    Sales DECIMAL(18, 2),
    Discount DECIMAL(5, 2),
    Profit DECIMAL(18, 2)
);

BULK INSERT e_commerce_data 
FROM 'C:\Users\jomjo\OneDrive\Desktop\The Ultimate Microsoft Excel Mastery Bundle - 8 Courses\SQL Server Projects\E commerce\E-commerce_data.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Skip the header row
    FIELDTERMINATOR = ',',  -- The delimiter
    ROWTERMINATOR = '\n',   -- New line character
    TABLOCK                 -- Helps with speed
);
