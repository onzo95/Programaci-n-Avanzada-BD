USE Northwind_S02_Lab;

SELECT CustomerID, CompanyName
FROM dbo.Customers
WHERE CompanyName LIKE 'C%'

SELECT CustomerID, CompanyName
FROM dbo.Customers
WHERE CompanyName LIKE '%on%'

SELECT CustomerID, CompanyName
FROM dbo.Customers
WHERE CompanyName LIKE '[A-C]%'

