USE Northwind_S02_Lab;

/***
CROSS JOIN
***/

SELECT
p.ProductName,
s.CompanyName
FROM dbo.Products as p
CROSS JOIN dbo.Suppliers as s
ORDER BY p.ProductName, s.CompanyName

SELECT
c.CategoryName,
p.ProductName,
p.UnitPrice
FROM dbo.Products as p
CROSS JOIN dbo.Categories as c
ORDER BY p.ProductName, c.CategoryName

