/*
===============================================================================================================
Create the database Fast Growing Trees as fast_grow_trees_db
 create tables :
	1. input data (orderdates, sku , units sold)
	2. finacial_data (date, orders, defects, revenue, profits )
	===============================================================================================================

*/
-- createing the databse 
 IF OBJECT_ID('fast_grow_trees_db') IS NOT NULL
 drop database fast_grow_trees_db;
 go
    CREATE DATABASE fast_grow_trees_db;
go 
USE fast_grow_trees_db
GO
-- createing the tables
if OBJECT_ID ('input_data') IS NULL
	create table input_data
	(
		orderdates date,
		sku nvarchar(50),
		units_sold int
	);

	go 

	create table financial_info
	(
		Date date,
		Orders int,
		Defects int,
		Revenue decimal (18,2),
		Profit decimal (18,2)
	);

	