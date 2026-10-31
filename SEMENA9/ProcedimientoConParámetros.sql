USE Northwind_S02_Lab;

CREATE PROCEDURE dbo.usp_s09_ProductosPorCategoriaPrecio
	@CategoryID INT,
	@UnitPrice DECIMAL(10,2) = 0
AS
BEGIN
	SET NOCOUNT ON;
		IF(@CategoryID <=0 OR @UnitPrice < 0)
		BEGIN
			PRINT 'Parámetros inválidos';
			RETURN 20;
		END;

		SELECT p.ProductID, p.ProductName, p.UnitPrice
		FROM dbo.Products AS p
		WHERE p.CategoryID = @CategoryID AND p.UnitPrice >= @UnitPrice
		ORDER BY p.UnitPrice DESC, p.ProductID;
END;

DECLARE @ESTADOS INT;
EXEC @ESTADOS = dbo.usp_s09_ProductosPorCategoriaPrecio @CategoryID = 2 , @UnitPrice = 25;