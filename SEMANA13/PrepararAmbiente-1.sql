USE MASTER;
GO

IF DB_ID('S13_Seguridad_Lab') IS NULL
	CREATE DATABASE S13_Seguridad_Lab;
GO

USE S13_Seguridad_Lab;
GO

-- Preparar el ambiente (BD)

IF OBJECT_ID('dbo.PedidosLab') IS NULL
BEGIN
	CREATE TABLE dbo.PedidosLab
	(PedidoID INT PRIMARY KEY,
	Cliente NVARCHAR(68) NOT NULL,
	Total DECIMAL(10,2) NOT NULL);
	INSERT dbo.PedidosLab
	VALUES (1, 'Luigui', 550);
END

-- Construir datos públicos y sensibles

IF OBJECT_ID('dbo.AuditoriaLab') IS NULL
BEGIN
	CREATE TABLE dbo.AuditoriaLab
	(EventoID INT PRIMARY KEY,
	Descripcion NVARCHAR(100) NOT NULL);
	INSERT dbo.AuditoriaLab
	VALUES(1, 'Inicio de Laboratorio');
END

-- Validar datos/comprobar

SELECT 'Pedidos' AS Objeto, COUNT(*) AS Filas FROM dbo.PedidosLab
UNION ALL
SELECT 'Auditoria', COUNT(*) FROM dbo.AuditoriaLab;