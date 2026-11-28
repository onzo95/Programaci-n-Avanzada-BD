-- Crear un rol lector con privilegios mínimos

-- 1. Declarar rol y membresía

IF DATABASE_PRINCIPAL_ID('rol_lectura_pedidos') IS NULL
	CREATE ROLE rol_lectura_pedidos;

IF IS_ROLEMEMBER('rol_lectura_pedidos','Lector_S13') = 0
	ALTER ROLE rol_lectura_pedidos ADD MEMBER Lector_S13;

-- 2. Conceder acceso al objeto

GRANT SELECT ON OBJECT:: dbo.PedidosLab TO rol_lectura_pedidos

-- 3. Verificar la pertenencia y el permiso registrado

SELECT r.name AS Rol, m.name AS Miembro
FROM sys.database_role_members rm
JOIN sys.database_principals r ON r.principal_id = rm.role_principal_id
JOIN sys.database_principals m ON m.principal_id = rm.member_principal_id
WHERE r.name = 'rol_lectura_pedidos';