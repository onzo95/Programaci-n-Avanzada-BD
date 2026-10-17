USE Lab_ISIL_S07_Planes;

CREATE NONCLUSTERED INDEX IX_Pedidos_FechaPedido
ON dbo.Pedidos(FechaPedido)
INCLUDE (Estado);

SELECT p.PedidoID, p.FechaPedido, p.Estado
FROM Pedidos AS p