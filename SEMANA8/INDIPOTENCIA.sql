USE Lideratec_Repaso_S05_S07;

IF NOT EXISTS(SELECT 1 FROM dbo.PedidosPractica WHERE PedidoID=9000009)
BEGIN
	INSERT INTO dbo.PedidosPractica
	(PedidoID, CLienteID, FechaPedido, CostoEnvio, Empresa, Pais)
	VALUES
	(9000009, 'PRD01', '20261001', 20, 'Empresa de prueba', 'Canadá');


END;

UPDATE dbo.PedidosPractica
SET CostoEnvio = 30
WHERE PedidoID = 9000009
AND CostoEnvio < 30;

SELECT @@ROWCOUNT AS FilasAfectadas;

SELECT * FROM dbo.PedidosPractica;