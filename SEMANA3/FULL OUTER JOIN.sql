USE Northwind_S02_Lab;

/***
FULL OUTER JOIN
***/

SELECT
p.ProductID,
p.ProductName,
od.OrderID,
od.Quantity
FROM dbo.Products as P
FULL OUTER JOIN
dbo.[Order Details] as od
ON p.ProductID = od.ProductID;

