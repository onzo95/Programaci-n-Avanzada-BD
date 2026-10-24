USE Lideratec_Repaso_S05_S07;

IF NOT EXISTS (SELECT 1 FROM dbo.PedidosPractica WHERE PedidoID = 9000003)
INSERT INTO dbo.PedidosPractica
(PedidoID, ClienteID, FechaPedido, CostoEnvio, Empresa, Pais)
VALUES
(9000008, 'PRB01','20261001', 20, 'Empresa de prueba','Perú');

UPDATE dbo.PedidosPractica
SET CostoEnvio=30
WHERE PedidoID=9000003;
SELECT @@ROWCOUNT AS FilasActualizadas;

DELETE FROM dbo.PedidosPractica
WHERE PedidoID = 9000003;
SELECT @@ROWCOUNT AS FilasEliminada;

SELECT * FROM dbo.PedidosPractica;

-----
IF NOT EXISTS (SELECT 1 FROM dbo.PedidosPractica WHERE PedidoID = 9000008)
INSERT INTO dbo.PedidosPractica
(PedidoID, ClienteID, FechaPedido, CostoEnvio, Empresa, Pais)
VALUES
(9000008, 'PRB01','20261001', 20, 'Empresa de prueba','Perú');

UPDATE dbo.PedidosPractica
SET CostoEnvio=30
WHERE PedidoID=9000008;
SELECT @@ROWCOUNT AS FilasActualizadas;

DELETE FROM dbo.PedidosPractica
WHERE PedidoID = 9000008;
SELECT @@ROWCOUNT AS FilasEliminada;

SELECT * FROM dbo.PedidosPractica;