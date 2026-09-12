USE Northwind_S02_Lab;

SELECT
AVG(UnitPrice) as PrecioPromedio,
MAX(UnitPrice) as PrecioMayor,
MIN(UnitPrice) as PrecioMenor,
SUM(UnitsInStock) as StockTotal,
COUNT(*) as NumeroProductos

FROM dbo.Products
WHERE CategoryID = 2

SELECT
AVG(UnitPrice) as PrecioPromedio,
MIN(UnitPrice) as PrecioMinimo,
COUNT(UnitPrice) as CantidadTotal
FROM dbo.Products
WHERE CategoryID = 4