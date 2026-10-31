USE Northwind_S02_Lab;

ALTER PROCEDURE dbo.usp_s09_ContarProducto
	@CategoryID INT,
	@Total INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
		SELECT @Total = COUNT(*)
		FROM dbo.Products
		WHERE CategoryID = @CategoryID
		GROUP BY CategoryID;

END;

DECLARE @Cantidad INT;
EXEC dbo.usp_s09_ContarProducto @CategoryID = 2 , @Total = @Cantidad OUTPUT;
SELECT @Cantidad AS TotalCategoria;