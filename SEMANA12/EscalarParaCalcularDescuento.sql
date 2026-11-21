USE Northwind_S02_Lab;
GO

SELECT TOP(5) ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice IS NOT NULL
ORDER BY ProductID;

CREATE OR ALTER FUNCTION dbo.fn_s12_PrecioDescuento(
	@Precio DECIMAL(10,2), @Descuento DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
	IF(@Precio IS NULL OR @Descuento IS NULL OR @Precio < 0 OR @Descuento < 0 OR @Descuento > 100)
		RETURN NULL;

	RETURN ROUND(@Precio * (1 - @Descuento/100.0),2);
END;

SELECT dbo.fn_s12_PrecioDescuento(100.00,15.00) AS conDescuento;
SELECT dbo.fn_s12_PrecioDescuento(100.00,0.00) AS sinDescuento;
SELECT dbo.fn_s12_PrecioDescuento(100.00,110.00) AS descuentoInvalido;