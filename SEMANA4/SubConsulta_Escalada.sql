USE Northwind_S02_Lab;

SELECT AVG(UnitPrice) AS PrecioPromedio
FROM Products;

SELECT ProductID,
SUM(Quantity) AS UnidadesVendidas
FROM [Order Details]
GROUP BY ProductID

SELECT p.ProductName,
	   p.UnitPrice,
	   od.UnidadesVendidas
FROM Products AS p
JOIN(
	SELECT ProductID,
	SUM(Quantity) AS UnidadesVendidas
	FROM [Order Details]
	GROUP BY ProductID
) AS od
ON od.ProductID = p.ProductID
WHERE
	p.UnitPrice > (
		SELECT AVG(UnitPrice) AS PrecioPromedio
		FROM Products
	)
ORDER BY p.UnitPrice DESC;

-----------------------------------------

SELECT
p.ProductName,
p.UnitPrice
FROM Products AS p
WHERE p.UnitsInStock > 20
AND p.UnitPrice < (
	SELECT AVG(UnitPrice) AS PrecioPromedio
	FROM Products
)
ORDER BY p.UnitPrice DESC;