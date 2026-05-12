-- Base seed data ordered by table dependencies.
-- The cleanup block makes this seed safe to re-run after a partial failed execution.

DELETE FROM maintenance_dashboard WHERE id IN (1);
DELETE FROM remodeling_maintenance WHERE id IN (1);
DELETE FROM usage_maintenance WHERE id IN (1);
DELETE FROM room_maintenance WHERE id IN (1, 2);

DELETE FROM customer_loyalty WHERE id IN (1, 2);
DELETE FROM term_condition WHERE id IN (1);
DELETE FROM alert WHERE id IN (1);
DELETE FROM promotion WHERE id IN (1);

DELETE FROM invoice_detail WHERE id IN (1, 2);
DELETE FROM partial_payment WHERE id IN (1, 2);
DELETE FROM invoice WHERE id IN (1);
DELETE FROM proforma_invoice WHERE id IN (1);

DELETE FROM service_sale WHERE id IN (1);
DELETE FROM product_sale WHERE id IN (1);
DELETE FROM check_out WHERE id IN (1);
DELETE FROM check_in WHERE id IN (1);
DELETE FROM stay WHERE id IN (1);
DELETE FROM room_catalog WHERE id IN (1, 2, 3);
DELETE FROM room_availability WHERE id IN (1, 2, 3);
DELETE FROM room_cancellation WHERE id IN (1);
DELETE FROM room_reservation WHERE id IN (1, 2);

DELETE FROM inventory_availability WHERE id IN (1, 2, 3, 4);
DELETE FROM product_movement WHERE id IN (1, 2);
DELETE FROM service WHERE id IN (1, 2);
DELETE FROM product WHERE id IN (1, 2);
DELETE FROM supplier WHERE id IN (1);

DELETE FROM rate WHERE id IN (1, 2, 3, 4);
DELETE FROM room WHERE id IN (1, 2, 3);
DELETE FROM room_status WHERE id IN (1, 2, 3);
DELETE FROM room_type WHERE id IN (1, 2, 3);
DELETE FROM branch WHERE id IN (1);

DELETE FROM employee WHERE id IN (1, 2);
DELETE FROM legal_information WHERE id IN (1);
DELETE FROM payment_method WHERE id IN (1, 2, 3);
DELETE FROM day_type WHERE id IN (1, 2, 3);
DELETE FROM company WHERE id IN (1);
DELETE FROM customer WHERE id IN (1, 2);

DELETE FROM module_view WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8) OR module_id IN (1, 2, 3, 4, 5, 6, 7, 8) OR view_id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM role_permission WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8) OR role_id IN (1, 2, 3) OR permission_id IN (1, 2, 3, 4, 5);
DELETE FROM user_role WHERE id IN (1) OR user_id IN (1) OR role_id IN (1, 2, 3);
DELETE FROM app_user WHERE id IN (1) OR person_id IN (1, 2, 3) OR username IN ('admin');
DELETE FROM app_view WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8) OR module_id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM module WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM permission WHERE id IN (1, 2, 3, 4, 5);
DELETE FROM app_role WHERE id IN (1, 2, 3);
DELETE FROM person WHERE id IN (1, 2, 3);

-- Security domain
INSERT INTO person (id, document_type, document_number, first_name, last_name, phone, email, status) VALUES
  (1, 'CC', '1000000001', 'Admin', 'Sistema', '3000000001', 'admin@sistemahotelero.local', 'ACTIVE'),
  (2, 'CC', '1000000002', 'Laura', 'Martinez', '3000000002', 'laura.martinez@sistemahotelero.local', 'ACTIVE'),
  (3, 'CC', '1000000003', 'Carlos', 'Rojas', '3000000003', 'carlos.rojas@sistemahotelero.local', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO app_role (id, name, description, status) VALUES
  (1, 'ADMIN', 'Administrador general del sistema', 'ACTIVE'),
  (2, 'RECEPCIONISTA', 'Gestiona reservas, check-in y check-out', 'ACTIVE'),
  (3, 'MANTENIMIENTO', 'Gestiona mantenimientos de habitaciones', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO permission (id, name, description, action, status) VALUES
  (1, 'SEGURIDAD', 'Acceso a administracion de seguridad', 'MANAGE', 'ACTIVE'),
  (2, 'RESERVAS', 'Acceso a gestion de reservas', 'MANAGE', 'ACTIVE'),
  (3, 'FACTURACION', 'Acceso a facturacion y pagos', 'MANAGE', 'ACTIVE'),
  (4, 'INVENTARIO', 'Acceso a inventario', 'MANAGE', 'ACTIVE'),
  (5, 'MANTENIMIENTO', 'Acceso a mantenimiento', 'MANAGE', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO module (id, name, description, base_path, status) VALUES
  (1, 'Seguridad', 'Gestion de usuarios, roles y permisos', '/security', 'ACTIVE'),
  (2, 'Parametrizacion', 'Configuracion base del hotel', '/parameterization', 'ACTIVE'),
  (3, 'Distribucion', 'Sucursales, habitaciones y tarifas', '/distribution', 'ACTIVE'),
  (4, 'Inventario', 'Productos, servicios y disponibilidad', '/inventory', 'ACTIVE'),
  (5, 'Operaciones', 'Reservas, estancias y consumos', '/operations', 'ACTIVE'),
  (6, 'Facturacion', 'Facturas, proformas y pagos', '/billing', 'ACTIVE'),
  (7, 'Notificaciones', 'Promociones, alertas y fidelizacion', '/notifications', 'ACTIVE'),
  (8, 'Mantenimiento', 'Mantenimientos y tablero operativo', '/maintenance', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO app_view (id, module_id, name, description, path, status) VALUES
  (1, 1, 'Usuarios', 'Administracion de usuarios', '/users', 'ACTIVE'),
  (2, 2, 'Empresas', 'Administracion de companias y datos legales', '/companies', 'ACTIVE'),
  (3, 3, 'Habitaciones', 'Administracion de habitaciones y tarifas', '/rooms', 'ACTIVE'),
  (4, 4, 'Inventario', 'Administracion de productos y servicios', '/items', 'ACTIVE'),
  (5, 5, 'Reservas', 'Gestion de reservas y estadias', '/reservations', 'ACTIVE'),
  (6, 6, 'Facturas', 'Gestion de facturacion', '/invoices', 'ACTIVE'),
  (7, 7, 'Comunicaciones', 'Gestion de alertas y promociones', '/communications', 'ACTIVE'),
  (8, 8, 'Mantenimiento', 'Gestion de mantenimiento de habitaciones', '/rooms', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO app_user (id, person_id, username, password_hash, is_blocked, status) VALUES
  (1, 1, 'admin', '$2a$10$seed.hash.only.for.local.data', FALSE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO user_role (id, user_id, role_id, status) VALUES
  (1, 1, 1, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO role_permission (id, role_id, permission_id, status) VALUES
  (1, 1, 1, 'ACTIVE'),
  (2, 1, 2, 'ACTIVE'),
  (3, 1, 3, 'ACTIVE'),
  (4, 1, 4, 'ACTIVE'),
  (5, 1, 5, 'ACTIVE'),
  (6, 2, 2, 'ACTIVE'),
  (7, 2, 3, 'ACTIVE'),
  (8, 3, 5, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO module_view (id, module_id, view_id, status) VALUES
  (1, 1, 1, 'ACTIVE'),
  (2, 2, 2, 'ACTIVE'),
  (3, 3, 3, 'ACTIVE'),
  (4, 4, 4, 'ACTIVE'),
  (5, 5, 5, 'ACTIVE'),
  (6, 6, 6, 'ACTIVE'),
  (7, 7, 7, 'ACTIVE'),
  (8, 8, 8, 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Parameterization domain
INSERT INTO customer (id, document_type, document_number, first_name, last_name, phone, email, address, status) VALUES
  (1, 'CC', '2000000001', 'Ana', 'Gomez', '3100000001', 'ana.gomez@example.com', 'Calle 10 #20-30', 'ACTIVE'),
  (2, 'PASSPORT', 'P1234567', 'John', 'Smith', '3100000002', 'john.smith@example.com', 'Carrera 15 #40-12', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO company (id, name, tax_id, legal_name, phone, email, address, website, status) VALUES
  (1, 'Hotel Andino', '900000001-1', 'Hotel Andino S.A.S.', '6010000001', 'contacto@hotelandino.local', 'Av. Principal #1-20', 'https://hotelandino.local', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO day_type (id, name, description, date_value, applies_season, applies_holiday, applies_special, status) VALUES
  (1, 'Regular', 'Dia regular de operacion', NULL, FALSE, FALSE, FALSE, 'ACTIVE'),
  (2, 'Temporada Alta', 'Periodo de alta demanda', NULL, TRUE, FALSE, FALSE, 'ACTIVE'),
  (3, 'Festivo', 'Dia festivo nacional', NULL, FALSE, TRUE, FALSE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO payment_method (id, name, description, requires_reference, allows_partial_payment, status) VALUES
  (1, 'Efectivo', 'Pago en efectivo', FALSE, TRUE, 'ACTIVE'),
  (2, 'Tarjeta de credito', 'Pago con tarjeta de credito', TRUE, TRUE, 'ACTIVE'),
  (3, 'Transferencia', 'Pago por transferencia bancaria', TRUE, TRUE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO legal_information (id, company_id, legal_document_type, legal_document_number, description, issue_date, expiration_date, status) VALUES
  (1, 1, 'RNT', 'RNT-000001', 'Registro Nacional de Turismo', DATE '2026-01-01', DATE '2026-12-31', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO employee (id, person_id, job_title, hire_date, work_phone, work_email, status) VALUES
  (1, 2, 'Recepcionista', DATE '2026-01-15', '3200000001', 'recepcion@hotelandino.local', 'ACTIVE'),
  (2, 3, 'Tecnico de mantenimiento', DATE '2026-02-01', '3200000002', 'mantenimiento@hotelandino.local', 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Distribution domain
INSERT INTO branch (id, company_id, name, address, city, phone, email, status) VALUES
  (1, 1, 'Sede Centro', 'Av. Principal #1-20', 'Bogota', '6010000001', 'centro@hotelandino.local', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO room_type (id, name, description, base_capacity, max_capacity, status) VALUES
  (1, 'Sencilla', 'Habitacion para una persona', 1, 1, 'ACTIVE'),
  (2, 'Doble', 'Habitacion para dos personas', 2, 3, 'ACTIVE'),
  (3, 'Suite', 'Habitacion suite con mayor comodidad', 2, 4, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO room_status (id, name, description, allows_reservation, allows_check_in, status) VALUES
  (1, 'Disponible', 'Habitacion disponible para reserva', TRUE, TRUE, 'ACTIVE'),
  (2, 'Ocupada', 'Habitacion ocupada', FALSE, FALSE, 'ACTIVE'),
  (3, 'Mantenimiento', 'Habitacion en mantenimiento', FALSE, FALSE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO room (id, branch_id, room_type_id, room_status_id, room_number, floor_number, capacity, description, status) VALUES
  (1, 1, 1, 1, '101', 1, 1, 'Habitacion sencilla primer piso', 'ACTIVE'),
  (2, 1, 2, 1, '201', 2, 2, 'Habitacion doble segundo piso', 'ACTIVE'),
  (3, 1, 3, 3, '301', 3, 4, 'Suite en mantenimiento preventivo', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO rate (id, room_type_id, day_type_id, amount, start_date, end_date, condition_note, status) VALUES
  (1, 1, 1, 120000.00, DATE '2026-01-01', NULL, 'Tarifa regular sencilla', 'ACTIVE'),
  (2, 2, 1, 180000.00, DATE '2026-01-01', NULL, 'Tarifa regular doble', 'ACTIVE'),
  (3, 3, 1, 320000.00, DATE '2026-01-01', NULL, 'Tarifa regular suite', 'ACTIVE'),
  (4, 2, 2, 240000.00, DATE '2026-06-01', DATE '2026-08-31', 'Temporada alta', 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Inventory domain
INSERT INTO supplier (id, name, tax_id, phone, email, address, status) VALUES
  (1, 'Proveedor Hotelero Central', '901000001-1', '6011000001', 'ventas@proveedorcentral.local', 'Zona industrial #10-25', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO product (id, supplier_id, name, description, sale_price, current_stock, minimum_stock, status) VALUES
  (1, 1, 'Agua mineral', 'Botella de agua 600 ml', 5000.00, 80, 20, 'ACTIVE'),
  (2, 1, 'Snack mixto', 'Snack de minibar', 8000.00, 50, 15, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO service (id, name, description, sale_price, is_available, status) VALUES
  (1, 'Lavanderia', 'Servicio de lavanderia por prenda', 15000.00, TRUE, 'ACTIVE'),
  (2, 'Transporte aeropuerto', 'Traslado desde o hacia aeropuerto', 70000.00, TRUE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO product_movement (id, product_id, movement_type, quantity, moved_at, note, status) VALUES
  (1, 1, 'ENTRADA', 80, TIMESTAMP '2026-05-01 08:00:00', 'Inventario inicial', 'ACTIVE'),
  (2, 2, 'ENTRADA', 50, TIMESTAMP '2026-05-01 08:15:00', 'Inventario inicial', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO inventory_availability (id, product_id, service_id, available_quantity, is_available, note, status) VALUES
  (1, 1, NULL, 80, TRUE, 'Disponible para minibar', 'ACTIVE'),
  (2, 2, NULL, 50, TRUE, 'Disponible para minibar', 'ACTIVE'),
  (3, NULL, 1, 0, TRUE, 'Servicio disponible bajo solicitud', 'ACTIVE'),
  (4, NULL, 2, 0, TRUE, 'Servicio disponible bajo reserva', 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Service delivery domain
INSERT INTO room_reservation (id, customer_id, room_id, start_at, end_at, guest_count, reservation_status, estimated_amount, status) VALUES
  (1, 1, 2, TIMESTAMP '2026-05-15 15:00:00', TIMESTAMP '2026-05-17 12:00:00', 2, 'CONFIRMED', 360000.00, 'ACTIVE'),
  (2, 2, 1, TIMESTAMP '2026-05-20 15:00:00', TIMESTAMP '2026-05-21 12:00:00', 1, 'PENDING', 120000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO room_cancellation (id, room_reservation_id, reason, cancelled_at, applies_penalty, penalty_amount, status) VALUES
  (1, 2, 'Cambio de itinerario del cliente', TIMESTAMP '2026-05-12 10:00:00', FALSE, 0.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO room_availability (id, room_id, start_at, end_at, is_available, unavailable_reason, status) VALUES
  (1, 1, TIMESTAMP '2026-05-15 15:00:00', TIMESTAMP '2026-05-17 12:00:00', TRUE, NULL, 'ACTIVE'),
  (2, 2, TIMESTAMP '2026-05-15 15:00:00', TIMESTAMP '2026-05-17 12:00:00', FALSE, 'Reserva confirmada', 'ACTIVE'),
  (3, 3, TIMESTAMP '2026-05-12 08:00:00', TIMESTAMP '2026-05-14 18:00:00', FALSE, 'Mantenimiento preventivo', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO room_catalog (id, room_id, title, description, base_price, is_visible, status) VALUES
  (1, 1, 'Habitacion sencilla 101', 'Habitacion sencilla con servicios basicos', 120000.00, TRUE, 'ACTIVE'),
  (2, 2, 'Habitacion doble 201', 'Habitacion doble para estadias cortas', 180000.00, TRUE, 'ACTIVE'),
  (3, 3, 'Suite 301', 'Suite amplia con sala auxiliar', 320000.00, FALSE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO stay (id, room_reservation_id, customer_id, room_id, start_at, end_at, stay_status, status) VALUES
  (1, 1, 1, 2, TIMESTAMP '2026-05-15 15:10:00', NULL, 'ACTIVE', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO check_in (id, room_reservation_id, employee_id, checked_in_at, note, status) VALUES
  (1, 1, 1, TIMESTAMP '2026-05-15 15:10:00', 'Ingreso realizado sin novedades', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO check_out (id, stay_id, employee_id, checked_out_at, note, total_amount, status) VALUES
  (1, 1, 1, TIMESTAMP '2026-05-17 11:45:00', 'Salida programada', 383000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO product_sale (id, stay_id, product_id, quantity, unit_price, total_amount, status) VALUES
  (1, 1, 1, 2, 5000.00, 10000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO service_sale (id, stay_id, service_id, quantity, unit_price, total_amount, status) VALUES
  (1, 1, 1, 1, 15000.00, 15000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Billing domain
INSERT INTO proforma_invoice (id, stay_id, room_reservation_id, customer_id, subtotal, tax_amount, discount_amount, total_amount, status) VALUES
  (1, 1, 1, 1, 385000.00, 0.00, 2000.00, 383000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO invoice (id, customer_id, stay_id, invoice_number, issued_at, subtotal, tax_amount, discount_amount, total_amount, invoice_status, status) VALUES
  (1, 1, 1, 'FAC-2026-000001', TIMESTAMP '2026-05-17 11:50:00', 385000.00, 0.00, 2000.00, 383000.00, 'ISSUED', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO partial_payment (id, room_reservation_id, invoice_id, payment_method_id, amount, paid_at, payment_reference, status) VALUES
  (1, 1, NULL, 3, 100000.00, TIMESTAMP '2026-05-12 09:00:00', 'TRX-RES-000001', 'ACTIVE'),
  (2, NULL, 1, 2, 283000.00, TIMESTAMP '2026-05-17 11:55:00', 'CARD-INV-000001', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO invoice_detail (id, invoice_id, product_id, service_id, description, quantity, unit_price, total_amount, status) VALUES
  (1, 1, NULL, 1, 'Lavanderia', 1, 15000.00, 15000.00, 'ACTIVE'),
  (2, 1, 1, NULL, 'Agua mineral', 2, 5000.00, 10000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Notification domain
INSERT INTO promotion (id, title, description, start_at, end_at, channel, is_active, status) VALUES
  (1, 'Bienvenida 2026', 'Promocion de bienvenida para nuevos huespedes', TIMESTAMP '2026-05-01 00:00:00', TIMESTAMP '2026-06-30 23:59:59', 'EMAIL', TRUE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO alert (id, customer_id, room_reservation_id, title, message, channel, sent_at, status) VALUES
  (1, 1, 1, 'Reserva confirmada', 'Su reserva fue confirmada correctamente.', 'EMAIL', TIMESTAMP '2026-05-12 09:05:00', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO term_condition (id, title, content, version, effective_date, is_required, status) VALUES
  (1, 'Terminos generales de hospedaje', 'Condiciones generales para reservas, estadias y pagos.', '2026.1', DATE '2026-01-01', TRUE, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO customer_loyalty (id, customer_id, level, points, last_interaction_at, note, status) VALUES
  (1, 1, 'BASIC', 120, TIMESTAMP '2026-05-17 11:55:00', 'Puntos iniciales por estancia', 'ACTIVE'),
  (2, 2, 'BASIC', 0, TIMESTAMP '2026-05-12 10:00:00', 'Cliente registrado', 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Maintenance domain
INSERT INTO room_maintenance (id, room_id, employee_id, maintenance_type, start_at, end_at, maintenance_status, note, status) VALUES
  (1, 3, 2, 'PREVENTIVO', TIMESTAMP '2026-05-12 08:00:00', TIMESTAMP '2026-05-14 18:00:00', 'IN_PROGRESS', 'Revision general de suite', 'ACTIVE'),
  (2, 1, 2, 'REMODELACION', TIMESTAMP '2026-06-01 08:00:00', NULL, 'PENDING', 'Adecuacion de mobiliario', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO usage_maintenance (id, room_maintenance_id, usage_reason, activity_detail, status) VALUES
  (1, 1, 'Mantenimiento preventivo programado', 'Revision de aire acondicionado, iluminacion y plomeria.', 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO remodeling_maintenance (id, room_maintenance_id, remodeling_description, estimated_budget, status) VALUES
  (1, 2, 'Cambio de mobiliario y pintura interior.', 1200000.00, 'ACTIVE')
ON CONFLICT DO NOTHING;

INSERT INTO maintenance_dashboard (id, branch_id, total_rooms, available_rooms, occupied_rooms, maintenance_rooms, cutoff_at, status) VALUES
  (1, 1, 3, 1, 1, 1, TIMESTAMP '2026-05-12 12:00:00', 'ACTIVE')
ON CONFLICT DO NOTHING;

-- Keep BIGSERIAL sequences aligned with the explicit seed ids.
SELECT setval(pg_get_serial_sequence('person', 'id'), COALESCE((SELECT MAX(id) FROM person), 1), TRUE);
SELECT setval(pg_get_serial_sequence('app_role', 'id'), COALESCE((SELECT MAX(id) FROM app_role), 1), TRUE);
SELECT setval(pg_get_serial_sequence('permission', 'id'), COALESCE((SELECT MAX(id) FROM permission), 1), TRUE);
SELECT setval(pg_get_serial_sequence('module', 'id'), COALESCE((SELECT MAX(id) FROM module), 1), TRUE);
SELECT setval(pg_get_serial_sequence('app_view', 'id'), COALESCE((SELECT MAX(id) FROM app_view), 1), TRUE);
SELECT setval(pg_get_serial_sequence('app_user', 'id'), COALESCE((SELECT MAX(id) FROM app_user), 1), TRUE);
SELECT setval(pg_get_serial_sequence('user_role', 'id'), COALESCE((SELECT MAX(id) FROM user_role), 1), TRUE);
SELECT setval(pg_get_serial_sequence('role_permission', 'id'), COALESCE((SELECT MAX(id) FROM role_permission), 1), TRUE);
SELECT setval(pg_get_serial_sequence('module_view', 'id'), COALESCE((SELECT MAX(id) FROM module_view), 1), TRUE);
SELECT setval(pg_get_serial_sequence('customer', 'id'), COALESCE((SELECT MAX(id) FROM customer), 1), TRUE);
SELECT setval(pg_get_serial_sequence('company', 'id'), COALESCE((SELECT MAX(id) FROM company), 1), TRUE);
SELECT setval(pg_get_serial_sequence('day_type', 'id'), COALESCE((SELECT MAX(id) FROM day_type), 1), TRUE);
SELECT setval(pg_get_serial_sequence('payment_method', 'id'), COALESCE((SELECT MAX(id) FROM payment_method), 1), TRUE);
SELECT setval(pg_get_serial_sequence('legal_information', 'id'), COALESCE((SELECT MAX(id) FROM legal_information), 1), TRUE);
SELECT setval(pg_get_serial_sequence('employee', 'id'), COALESCE((SELECT MAX(id) FROM employee), 1), TRUE);
SELECT setval(pg_get_serial_sequence('branch', 'id'), COALESCE((SELECT MAX(id) FROM branch), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_type', 'id'), COALESCE((SELECT MAX(id) FROM room_type), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_status', 'id'), COALESCE((SELECT MAX(id) FROM room_status), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room', 'id'), COALESCE((SELECT MAX(id) FROM room), 1), TRUE);
SELECT setval(pg_get_serial_sequence('rate', 'id'), COALESCE((SELECT MAX(id) FROM rate), 1), TRUE);
SELECT setval(pg_get_serial_sequence('supplier', 'id'), COALESCE((SELECT MAX(id) FROM supplier), 1), TRUE);
SELECT setval(pg_get_serial_sequence('product', 'id'), COALESCE((SELECT MAX(id) FROM product), 1), TRUE);
SELECT setval(pg_get_serial_sequence('service', 'id'), COALESCE((SELECT MAX(id) FROM service), 1), TRUE);
SELECT setval(pg_get_serial_sequence('product_movement', 'id'), COALESCE((SELECT MAX(id) FROM product_movement), 1), TRUE);
SELECT setval(pg_get_serial_sequence('inventory_availability', 'id'), COALESCE((SELECT MAX(id) FROM inventory_availability), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_reservation', 'id'), COALESCE((SELECT MAX(id) FROM room_reservation), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_cancellation', 'id'), COALESCE((SELECT MAX(id) FROM room_cancellation), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_availability', 'id'), COALESCE((SELECT MAX(id) FROM room_availability), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_catalog', 'id'), COALESCE((SELECT MAX(id) FROM room_catalog), 1), TRUE);
SELECT setval(pg_get_serial_sequence('stay', 'id'), COALESCE((SELECT MAX(id) FROM stay), 1), TRUE);
SELECT setval(pg_get_serial_sequence('check_in', 'id'), COALESCE((SELECT MAX(id) FROM check_in), 1), TRUE);
SELECT setval(pg_get_serial_sequence('check_out', 'id'), COALESCE((SELECT MAX(id) FROM check_out), 1), TRUE);
SELECT setval(pg_get_serial_sequence('product_sale', 'id'), COALESCE((SELECT MAX(id) FROM product_sale), 1), TRUE);
SELECT setval(pg_get_serial_sequence('service_sale', 'id'), COALESCE((SELECT MAX(id) FROM service_sale), 1), TRUE);
SELECT setval(pg_get_serial_sequence('proforma_invoice', 'id'), COALESCE((SELECT MAX(id) FROM proforma_invoice), 1), TRUE);
SELECT setval(pg_get_serial_sequence('invoice', 'id'), COALESCE((SELECT MAX(id) FROM invoice), 1), TRUE);
SELECT setval(pg_get_serial_sequence('partial_payment', 'id'), COALESCE((SELECT MAX(id) FROM partial_payment), 1), TRUE);
SELECT setval(pg_get_serial_sequence('invoice_detail', 'id'), COALESCE((SELECT MAX(id) FROM invoice_detail), 1), TRUE);
SELECT setval(pg_get_serial_sequence('promotion', 'id'), COALESCE((SELECT MAX(id) FROM promotion), 1), TRUE);
SELECT setval(pg_get_serial_sequence('alert', 'id'), COALESCE((SELECT MAX(id) FROM alert), 1), TRUE);
SELECT setval(pg_get_serial_sequence('term_condition', 'id'), COALESCE((SELECT MAX(id) FROM term_condition), 1), TRUE);
SELECT setval(pg_get_serial_sequence('customer_loyalty', 'id'), COALESCE((SELECT MAX(id) FROM customer_loyalty), 1), TRUE);
SELECT setval(pg_get_serial_sequence('room_maintenance', 'id'), COALESCE((SELECT MAX(id) FROM room_maintenance), 1), TRUE);
SELECT setval(pg_get_serial_sequence('usage_maintenance', 'id'), COALESCE((SELECT MAX(id) FROM usage_maintenance), 1), TRUE);
SELECT setval(pg_get_serial_sequence('remodeling_maintenance', 'id'), COALESCE((SELECT MAX(id) FROM remodeling_maintenance), 1), TRUE);
SELECT setval(pg_get_serial_sequence('maintenance_dashboard', 'id'), COALESCE((SELECT MAX(id) FROM maintenance_dashboard), 1), TRUE);
