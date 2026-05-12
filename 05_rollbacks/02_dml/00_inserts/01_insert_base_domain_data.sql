-- Rollback for base seed data. Deletes children before parents.

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

DELETE FROM module_view WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM role_permission WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM user_role WHERE id IN (1);
DELETE FROM app_user WHERE id IN (1);
DELETE FROM app_view WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM module WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM permission WHERE id IN (1, 2, 3, 4, 5);
DELETE FROM app_role WHERE id IN (1, 2, 3);
DELETE FROM person WHERE id IN (1, 2, 3);
