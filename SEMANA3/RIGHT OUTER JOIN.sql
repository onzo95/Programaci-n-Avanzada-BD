USE Northwind_S02_Lab;

/***
RIGHT OUTER JOIN
***/

SELECT
c.CustomerID,
c.ContactName,
o.OrderID,
o.OrderDate
FROM dbo.Customers as c
RIGHT OUTER JOIN dbo.Orders as o
ON c.CustomerID = o.CustomerID;

SELECT
sup.SupplierID,
sup.CompanyName,
p.ProductID,
p.ProductName
FROM dbo.Suppliers as sup
RIGHT OUTER JOIN dbo.Products as p
ON sup.SupplierID = p.SupplierID;