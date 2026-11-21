USE Northwind_S02_Lab;
GO

SELECT TOP(5) p.ProductID, p.ProductName, p.SupplierID, s.CompanyName
FROM dbo.Products AS p INNER JOIN
dbo.Suppliers AS s
ON s.SupplierID = p.SupplierID
ORDER BY p.ProductID;

CREATE OR ALTER FUNCTION dbo.fn_s12_FichaProductosCategoria(@CategoriaID INT)
RETURNS @Ficha TABLE(
	
	ProductID INT, ProductName VARCHAR(50),
	Supplier NVARCHAR(50), UnitInStock INT
)
AS
BEGIN
	INSERT INTO @Ficha(ProductID, ProductName, Supplier, UnitInStock)
	SELECT p.ProductID, p.ProductName, s.CompanyName, p.UnitsInStock
	FROM dbo.Products AS p INNER JOIN
	dbo.Suppliers AS s
	ON s.SupplierID = p.SupplierID
	WHERE p.CategoryID = @CategoriaID;
	RETURN;
END;
GO

SELECT * FROM dbo.fn_s12_FichaProductosCategoria(2) ORDER BY ProductID;

SELECT COUNT(*) AS Filas, COUNT(DISTINCT ProductID) AS ProductosUnicos
FROM dbo.fn_s12_FichaProductosCategoria(2);
