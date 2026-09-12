USE Northwind_S02_Lab
go

SELECT CustomerID, CompanyName, Country
FROM dbo.Customers
WHERE Country = 'Germany'
GO

SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice >= 20