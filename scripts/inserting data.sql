/*
===============================================================================================================
inserting data imto tables and creating pipelines 
===============================================================================================================

*/
-- Truncate the table if you want to clear out the sample data we inserted earlier
TRUNCATE TABLE input_data;
GO

-- Bulk insert the data from your CSV file
BULK INSERT input_data
FROM 'D:\MY SQL Queries\fast_grow_trees_db\Analytics_Quiz_Data_Analyst.csv' -- Replace with the actual file path on your machine
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,                 -- Skips the header row
    FIELDTERMINATOR = ',',        -- Specifies the comma as the column separator
    ROWTERMINATOR = '\n',         -- Specifies the newline character as the row separator
    TABLOCK                       -- Improves load performance
);
GO
-- bulk insert  financial_data if it does not exist
truncate table financial_data;
go
BULK INSERT financial_data
FROM 'D:\MY SQL Queries\fast_grow_trees_db\Analytics_Quiz_Data_Analyst_1.csv' -- Replace with the actual file path on your machine
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,                 -- Skips the header row
    FIELDTERMINATOR = ',',        -- Specifies the comma as the column separator
   ROWTERMINATOR = '\r\n',         -- Specifies the newline character as the row separator
    TABLOCK                       -- Improves load performance
);