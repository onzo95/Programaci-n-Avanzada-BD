USE Northwind_S02_Lab;

CREATE PROCEDURE dbo.usp_s09_catalogo
AS
BEGIN
	SET NOCOUNT ON;
		SELECT TOP (18) p.ProductID, p.ProductName,
			c.CategoryName, p.UnitPrice, p.UnitsInStock
		FROM dbo.Products AS p
		INNER JOIN dbo.Categories AS c ON c.CategoryID = p.CategoryID
		ORDER BY p.ProductID;
END;

EXEC dbo.usp_s09_catalogo;