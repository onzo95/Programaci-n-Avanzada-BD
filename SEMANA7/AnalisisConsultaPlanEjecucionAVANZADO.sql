USE Lab_ISIL_S07_Planes;

SELECT p.PedidoID, c.Nombre, p.Estado
FROM dbo.Pedidos AS p
INNER JOIN dbo.Clientes AS c
ON c.ClienteID = p.ClienteID
WHERE p.PedidoID BETWEEN 1 AND 20;

SELECT c.Ciudad, COUNT_BIG(*) AS CantidadPedidos
FROM dbo.Pedidos AS p
INNER JOIN dbo.Clientes AS c
ON c.ClienteID = p.ClienteID
GROUP BY c.Ciudad;

SELECT p.Estado, COUNT_BIG(*) AS Cantidad
FROM dbo.Pedidos AS p
GROUP BY p.Estado;

SELECT p.Estado, COUNT_BIG(*) AS Cantidad,
CAST(AVG(p.Total) AS DECIMAL(12,2)) AS Promedio
FROM dbo.Pedidos AS p
GROUP BY p.Estado
HAVING COUNT_BIG(*) > 1000
ORDER BY Cantidad DESC, p.Estado ASC;
