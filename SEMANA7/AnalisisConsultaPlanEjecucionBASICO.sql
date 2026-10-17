USE Lab_ISIL_S07_Planes;

SELECT p.PedidoID, p.FechaPedido
FROM dbo.Pedidos AS p
WHERE p.PedidoID BETWEEN 1 AND 200
ORDER BY p.FechaPedido ASC, p.PedidoID ASC;

SELECT p.PedidoID, p.FechaPedido, p.Total
FROM dbo.Pedidos AS p
WHERE p.PedidoID BETWEEN 300 AND 360
ORDER BY p.PedidoID DESC;