USE Northwind_S02_Lab

SELECT CustomerID, COUNT(OrderID) as NroPedidos
FROM dbo.Orders
GROUP BY CustomerID
ORDER BY NroPedidos desc

SELECT CategoryID, AVG(UnitPrice) as PrecioPromedio
FROM dbo.Products
GROUP BY CategoryID
ORDER BY CategoryID;