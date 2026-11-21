USE Northwind_S02_Lab;
GO

SELECT TOP(8) ProductID, ProductName, CategoryID, UnitPrice
FROM dbo.Products
ORDER BY ProductID;

CREATE OR ALTER FUNCTION dbo.fn_s12_ProductosCategoria(@CategoriaID INT)
RETURNS TABLE
AS
RETURN(
	SELECT TOP(8) ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock
	FROM dbo.Products
	WHERE CategoryID = @CategoriaID
)
GO

SELECT ProductID, ProductName, UnitPrice
FROM dbo.fn_s12_ProductosCategoria(1)
ORDER BY ProductName;

SELECT COUNT(*) AS cantidadCategoria
FROM dbo.fn_s12_ProductosCategoria(2);

