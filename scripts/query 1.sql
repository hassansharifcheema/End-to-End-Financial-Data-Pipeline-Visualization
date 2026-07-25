/*
========================================================================================================
Write SQL to create the output table in cells H5:Q15 from the input data in columns A:C							
=========================================================================================================

*/
-- Step 1: Drop the previously created table so we can replace it entirely
IF OBJECT_ID('output_table', 'U') IS NOT NULL 
    DROP TABLE output_table;
GO

WITH MonthlySales AS (
    -- Pivot the rows into monthly columns and get Q1 totals per SKU
    SELECT 
        [SKU],
        SUM(CASE WHEN MONTH(orderdates) = 1 THEN units_sold ELSE 0 END) AS Jan_Sales,
        SUM(CASE WHEN MONTH(orderdates) = 2 THEN units_sold ELSE 0 END) AS Feb_Sales,
        SUM(CASE WHEN MONTH(orderdates) = 3 THEN units_sold ELSE 0 END) AS Mar_Sales,
        SUM(units_sold) AS Q1_Sales
    FROM input_data
    GROUP BY [SKU]
),
SalesTotals AS (
    -- Calculate the grand totals across all SKUs for the denominators
    SELECT
        [SKU],
        Jan_Sales,
        Feb_Sales,
        Mar_Sales,
        Q1_Sales,
        SUM(Jan_Sales) OVER () AS Total_Jan,
        SUM(Feb_Sales) OVER () AS Total_Feb,
        SUM(Mar_Sales) OVER () AS Total_Mar,
        SUM(Q1_Sales) OVER () AS Total_Q1
    FROM MonthlySales
)
-- Step 2: Compute the percentage shares, format with %, rank them, and recreate the table
SELECT
    [SKU],
    Jan_Sales AS [Jan Unit Sales],
    Feb_Sales AS [Feb Unit Sales],
    Mar_Sales AS [Mar Unit Sales],
    Q1_Sales AS [Q1 Unit Sales],
    
    -- Multiply by 100, round to 2 decimal places, cast to decimal to trim excess zeros, then convert to string and add %
    CAST(CAST(ROUND(Jan_Sales * 100.0 / NULLIF(Total_Jan, 0), 2) AS DECIMAL(5,2)) AS VARCHAR) + '%' AS [Jan Unit Sales Share],
    CAST(CAST(ROUND(Feb_Sales * 100.0 / NULLIF(Total_Feb, 0), 2) AS DECIMAL(5,2)) AS VARCHAR) + '%' AS [Feb Unit Sales Share],
    CAST(CAST(ROUND(Mar_Sales * 100.0 / NULLIF(Total_Mar, 0), 2) AS DECIMAL(5,2)) AS VARCHAR) + '%' AS [Mar Unit Sales Share],
    CAST(CAST(ROUND(Q1_Sales * 100.0 / NULLIF(Total_Q1, 0), 2) AS DECIMAL(5,2)) AS VARCHAR) + '%' AS [Q1 Unit Sales Share],
    
    RANK() OVER (ORDER BY Q1_Sales DESC) AS [Rank]
INTO output_table 
FROM SalesTotals
ORDER BY [Rank];
GO

-- View the updated table
SELECT * FROM output_table;
