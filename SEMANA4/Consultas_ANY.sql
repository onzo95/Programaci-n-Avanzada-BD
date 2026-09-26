USE Northwind_S02_Lab;

--- Comparar el precio de cada producto con varios precios
---	pertenecientes al proveedor SupperID=2
--- El objetivo es comprender ANY y comprobar que SOME expresa misma condición

SELECT
ProductName,
UnitPrice
FROM Products
WHERE SupplierID = 2
ORDER BY UnitPrice;

SELECT ProductID,
ProductName,
UnitPrice,
SupplierID
FROM Products
WHERE UnitPrice > ANY(
	SELECT
	UnitPrice
	FROM Products
	WHERE SupplierID = 2
)
AND SupplierID<>2;