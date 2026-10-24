USE Lideratec_Repaso_S05_S07;

SELECT COUNT_BIG(*) AS TotalImportado,
COUNT(DISTINCT PedidoID) AS IdsDiferentes,
MIN(FechaPedido) AS PrimeraFecha,
MAX(FechaPedido) AS UltimaFecha
FROM dbo.PedidosPractica;

SELECT Pais, COUNT_BIG(*) AS Pedidos,
CAST(SUM(CostoEnvio) AS DECIMAL(18,2)) AS CostoEnvio
FROM dbo.PedidosPractica
GROUP BY Pais
ORDER BY Pedidos DESC;