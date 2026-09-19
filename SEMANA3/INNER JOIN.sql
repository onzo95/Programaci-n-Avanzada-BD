USE Northwind_S02_Lab;

SELECT DB_NAME() AS BDACTUAL

/***
SENTENCIA INNER JOIN
***/

SELECT p.ProductID,
p.ProductName,
c.CategoryName
FROM dbo.Products as p
INNER JOIN dbo.Categories as c
ON p.CategoryID = c.CategoryID;

SELECT sup.SupplierID,
sup.CompanyName,
p.ProductName
FROM dbo.Suppliers as sup
INNER JOIN dbo.Products as p
ON sup.SupplierID = p.SupplierID;