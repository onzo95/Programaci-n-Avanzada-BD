USE Northwind_S02_Lab;

DECLARE @categoria NVARCHAR(15) = 'Beverages';

SELECT
p.ProductName,
c.CategoryName
FROM Products AS p
LEFT JOIN Categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = @categoria
OR (c.CategoryName IS NULL AND @categoria IS NULL)