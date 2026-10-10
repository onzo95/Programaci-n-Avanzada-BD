USE Northwind_S02_Lab;

CREATE OR ALTER VIEW dbo.CustomerOrderSumaryView
AS
SELECT
c.CompanyName,
c.CustomerID,
o.OrderID,
o.OrderDate,
p.ProductName,
od.Quantity,
od.UnitPrice,
od.Quantity * od.UnitPrice AS TotalPrice,
(SELECT COUNT(*) FROM dbo.Orders AS ox
WHERE ox.CustomerID = c.CustomerID) AS TotalOrders
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o ON c.CustomerID = o.CustomerID
INNER JOIN dbo.[Order Details] AS od ON od.OrderID = o.OrderID
INNER JOIN dbo.Products AS p ON p.ProductID = od.ProductID
WHERE YEAR(o.OrderDate) BETWEEN 1996 and 2025

SELECT TOP(5) * FROM
dbo.CustomerOrderSumaryView;