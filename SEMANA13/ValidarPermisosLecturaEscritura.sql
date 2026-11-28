-- Demostraremos autorización positiva y negativa

-- 1. Comprobar la lectura permitida

EXECUTE AS USER = 'Lector_S13';
SELECT USER_NAME() AS UsuarioSimulado;
SELECT PedidoID, Cliente, Total
FROM dbo.PedidosLab;
REVERT;

-- Comprobar modificación denegada sin alterar datos

EXECUTE AS USER = 'Lector_S13';
SELECT 
HAS_PERMS_BY_NAME('dbo.PedidosLab','OBJECT','SELECT') AS PuedeLeer,
HAS_PERMS_BY_NAME('dbo.PedidosLab','OBJECT','INSERT') AS PuedeInsertar;
REVERT;