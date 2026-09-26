USE Northwind_S02_Lab;

--- Mostrar clientes que tiene pedidos de productos cuyo precio unitario es mayor a 20

SELECT
ProductID
FROM Products
WHERE UnitPrice > 20;

SELECT DISTINCT 
	c.CompanyName,
	c.ContactName
FROM Customers AS c
JOIN Orders AS o
ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS od
ON od.OrderID = o.OrderID
WHERE od.ProductID IN (
	SELECT
	ProductID
	FROM Products
	WHERE UnitPrice > 20
)