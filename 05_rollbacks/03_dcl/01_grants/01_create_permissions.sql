-- ============================================
-- QUITAR CONEXIÓN A LA BASE DE DATOS
-- ============================================
REVOKE CONNECT ON DATABASE sistema_hotelero FROM ariel5253;

-- ============================================
-- QUITAR USO Y CREACIÓN EN SCHEMA
-- ============================================
REVOKE USAGE, CREATE ON SCHEMA public FROM ariel5253;

-- ============================================
-- QUITAR PERMISOS SOBRE TABLAS (DML + DDL)
-- ============================================
REVOKE ALL PRIVILEGES
ON ALL TABLES IN SCHEMA public
FROM ariel5253;

-- ============================================
-- QUITAR PERMISOS SOBRE SECUENCIAS
-- ============================================
REVOKE USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
FROM ariel5253;

-- ============================================
-- QUITAR DEFAULT PRIVILEGES (FUTUROS OBJETOS)
-- ============================================
ALTER DEFAULT PRIVILEGES IN SCHEMA public
REVOKE SELECT, INSERT, UPDATE, DELETE
ON TABLES FROM ariel5253;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
REVOKE USAGE, SELECT
ON SEQUENCES FROM ariel5253;