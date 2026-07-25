# Profit Margin & Sales Analytics Pipeline

## Project Overview
This project demonstrates an end-to-end data analytics workflow, tackling both data transformation in SQL Server and business intelligence visualization. It is divided into two primary business challenges:
1. **Sales Data Transformation (T-SQL):** Pivoting raw daily transaction data into a summarized quarterly report with dynamically calculated market shares and performance rankings.
2. **Defect Impact Analysis (Data Viz):** Calculating actual profit margins and visualizing the direct financial impact of product defects to identify critical operational thresholds.

## Skills & Tools Demonstrated
* **Database Management:** SQL Server (T-SQL), DDL, Bulk Insert operations.
* **Advanced SQL:** Common Table Expressions (CTEs), Window Functions (`SUM OVER()`, `RANK()`), Conditional Aggregation (`CASE WHEN`), Data Type Casting.
* **Data Visualization:** Scatter plots, trendline analysis, and data-driven storytelling (Excel/Power BI).

## Key Findings
* **Financial Impact:** Analysis reveals a baseline daily profit margin of ~50% under normal operating conditions (spanning 84% of the year). 
* **Critical Threshold:** When daily defects spike significantly, the profit margin experiences a hard drop to 37.5%, proving a direct, negative correlation between defect volume and profitability.

## How to Run This Project
1. Navigate to the `scripts/` folder.
2. Execute `01_table_creation.sql` in SQL Server Management Studio to initialize the database schema and load the raw CSVs from the `data/raw/` directory.
3. Run `02_data_transformation.sql` to generate the summarized Q1 output table.
