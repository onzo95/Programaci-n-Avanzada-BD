USE Northwind_S02_Lab;



CREATE PROCEDURE dbo.usp_s09_ConsultaStockEstado
	@ProductID INT,
	@Stock INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SET @Stock = NULL;
		IF(@ProductID <= 0)
			RETURN 20;
		IF NOT EXISTS (SELECT 1 AS Encontrados FROM dbo.Products WHERE ProductID = @ProductID)
			RETURN 10;
	
	SELECT @Stock = CONVERT(INT, COALESCE(UnitsInStock,0))
	FROM dbo.Products
	ORDER BY ProductID;
	RETURN 0;

END;

DECLARE @Id INT = (SELECT MIN(ProductID) FROM dbo.Products);
DECLARE @Estado INT, @Stock INT;
EXEC @Estado = dbo.usp_s09_ConsultaStockEstado @ProductID = @Id , @Stock = @Stock OUTPUT;
SELECT @Id as IdBuscado, @Estado as codigo, @Stock as StrockEncontrado

