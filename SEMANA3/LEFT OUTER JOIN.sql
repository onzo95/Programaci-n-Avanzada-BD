USE Northwind_S02_Lab;

/***
LEFT OUTER JOIN
***/

SELECT
c.CustomerID,
c.ContactName,
o.OrderID,
o.OrderDate
FROM dbo.Customers as c
LEFT OUTER JOIN dbo.Orders as o
ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderDate

SELECT
p.ProductID,
p.ProductName,
c.CategoryName
FROM dbo.Products as p
LEFT OUTER JOIN dbo.Categories as c
ON p.CategoryID = c.CategoryID;