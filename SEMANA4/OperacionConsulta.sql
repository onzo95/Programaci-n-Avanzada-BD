USE Northwind_S02_Lab;

--- Mostrar clientes cuyo Columna city sea igual obtenidad para ALFKI

SELECT City
FROM Customers
WHERE CustomerID = 'ALFKI';

SELECT
CustomerID,
CompanyName,
City
FROM Customers
WHERE City = (
SELECT City
FROM Customers
WHERE CustomerID = 'ALFKI'
)
ORDER BY CompanyName