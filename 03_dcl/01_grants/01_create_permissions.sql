-- ============================================
-- CONEXIÓN A LA BASE DE DATOS
-- ============================================
GRANT CONNECT ON DATABASE sistema_hotelero TO ariel5253;

-- ============================================
-- USO DEL SCHEMA
-- ============================================
GRANT USAGE ON SCHEMA public TO ariel5253;
GRANT CREATE ON SCHEMA public TO ariel5253;

-- ============================================
-- DML (DATOS)
-- ============================================
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO ariel5253;

-- ============================================
-- DDL (OBJETOS ACTUALES DEL SCHEMA)
-- ============================================
GRANT ALL PRIVILEGES
ON ALL TABLES IN SCHEMA public
TO ariel5253;

-- ============================================
-- SECUENCIAS
-- ============================================
GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO ariel5253;

-- ============================================
-- OBJETOS FUTUROS (IMPORTANTE)
-- ============================================
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLES TO ariel5253;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT
ON SEQUENCES TO ariel5253;