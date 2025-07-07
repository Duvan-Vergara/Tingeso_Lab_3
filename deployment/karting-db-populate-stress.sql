-- ============================================================================================================
-- POBLACIÓN DE BD PARA PRUEBAS DE RENDIMIENTO - ESCENARIO: Stress
-- ============================================================================================================
-- Generado automáticamente: 2025-07-06 23:12:20
-- Reservas: 2000
-- Semanas históricas: 24
-- ============================================================================================================

USE karting_db;

-- Limpiar datos anteriores si es necesario
DELETE FROM reserves WHERE id > 0;
DELETE FROM frequent_customer WHERE id > 0;
DELETE FROM people_discount WHERE id > 0;

-- ============================================================================================================
-- DATOS PARA RF5: REGISTRO DE RESERVAS
-- ============================================================================================================

-- Insertar reservas con diferentes estados y fechas
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1, 'Cliente1', 'cliente1@test.com', '10000001-4', '2025-04-21', '16:40:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2, 'Cliente2', 'cliente2@test.com', '10000002-5', '2025-02-10', '18:34:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (3, 'Cliente3', 'cliente3@test.com', '10000003-6', '2025-02-21', '12:23:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (4, 'Cliente4', 'cliente4@test.com', '10000004-0', '2025-02-27', '16:26:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (5, 'Cliente5', 'cliente5@test.com', '10000005-2', '2025-06-23', '17:55:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (6, 'Cliente6', 'cliente6@test.com', '10000006-4', '2025-04-25', '12:34:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (7, 'Cliente7', 'cliente7@test.com', '10000007-0', '2025-06-20', '09:44:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (8, 'Cliente8', 'cliente8@test.com', '10000008-2', '2025-05-12', '13:20:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (9, 'Cliente9', 'cliente9@test.com', '10000009-0', '2025-05-30', '11:50:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (10, 'Cliente10', 'cliente10@test.com', '10000010-2', '2025-07-03', '11:51:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (11, 'Cliente11', 'cliente11@test.com', '10000011-5', '2025-07-03', '19:17:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (12, 'Cliente12', 'cliente12@test.com', '10000012-4', '2025-04-06', '17:28:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (13, 'Cliente13', 'cliente13@test.com', '10000013-8', '2025-04-17', '11:57:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (14, 'Cliente14', 'cliente14@test.com', '10000014-6', '2025-05-12', '08:16:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (15, 'Cliente15', 'cliente15@test.com', '10000015-4', '2025-02-16', '09:14:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (16, 'Cliente16', 'cliente16@test.com', '10000016-1', '2025-03-17', '12:24:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (17, 'Cliente17', 'cliente17@test.com', '10000017-0', '2025-05-30', '19:13:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (18, 'Cliente18', 'cliente18@test.com', '10000018-3', '2025-04-21', '18:32:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (19, 'Cliente19', 'cliente19@test.com', '10000019-4', '2025-01-24', '16:10:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (20, 'Cliente20', 'cliente20@test.com', '10000020-2', '2025-03-01', '12:11:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (21, 'Cliente21', 'cliente21@test.com', '10000021-7', '2025-05-24', '14:14:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (22, 'Cliente22', 'cliente22@test.com', '10000022-8', '2025-04-06', '14:28:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (23, 'Cliente23', 'cliente23@test.com', '10000023-5', '2025-03-14', '14:45:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (24, 'Cliente24', 'cliente24@test.com', '10000024-5', '2025-03-21', '15:03:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (25, 'Cliente25', 'cliente25@test.com', '10000025-0', '2025-02-18', '15:57:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (26, 'Cliente26', 'cliente26@test.com', '10000026-7', '2025-06-30', '13:20:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (27, 'Cliente27', 'cliente27@test.com', '10000027-7', '2025-02-22', '19:57:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (28, 'Cliente28', 'cliente28@test.com', '10000028-0', '2025-02-22', '15:13:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (29, 'Cliente29', 'cliente29@test.com', '10000029-7', '2025-02-28', '09:55:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (30, 'Cliente30', 'cliente30@test.com', '10000030-2', '2025-01-27', '09:27:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (31, 'Cliente31', 'cliente31@test.com', '10000031-1', '2025-04-15', '08:09:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (32, 'Cliente32', 'cliente32@test.com', '10000032-3', '2025-04-08', '08:31:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (33, 'Cliente33', 'cliente33@test.com', '10000033-6', '2025-05-27', '08:26:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (34, 'Cliente34', 'cliente34@test.com', '10000034-5', '2025-03-16', '14:17:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (35, 'Cliente35', 'cliente35@test.com', '10000035-2', '2025-06-06', '11:37:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (36, 'Cliente36', 'cliente36@test.com', '10000036-5', '2025-05-29', '14:35:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (37, 'Cliente37', 'cliente37@test.com', '10000037-4', '2025-06-23', '11:54:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (38, 'Cliente38', 'cliente38@test.com', '10000038-7', '2025-05-06', '13:22:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (39, 'Cliente39', 'cliente39@test.com', '10000039-7', '2025-05-02', '11:04:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (40, 'Cliente40', 'cliente40@test.com', '10000040-0', '2025-02-26', '10:17:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (41, 'Cliente41', 'cliente41@test.com', '10000041-0', '2025-04-22', '08:50:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (42, 'Cliente42', 'cliente42@test.com', '10000042-2', '2025-05-12', '09:13:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (43, 'Cliente43', 'cliente43@test.com', '10000043-6', '2025-04-22', '11:30:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (44, 'Cliente44', 'cliente44@test.com', '10000044-3', '2025-06-24', '14:23:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (45, 'Cliente45', 'cliente45@test.com', '10000045-5', '2025-05-21', '16:57:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (46, 'Cliente46', 'cliente46@test.com', '10000046-1', '2025-06-20', '11:53:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (47, 'Cliente47', 'cliente47@test.com', '10000047-5', '2025-06-24', '14:06:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (48, 'Cliente48', 'cliente48@test.com', '10000048-0', '2025-02-21', '10:00:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (49, 'Cliente49', 'cliente49@test.com', '10000049-7', '2025-06-07', '08:25:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (50, 'Cliente50', 'cliente50@test.com', '10000050-5', '2025-02-27', '19:03:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (51, 'Cliente51', 'cliente51@test.com', '10000051-4', '2025-07-05', '12:01:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (52, 'Cliente52', 'cliente52@test.com', '10000052-1', '2025-04-16', '12:18:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (53, 'Cliente53', 'cliente53@test.com', '10000053-2', '2025-05-14', '09:53:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (54, 'Cliente54', 'cliente54@test.com', '10000054-1', '2025-03-21', '15:51:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (55, 'Cliente55', 'cliente55@test.com', '10000055-0', '2025-02-05', '17:48:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (56, 'Cliente56', 'cliente56@test.com', '10000056-8', '2025-02-24', '19:10:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (57, 'Cliente57', 'cliente57@test.com', '10000057-3', '2025-04-19', '13:41:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (58, 'Cliente58', 'cliente58@test.com', '10000058-8', '2025-04-20', '08:35:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (59, 'Cliente59', 'cliente59@test.com', '10000059-7', '2025-02-19', '12:25:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (60, 'Cliente60', 'cliente60@test.com', '10000060-0', '2025-06-03', '13:29:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (61, 'Cliente61', 'cliente61@test.com', '10000061-5', '2025-04-28', '15:08:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (62, 'Cliente62', 'cliente62@test.com', '10000062-8', '2025-05-28', '16:09:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (63, 'Cliente63', 'cliente63@test.com', '10000063-5', '2025-03-04', '16:15:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (64, 'Cliente64', 'cliente64@test.com', '10000064-3', '2025-04-13', '18:20:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (65, 'Cliente65', 'cliente65@test.com', '10000065-3', '2025-06-06', '10:52:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (66, 'Cliente66', 'cliente66@test.com', '10000066-6', '2025-02-05', '11:01:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (67, 'Cliente67', 'cliente67@test.com', '10000067-4', '2025-01-22', '10:46:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (68, 'Cliente68', 'cliente68@test.com', '10000068-3', '2025-05-30', '10:06:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (69, 'Cliente69', 'cliente69@test.com', '10000069-1', '2025-07-03', '08:14:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (70, 'Cliente70', 'cliente70@test.com', '10000070-7', '2025-03-19', '17:51:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (71, 'Cliente71', 'cliente71@test.com', '10000071-7', '2025-04-28', '12:53:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (72, 'Cliente72', 'cliente72@test.com', '10000072-1', '2025-05-23', '19:37:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (73, 'Cliente73', 'cliente73@test.com', '10000073-7', '2025-05-26', '08:05:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (74, 'Cliente74', 'cliente74@test.com', '10000074-3', '2025-03-02', '13:51:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (75, 'Cliente75', 'cliente75@test.com', '10000075-5', '2025-04-23', '09:39:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (76, 'Cliente76', 'cliente76@test.com', '10000076-3', '2025-05-06', '15:39:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (77, 'Cliente77', 'cliente77@test.com', '10000077-4', '2025-06-06', '14:32:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (78, 'Cliente78', 'cliente78@test.com', '10000078-1', '2025-02-27', '16:28:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (79, 'Cliente79', 'cliente79@test.com', '10000079-2', '2025-03-15', '10:06:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (80, 'Cliente80', 'cliente80@test.com', '10000080-2', '2025-03-31', '12:14:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (81, 'Cliente81', 'cliente81@test.com', '10000081-2', '2025-05-11', '10:04:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (82, 'Cliente82', 'cliente82@test.com', '10000082-2', '2025-05-18', '14:44:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (83, 'Cliente83', 'cliente83@test.com', '10000083-4', '2025-06-02', '19:31:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (84, 'Cliente84', 'cliente84@test.com', '10000084-2', '2025-02-17', '14:10:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (85, 'Cliente85', 'cliente85@test.com', '10000085-0', '2025-02-03', '17:50:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (86, 'Cliente86', 'cliente86@test.com', '10000086-3', '2025-06-11', '17:40:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (87, 'Cliente87', 'cliente87@test.com', '10000087-6', '2025-04-13', '17:16:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (88, 'Cliente88', 'cliente88@test.com', '10000088-3', '2025-04-11', '09:29:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (89, 'Cliente89', 'cliente89@test.com', '10000089-5', '2025-04-21', '09:22:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (90, 'Cliente90', 'cliente90@test.com', '10000090-3', '2025-05-09', '16:22:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (91, 'Cliente91', 'cliente91@test.com', '10000091-8', '2025-02-04', '15:02:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (92, 'Cliente92', 'cliente92@test.com', '10000092-5', '2025-05-10', '16:27:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (93, 'Cliente93', 'cliente93@test.com', '10000093-0', '2025-02-22', '18:29:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (94, 'Cliente94', 'cliente94@test.com', '10000094-5', '2025-03-24', '13:56:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (95, 'Cliente95', 'cliente95@test.com', '10000095-3', '2025-01-22', '11:17:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (96, 'Cliente96', 'cliente96@test.com', '10000096-8', '2025-04-30', '09:38:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (97, 'Cliente97', 'cliente97@test.com', '10000097-6', '2025-01-29', '13:37:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (98, 'Cliente98', 'cliente98@test.com', '10000098-7', '2025-06-17', '08:15:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (99, 'Cliente99', 'cliente99@test.com', '10000099-0', '2025-04-01', '08:28:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (100, 'Cliente100', 'cliente100@test.com', '10000100-1', '2025-03-20', '10:56:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (101, 'Cliente101', 'cliente101@test.com', '10000101-6', '2025-06-18', '08:49:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (102, 'Cliente102', 'cliente102@test.com', '10000102-8', '2025-05-06', '16:34:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (103, 'Cliente103', 'cliente103@test.com', '10000103-1', '2025-06-04', '18:46:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (104, 'Cliente104', 'cliente104@test.com', '10000104-0', '2025-05-14', '18:48:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (105, 'Cliente105', 'cliente105@test.com', '10000105-6', '2025-06-05', '13:02:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (106, 'Cliente106', 'cliente106@test.com', '10000106-2', '2025-03-19', '08:40:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (107, 'Cliente107', 'cliente107@test.com', '10000107-0', '2025-06-13', '12:15:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (108, 'Cliente108', 'cliente108@test.com', '10000108-7', '2025-04-11', '11:32:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (109, 'Cliente109', 'cliente109@test.com', '10000109-7', '2025-04-10', '17:08:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (110, 'Cliente110', 'cliente110@test.com', '10000110-0', '2025-05-20', '09:22:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (111, 'Cliente111', 'cliente111@test.com', '10000111-0', '2025-03-11', '15:53:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (112, 'Cliente112', 'cliente112@test.com', '10000112-8', '2025-04-22', '16:10:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (113, 'Cliente113', 'cliente113@test.com', '10000113-3', '2025-07-01', '18:22:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (114, 'Cliente114', 'cliente114@test.com', '10000114-0', '2025-02-05', '10:39:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (115, 'Cliente115', 'cliente115@test.com', '10000115-1', '2025-05-03', '17:43:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (116, 'Cliente116', 'cliente116@test.com', '10000116-1', '2025-07-04', '19:03:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (117, 'Cliente117', 'cliente117@test.com', '10000117-7', '2025-06-25', '10:41:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (118, 'Cliente118', 'cliente118@test.com', '10000118-6', '2025-03-12', '12:16:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (119, 'Cliente119', 'cliente119@test.com', '10000119-6', '2025-06-08', '14:43:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (120, 'Cliente120', 'cliente120@test.com', '10000120-8', '2025-04-27', '11:13:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (121, 'Cliente121', 'cliente121@test.com', '10000121-2', '2025-02-16', '10:56:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (122, 'Cliente122', 'cliente122@test.com', '10000122-3', '2025-06-20', '08:27:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (123, 'Cliente123', 'cliente123@test.com', '10000123-7', '2025-06-30', '16:27:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (124, 'Cliente124', 'cliente124@test.com', '10000124-7', '2025-03-30', '12:07:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (125, 'Cliente125', 'cliente125@test.com', '10000125-7', '2025-05-17', '08:32:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (126, 'Cliente126', 'cliente126@test.com', '10000126-5', '2025-02-06', '16:08:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (127, 'Cliente127', 'cliente127@test.com', '10000127-0', '2025-02-09', '09:40:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (128, 'Cliente128', 'cliente128@test.com', '10000128-0', '2025-06-17', '11:16:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (129, 'Cliente129', 'cliente129@test.com', '10000129-2', '2025-06-09', '11:20:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (130, 'Cliente130', 'cliente130@test.com', '10000130-6', '2025-04-07', '18:56:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (131, 'Cliente131', 'cliente131@test.com', '10000131-1', '2025-05-03', '12:22:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (132, 'Cliente132', 'cliente132@test.com', '10000132-5', '2025-07-01', '10:13:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (133, 'Cliente133', 'cliente133@test.com', '10000133-6', '2025-02-21', '12:13:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (134, 'Cliente134', 'cliente134@test.com', '10000134-6', '2025-05-24', '10:57:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (135, 'Cliente135', 'cliente135@test.com', '10000135-8', '2025-03-21', '12:30:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (136, 'Cliente136', 'cliente136@test.com', '10000136-8', '2025-05-30', '16:34:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (137, 'Cliente137', 'cliente137@test.com', '10000137-6', '2025-03-05', '11:11:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (138, 'Cliente138', 'cliente138@test.com', '10000138-2', '2025-03-14', '17:41:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (139, 'Cliente139', 'cliente139@test.com', '10000139-2', '2025-02-07', '17:30:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (140, 'Cliente140', 'cliente140@test.com', '10000140-0', '2025-03-03', '16:08:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (141, 'Cliente141', 'cliente141@test.com', '10000141-0', '2025-02-20', '14:43:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (142, 'Cliente142', 'cliente142@test.com', '10000142-7', '2025-03-23', '17:57:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (143, 'Cliente143', 'cliente143@test.com', '10000143-5', '2025-06-02', '10:41:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (144, 'Cliente144', 'cliente144@test.com', '10000144-2', '2025-01-27', '11:35:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (145, 'Cliente145', 'cliente145@test.com', '10000145-2', '2025-06-10', '08:52:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (146, 'Cliente146', 'cliente146@test.com', '10000146-1', '2025-06-07', '15:31:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (147, 'Cliente147', 'cliente147@test.com', '10000147-8', '2025-02-13', '15:23:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (148, 'Cliente148', 'cliente148@test.com', '10000148-7', '2025-03-26', '12:41:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (149, 'Cliente149', 'cliente149@test.com', '10000149-8', '2025-03-27', '15:52:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (150, 'Cliente150', 'cliente150@test.com', '10000150-7', '2025-04-15', '15:39:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (151, 'Cliente151', 'cliente151@test.com', '10000151-7', '2025-03-09', '13:52:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (152, 'Cliente152', 'cliente152@test.com', '10000152-7', '2025-05-23', '19:15:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (153, 'Cliente153', 'cliente153@test.com', '10000153-0', '2025-01-25', '17:04:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (154, 'Cliente154', 'cliente154@test.com', '10000154-5', '2025-02-07', '12:51:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (155, 'Cliente155', 'cliente155@test.com', '10000155-6', '2025-02-27', '17:34:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (156, 'Cliente156', 'cliente156@test.com', '10000156-0', '2025-06-01', '15:42:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (157, 'Cliente157', 'cliente157@test.com', '10000157-2', '2025-03-14', '16:32:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (158, 'Cliente158', 'cliente158@test.com', '10000158-1', '2025-02-12', '12:06:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (159, 'Cliente159', 'cliente159@test.com', '10000159-0', '2025-03-24', '09:54:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (160, 'Cliente160', 'cliente160@test.com', '10000160-7', '2025-06-26', '08:42:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (161, 'Cliente161', 'cliente161@test.com', '10000161-5', '2025-02-07', '18:24:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (162, 'Cliente162', 'cliente162@test.com', '10000162-7', '2025-03-23', '10:37:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (163, 'Cliente163', 'cliente163@test.com', '10000163-1', '2025-03-02', '11:33:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (164, 'Cliente164', 'cliente164@test.com', '10000164-3', '2025-05-29', '09:49:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (165, 'Cliente165', 'cliente165@test.com', '10000165-8', '2025-06-25', '13:08:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (166, 'Cliente166', 'cliente166@test.com', '10000166-7', '2025-06-06', '14:02:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (167, 'Cliente167', 'cliente167@test.com', '10000167-2', '2025-06-27', '12:01:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (168, 'Cliente168', 'cliente168@test.com', '10000168-3', '2025-03-16', '19:31:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (169, 'Cliente169', 'cliente169@test.com', '10000169-2', '2025-06-14', '08:10:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (170, 'Cliente170', 'cliente170@test.com', '10000170-6', '2025-03-11', '13:23:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (171, 'Cliente171', 'cliente171@test.com', '10000171-3', '2025-04-23', '08:40:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (172, 'Cliente172', 'cliente172@test.com', '10000172-8', '2025-03-30', '19:17:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (173, 'Cliente173', 'cliente173@test.com', '10000173-7', '2025-03-17', '12:07:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (174, 'Cliente174', 'cliente174@test.com', '10000174-1', '2025-05-27', '17:54:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (175, 'Cliente175', 'cliente175@test.com', '10000175-5', '2025-03-12', '13:06:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (176, 'Cliente176', 'cliente176@test.com', '10000176-2', '2025-05-28', '14:57:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (177, 'Cliente177', 'cliente177@test.com', '10000177-6', '2025-05-26', '18:03:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (178, 'Cliente178', 'cliente178@test.com', '10000178-8', '2025-04-04', '09:27:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (179, 'Cliente179', 'cliente179@test.com', '10000179-2', '2025-04-02', '19:13:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (180, 'Cliente180', 'cliente180@test.com', '10000180-1', '2025-04-26', '10:42:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (181, 'Cliente181', 'cliente181@test.com', '10000181-1', '2025-03-12', '15:09:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (182, 'Cliente182', 'cliente182@test.com', '10000182-2', '2025-06-27', '09:50:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (183, 'Cliente183', 'cliente183@test.com', '10000183-4', '2025-02-06', '19:23:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (184, 'Cliente184', 'cliente184@test.com', '10000184-0', '2025-02-28', '18:38:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (185, 'Cliente185', 'cliente185@test.com', '10000185-6', '2025-05-18', '18:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (186, 'Cliente186', 'cliente186@test.com', '10000186-8', '2025-02-14', '15:13:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (187, 'Cliente187', 'cliente187@test.com', '10000187-1', '2025-04-28', '18:07:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (188, 'Cliente188', 'cliente188@test.com', '10000188-1', '2025-04-22', '12:41:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (189, 'Cliente189', 'cliente189@test.com', '10000189-1', '2025-06-24', '18:15:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (190, 'Cliente190', 'cliente190@test.com', '10000190-0', '2025-05-28', '19:46:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (191, 'Cliente191', 'cliente191@test.com', '10000191-4', '2025-05-19', '10:57:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (192, 'Cliente192', 'cliente192@test.com', '10000192-2', '2025-02-15', '11:53:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (193, 'Cliente193', 'cliente193@test.com', '10000193-1', '2025-05-09', '17:44:00', 4, 15, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (194, 'Cliente194', 'cliente194@test.com', '10000194-6', '2025-03-17', '19:07:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (195, 'Cliente195', 'cliente195@test.com', '10000195-5', '2025-01-26', '15:37:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (196, 'Cliente196', 'cliente196@test.com', '10000196-7', '2025-01-31', '12:14:00', 2, 30, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (197, 'Cliente197', 'cliente197@test.com', '10000197-0', '2025-04-11', '18:06:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (198, 'Cliente198', 'cliente198@test.com', '10000198-4', '2025-02-21', '18:25:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (199, 'Cliente199', 'cliente199@test.com', '10000199-0', '2025-05-16', '13:26:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (200, 'Cliente200', 'cliente200@test.com', '10000200-2', '2025-03-14', '15:47:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (201, 'Cliente201', 'cliente201@test.com', '10000201-8', '2025-04-15', '10:28:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (202, 'Cliente202', 'cliente202@test.com', '10000202-6', '2025-02-04', '13:13:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (203, 'Cliente203', 'cliente203@test.com', '10000203-1', '2025-03-02', '18:01:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (204, 'Cliente204', 'cliente204@test.com', '10000204-8', '2025-06-25', '17:52:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (205, 'Cliente205', 'cliente205@test.com', '10000205-7', '2025-03-09', '17:40:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (206, 'Cliente206', 'cliente206@test.com', '10000206-6', '2025-04-20', '11:52:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (207, 'Cliente207', 'cliente207@test.com', '10000207-4', '2025-06-30', '13:57:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (208, 'Cliente208', 'cliente208@test.com', '10000208-0', '2025-04-18', '17:22:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (209, 'Cliente209', 'cliente209@test.com', '10000209-7', '2025-02-05', '15:54:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (210, 'Cliente210', 'cliente210@test.com', '10000210-5', '2025-04-15', '12:20:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (211, 'Cliente211', 'cliente211@test.com', '10000211-2', '2025-05-06', '19:12:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (212, 'Cliente212', 'cliente212@test.com', '10000212-4', '2025-04-03', '14:50:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (213, 'Cliente213', 'cliente213@test.com', '10000213-0', '2025-02-09', '10:47:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (214, 'Cliente214', 'cliente214@test.com', '10000214-2', '2025-03-28', '11:00:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (215, 'Cliente215', 'cliente215@test.com', '10000215-6', '2025-04-28', '10:25:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (216, 'Cliente216', 'cliente216@test.com', '10000216-5', '2025-05-08', '10:32:00', 2, 60, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (217, 'Cliente217', 'cliente217@test.com', '10000217-5', '2025-02-16', '16:10:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (218, 'Cliente218', 'cliente218@test.com', '10000218-2', '2025-02-18', '08:30:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (219, 'Cliente219', 'cliente219@test.com', '10000219-0', '2025-02-15', '19:26:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (220, 'Cliente220', 'cliente220@test.com', '10000220-8', '2025-02-20', '11:25:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (221, 'Cliente221', 'cliente221@test.com', '10000221-3', '2025-02-08', '15:16:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (222, 'Cliente222', 'cliente222@test.com', '10000222-2', '2025-06-13', '16:44:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (223, 'Cliente223', 'cliente223@test.com', '10000223-1', '2025-03-30', '11:58:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (224, 'Cliente224', 'cliente224@test.com', '10000224-0', '2025-03-18', '09:18:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (225, 'Cliente225', 'cliente225@test.com', '10000225-5', '2025-06-29', '10:51:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (226, 'Cliente226', 'cliente226@test.com', '10000226-8', '2025-03-12', '11:27:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (227, 'Cliente227', 'cliente227@test.com', '10000227-1', '2025-06-07', '13:34:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (228, 'Cliente228', 'cliente228@test.com', '10000228-1', '2025-06-08', '09:43:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (229, 'Cliente229', 'cliente229@test.com', '10000229-2', '2025-04-26', '15:24:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (230, 'Cliente230', 'cliente230@test.com', '10000230-7', '2025-01-31', '09:51:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (231, 'Cliente231', 'cliente231@test.com', '10000231-7', '2025-04-29', '17:39:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (232, 'Cliente232', 'cliente232@test.com', '10000232-5', '2025-01-24', '18:09:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (233, 'Cliente233', 'cliente233@test.com', '10000233-8', '2025-02-24', '11:13:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (234, 'Cliente234', 'cliente234@test.com', '10000234-8', '2025-05-26', '15:45:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (235, 'Cliente235', 'cliente235@test.com', '10000235-4', '2025-02-10', '09:06:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (236, 'Cliente236', 'cliente236@test.com', '10000236-6', '2025-03-21', '18:38:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (237, 'Cliente237', 'cliente237@test.com', '10000237-5', '2025-03-27', '08:35:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (238, 'Cliente238', 'cliente238@test.com', '10000238-7', '2025-01-24', '14:06:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (239, 'Cliente239', 'cliente239@test.com', '10000239-6', '2025-02-14', '15:05:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (240, 'Cliente240', 'cliente240@test.com', '10000240-8', '2025-05-03', '09:28:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (241, 'Cliente241', 'cliente241@test.com', '10000241-0', '2025-04-11', '18:04:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (242, 'Cliente242', 'cliente242@test.com', '10000242-3', '2025-06-24', '09:28:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (243, 'Cliente243', 'cliente243@test.com', '10000243-0', '2025-06-04', '18:46:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (244, 'Cliente244', 'cliente244@test.com', '10000244-0', '2025-06-05', '09:42:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (245, 'Cliente245', 'cliente245@test.com', '10000245-6', '2025-02-02', '11:58:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (246, 'Cliente246', 'cliente246@test.com', '10000246-8', '2025-05-10', '15:36:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (247, 'Cliente247', 'cliente247@test.com', '10000247-6', '2025-06-29', '17:15:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (248, 'Cliente248', 'cliente248@test.com', '10000248-7', '2025-05-09', '12:45:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (249, 'Cliente249', 'cliente249@test.com', '10000249-5', '2025-06-02', '18:54:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (250, 'Cliente250', 'cliente250@test.com', '10000250-7', '2025-02-06', '08:26:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (251, 'Cliente251', 'cliente251@test.com', '10000251-7', '2025-06-16', '10:03:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (252, 'Cliente252', 'cliente252@test.com', '10000252-1', '2025-04-24', '17:06:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (253, 'Cliente253', 'cliente253@test.com', '10000253-8', '2025-02-02', '16:29:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (254, 'Cliente254', 'cliente254@test.com', '10000254-3', '2025-04-06', '16:03:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (255, 'Cliente255', 'cliente255@test.com', '10000255-4', '2025-05-09', '10:48:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (256, 'Cliente256', 'cliente256@test.com', '10000256-4', '2025-06-30', '09:43:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (257, 'Cliente257', 'cliente257@test.com', '10000257-0', '2025-05-21', '08:39:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (258, 'Cliente258', 'cliente258@test.com', '10000258-6', '2025-04-05', '09:11:00', 3, 60, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (259, 'Cliente259', 'cliente259@test.com', '10000259-2', '2025-04-22', '12:04:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (260, 'Cliente260', 'cliente260@test.com', '10000260-6', '2025-05-17', '09:18:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (261, 'Cliente261', 'cliente261@test.com', '10000261-3', '2025-06-01', '18:10:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (262, 'Cliente262', 'cliente262@test.com', '10000262-2', '2025-03-23', '08:32:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (263, 'Cliente263', 'cliente263@test.com', '10000263-5', '2025-05-26', '08:54:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (264, 'Cliente264', 'cliente264@test.com', '10000264-0', '2025-06-02', '14:52:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (265, 'Cliente265', 'cliente265@test.com', '10000265-5', '2025-06-11', '13:31:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (266, 'Cliente266', 'cliente266@test.com', '10000266-8', '2025-02-03', '15:33:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (267, 'Cliente267', 'cliente267@test.com', '10000267-2', '2025-01-22', '19:47:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (268, 'Cliente268', 'cliente268@test.com', '10000268-7', '2025-07-04', '09:00:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (269, 'Cliente269', 'cliente269@test.com', '10000269-7', '2025-02-08', '10:15:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (270, 'Cliente270', 'cliente270@test.com', '10000270-1', '2025-05-16', '12:03:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (271, 'Cliente271', 'cliente271@test.com', '10000271-7', '2025-06-27', '19:56:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (272, 'Cliente272', 'cliente272@test.com', '10000272-6', '2025-03-18', '15:06:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (273, 'Cliente273', 'cliente273@test.com', '10000273-8', '2025-06-07', '11:35:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (274, 'Cliente274', 'cliente274@test.com', '10000274-5', '2025-03-20', '18:56:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (275, 'Cliente275', 'cliente275@test.com', '10000275-3', '2025-03-04', '19:07:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (276, 'Cliente276', 'cliente276@test.com', '10000276-3', '2025-04-09', '17:05:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (277, 'Cliente277', 'cliente277@test.com', '10000277-4', '2025-02-16', '11:15:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (278, 'Cliente278', 'cliente278@test.com', '10000278-2', '2025-03-18', '17:47:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (279, 'Cliente279', 'cliente279@test.com', '10000279-1', '2025-06-15', '13:17:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (280, 'Cliente280', 'cliente280@test.com', '10000280-4', '2025-05-07', '11:32:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (281, 'Cliente281', 'cliente281@test.com', '10000281-8', '2025-03-14', '18:10:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (282, 'Cliente282', 'cliente282@test.com', '10000282-2', '2025-04-20', '16:07:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (283, 'Cliente283', 'cliente283@test.com', '10000283-2', '2025-05-30', '09:33:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (284, 'Cliente284', 'cliente284@test.com', '10000284-2', '2025-04-01', '18:15:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (285, 'Cliente285', 'cliente285@test.com', '10000285-4', '2025-06-15', '14:30:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (286, 'Cliente286', 'cliente286@test.com', '10000286-1', '2025-01-23', '19:06:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (287, 'Cliente287', 'cliente287@test.com', '10000287-2', '2025-04-24', '13:45:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (288, 'Cliente288', 'cliente288@test.com', '10000288-7', '2025-06-06', '18:14:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (289, 'Cliente289', 'cliente289@test.com', '10000289-7', '2025-04-02', '14:08:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (290, 'Cliente290', 'cliente290@test.com', '10000290-0', '2025-04-24', '09:50:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (291, 'Cliente291', 'cliente291@test.com', '10000291-0', '2025-05-29', '13:35:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (292, 'Cliente292', 'cliente292@test.com', '10000292-4', '2025-03-24', '19:04:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (293, 'Cliente293', 'cliente293@test.com', '10000293-5', '2025-01-23', '18:23:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (294, 'Cliente294', 'cliente294@test.com', '10000294-6', '2025-02-01', '17:40:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (295, 'Cliente295', 'cliente295@test.com', '10000295-5', '2025-05-24', '08:00:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (296, 'Cliente296', 'cliente296@test.com', '10000296-3', '2025-03-10', '12:28:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (297, 'Cliente297', 'cliente297@test.com', '10000297-7', '2025-02-04', '09:51:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (298, 'Cliente298', 'cliente298@test.com', '10000298-7', '2025-03-14', '12:07:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (299, 'Cliente299', 'cliente299@test.com', '10000299-6', '2025-03-15', '13:44:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (300, 'Cliente300', 'cliente300@test.com', '10000300-5', '2025-03-11', '08:10:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (301, 'Cliente301', 'cliente301@test.com', '10000301-0', '2025-01-20', '19:03:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (302, 'Cliente302', 'cliente302@test.com', '10000302-0', '2025-04-06', '16:47:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (303, 'Cliente303', 'cliente303@test.com', '10000303-0', '2025-02-05', '11:48:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (304, 'Cliente304', 'cliente304@test.com', '10000304-6', '2025-06-11', '11:40:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (305, 'Cliente305', 'cliente305@test.com', '10000305-4', '2025-02-13', '18:54:00', 4, 15, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (306, 'Cliente306', 'cliente306@test.com', '10000306-7', '2025-06-13', '08:10:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (307, 'Cliente307', 'cliente307@test.com', '10000307-7', '2025-03-12', '14:51:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (308, 'Cliente308', 'cliente308@test.com', '10000308-3', '2025-02-20', '11:37:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (309, 'Cliente309', 'cliente309@test.com', '10000309-2', '2025-04-11', '12:26:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (310, 'Cliente310', 'cliente310@test.com', '10000310-8', '2025-06-14', '19:05:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (311, 'Cliente311', 'cliente311@test.com', '10000311-7', '2025-02-23', '19:55:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (312, 'Cliente312', 'cliente312@test.com', '10000312-1', '2025-01-27', '09:33:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (313, 'Cliente313', 'cliente313@test.com', '10000313-4', '2025-01-30', '14:30:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (314, 'Cliente314', 'cliente314@test.com', '10000314-1', '2025-06-03', '15:14:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (315, 'Cliente315', 'cliente315@test.com', '10000315-1', '2025-05-16', '12:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (316, 'Cliente316', 'cliente316@test.com', '10000316-4', '2025-04-04', '18:32:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (317, 'Cliente317', 'cliente317@test.com', '10000317-7', '2025-05-28', '18:58:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (318, 'Cliente318', 'cliente318@test.com', '10000318-4', '2025-04-12', '11:41:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (319, 'Cliente319', 'cliente319@test.com', '10000319-4', '2025-06-13', '13:13:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (320, 'Cliente320', 'cliente320@test.com', '10000320-4', '2025-03-13', '14:14:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (321, 'Cliente321', 'cliente321@test.com', '10000321-5', '2025-04-25', '15:00:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (322, 'Cliente322', 'cliente322@test.com', '10000322-2', '2025-07-02', '16:30:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (323, 'Cliente323', 'cliente323@test.com', '10000323-3', '2025-06-25', '17:49:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (324, 'Cliente324', 'cliente324@test.com', '10000324-3', '2025-07-06', '19:43:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (325, 'Cliente325', 'cliente325@test.com', '10000325-4', '2025-02-11', '11:49:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (326, 'Cliente326', 'cliente326@test.com', '10000326-4', '2025-03-02', '10:20:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (327, 'Cliente327', 'cliente327@test.com', '10000327-7', '2025-03-15', '15:43:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (328, 'Cliente328', 'cliente328@test.com', '10000328-4', '2025-05-07', '13:12:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (329, 'Cliente329', 'cliente329@test.com', '10000329-2', '2025-05-13', '10:56:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (330, 'Cliente330', 'cliente330@test.com', '10000330-7', '2025-03-18', '16:28:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (331, 'Cliente331', 'cliente331@test.com', '10000331-1', '2025-03-31', '11:02:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (332, 'Cliente332', 'cliente332@test.com', '10000332-0', '2025-03-23', '09:34:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (333, 'Cliente333', 'cliente333@test.com', '10000333-6', '2025-06-13', '14:26:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (334, 'Cliente334', 'cliente334@test.com', '10000334-8', '2025-05-17', '17:02:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (335, 'Cliente335', 'cliente335@test.com', '10000335-3', '2025-02-11', '14:27:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (336, 'Cliente336', 'cliente336@test.com', '10000336-1', '2025-03-09', '19:09:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (337, 'Cliente337', 'cliente337@test.com', '10000337-3', '2025-06-20', '18:55:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (338, 'Cliente338', 'cliente338@test.com', '10000338-0', '2025-06-18', '08:09:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (339, 'Cliente339', 'cliente339@test.com', '10000339-7', '2025-05-19', '16:17:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (340, 'Cliente340', 'cliente340@test.com', '10000340-1', '2025-05-25', '10:34:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (341, 'Cliente341', 'cliente341@test.com', '10000341-2', '2025-06-23', '15:07:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (342, 'Cliente342', 'cliente342@test.com', '10000342-0', '2025-03-23', '14:23:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (343, 'Cliente343', 'cliente343@test.com', '10000343-8', '2025-04-05', '12:28:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (344, 'Cliente344', 'cliente344@test.com', '10000344-1', '2025-06-24', '13:11:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (345, 'Cliente345', 'cliente345@test.com', '10000345-6', '2025-02-07', '15:36:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (346, 'Cliente346', 'cliente346@test.com', '10000346-8', '2025-02-25', '18:23:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (347, 'Cliente347', 'cliente347@test.com', '10000347-1', '2025-03-15', '10:30:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (348, 'Cliente348', 'cliente348@test.com', '10000348-2', '2025-04-29', '16:12:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (349, 'Cliente349', 'cliente349@test.com', '10000349-1', '2025-05-27', '09:19:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (350, 'Cliente350', 'cliente350@test.com', '10000350-4', '2025-05-26', '17:45:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (351, 'Cliente351', 'cliente351@test.com', '10000351-4', '2025-05-09', '13:40:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (352, 'Cliente352', 'cliente352@test.com', '10000352-4', '2025-05-09', '13:20:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (353, 'Cliente353', 'cliente353@test.com', '10000353-4', '2025-06-15', '15:51:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (354, 'Cliente354', 'cliente354@test.com', '10000354-5', '2025-06-18', '18:29:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (355, 'Cliente355', 'cliente355@test.com', '10000355-2', '2025-03-11', '10:30:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (356, 'Cliente356', 'cliente356@test.com', '10000356-4', '2025-02-24', '12:52:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (357, 'Cliente357', 'cliente357@test.com', '10000357-4', '2025-02-21', '16:55:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (358, 'Cliente358', 'cliente358@test.com', '10000358-4', '2025-04-19', '10:29:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (359, 'Cliente359', 'cliente359@test.com', '10000359-8', '2025-05-11', '19:20:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (360, 'Cliente360', 'cliente360@test.com', '10000360-1', '2025-06-06', '10:56:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (361, 'Cliente361', 'cliente361@test.com', '10000361-4', '2025-05-30', '15:35:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (362, 'Cliente362', 'cliente362@test.com', '10000362-1', '2025-02-22', '16:02:00', 7, 30, 5250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (363, 'Cliente363', 'cliente363@test.com', '10000363-8', '2025-05-10', '08:50:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (364, 'Cliente364', 'cliente364@test.com', '10000364-3', '2025-04-26', '10:04:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (365, 'Cliente365', 'cliente365@test.com', '10000365-8', '2025-05-07', '13:42:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (366, 'Cliente366', 'cliente366@test.com', '10000366-1', '2025-05-12', '09:28:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (367, 'Cliente367', 'cliente367@test.com', '10000367-0', '2025-02-16', '19:06:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (368, 'Cliente368', 'cliente368@test.com', '10000368-1', '2025-02-04', '14:52:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (369, 'Cliente369', 'cliente369@test.com', '10000369-6', '2025-02-14', '14:13:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (370, 'Cliente370', 'cliente370@test.com', '10000370-2', '2025-05-04', '19:31:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (371, 'Cliente371', 'cliente371@test.com', '10000371-0', '2025-05-18', '16:04:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (372, 'Cliente372', 'cliente372@test.com', '10000372-8', '2025-04-11', '12:28:00', 6, 45, 6750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (373, 'Cliente373', 'cliente373@test.com', '10000373-8', '2025-06-22', '15:34:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (374, 'Cliente374', 'cliente374@test.com', '10000374-8', '2025-06-03', '10:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (375, 'Cliente375', 'cliente375@test.com', '10000375-2', '2025-01-21', '16:21:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (376, 'Cliente376', 'cliente376@test.com', '10000376-7', '2025-02-07', '09:16:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (377, 'Cliente377', 'cliente377@test.com', '10000377-4', '2025-05-23', '11:03:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (378, 'Cliente378', 'cliente378@test.com', '10000378-8', '2025-02-16', '08:11:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (379, 'Cliente379', 'cliente379@test.com', '10000379-2', '2025-03-08', '09:42:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (380, 'Cliente380', 'cliente380@test.com', '10000380-8', '2025-03-22', '12:32:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (381, 'Cliente381', 'cliente381@test.com', '10000381-6', '2025-05-14', '10:08:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (382, 'Cliente382', 'cliente382@test.com', '10000382-8', '2025-02-24', '11:16:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (383, 'Cliente383', 'cliente383@test.com', '10000383-6', '2025-02-22', '12:27:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (384, 'Cliente384', 'cliente384@test.com', '10000384-8', '2025-03-15', '17:01:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (385, 'Cliente385', 'cliente385@test.com', '10000385-6', '2025-03-22', '19:29:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (386, 'Cliente386', 'cliente386@test.com', '10000386-7', '2025-03-08', '17:42:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (387, 'Cliente387', 'cliente387@test.com', '10000387-3', '2025-05-14', '17:33:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (388, 'Cliente388', 'cliente388@test.com', '10000388-5', '2025-04-10', '10:16:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (389, 'Cliente389', 'cliente389@test.com', '10000389-5', '2025-02-22', '09:07:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (390, 'Cliente390', 'cliente390@test.com', '10000390-8', '2025-05-03', '12:48:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (391, 'Cliente391', 'cliente391@test.com', '10000391-5', '2025-02-22', '16:58:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (392, 'Cliente392', 'cliente392@test.com', '10000392-8', '2025-05-20', '14:25:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (393, 'Cliente393', 'cliente393@test.com', '10000393-6', '2025-05-20', '09:55:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (394, 'Cliente394', 'cliente394@test.com', '10000394-6', '2025-05-22', '17:54:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (395, 'Cliente395', 'cliente395@test.com', '10000395-8', '2025-05-27', '10:46:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (396, 'Cliente396', 'cliente396@test.com', '10000396-0', '2025-04-29', '15:07:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (397, 'Cliente397', 'cliente397@test.com', '10000397-0', '2025-01-27', '19:13:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (398, 'Cliente398', 'cliente398@test.com', '10000398-0', '2025-06-04', '19:09:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (399, 'Cliente399', 'cliente399@test.com', '10000399-2', '2025-02-13', '10:36:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (400, 'Cliente400', 'cliente400@test.com', '10000400-8', '2025-05-30', '17:32:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (401, 'Cliente401', 'cliente401@test.com', '10000401-3', '2025-05-09', '17:58:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (402, 'Cliente402', 'cliente402@test.com', '10000402-8', '2025-02-25', '09:26:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (403, 'Cliente403', 'cliente403@test.com', '10000403-1', '2025-06-28', '12:53:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (404, 'Cliente404', 'cliente404@test.com', '10000404-5', '2025-02-14', '19:42:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (405, 'Cliente405', 'cliente405@test.com', '10000405-8', '2025-02-11', '16:46:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (406, 'Cliente406', 'cliente406@test.com', '10000406-5', '2025-02-05', '09:25:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (407, 'Cliente407', 'cliente407@test.com', '10000407-5', '2025-03-07', '18:23:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (408, 'Cliente408', 'cliente408@test.com', '10000408-3', '2025-03-29', '15:28:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (409, 'Cliente409', 'cliente409@test.com', '10000409-4', '2025-04-30', '17:48:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (410, 'Cliente410', 'cliente410@test.com', '10000410-5', '2025-07-01', '13:50:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (411, 'Cliente411', 'cliente411@test.com', '10000411-1', '2025-03-22', '19:41:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (412, 'Cliente412', 'cliente412@test.com', '10000412-4', '2025-04-10', '12:09:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (413, 'Cliente413', 'cliente413@test.com', '10000413-1', '2025-04-21', '11:25:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (414, 'Cliente414', 'cliente414@test.com', '10000414-4', '2025-02-26', '09:32:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (415, 'Cliente415', 'cliente415@test.com', '10000415-2', '2025-05-26', '12:04:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (416, 'Cliente416', 'cliente416@test.com', '10000416-7', '2025-02-18', '18:12:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (417, 'Cliente417', 'cliente417@test.com', '10000417-7', '2025-05-22', '10:18:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (418, 'Cliente418', 'cliente418@test.com', '10000418-0', '2025-01-28', '18:15:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (419, 'Cliente419', 'cliente419@test.com', '10000419-6', '2025-03-30', '10:10:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (420, 'Cliente420', 'cliente420@test.com', '10000420-0', '2025-04-12', '18:58:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (421, 'Cliente421', 'cliente421@test.com', '10000421-4', '2025-02-10', '16:06:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (422, 'Cliente422', 'cliente422@test.com', '10000422-1', '2025-04-04', '14:06:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (423, 'Cliente423', 'cliente423@test.com', '10000423-6', '2025-03-03', '18:39:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (424, 'Cliente424', 'cliente424@test.com', '10000424-0', '2025-04-27', '08:54:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (425, 'Cliente425', 'cliente425@test.com', '10000425-4', '2025-04-13', '19:48:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (426, 'Cliente426', 'cliente426@test.com', '10000426-8', '2025-04-10', '14:55:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (427, 'Cliente427', 'cliente427@test.com', '10000427-6', '2025-06-10', '19:53:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (428, 'Cliente428', 'cliente428@test.com', '10000428-7', '2025-07-05', '12:44:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (429, 'Cliente429', 'cliente429@test.com', '10000429-8', '2025-03-19', '12:58:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (430, 'Cliente430', 'cliente430@test.com', '10000430-3', '2025-06-05', '10:55:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (431, 'Cliente431', 'cliente431@test.com', '10000431-4', '2025-02-17', '15:20:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (432, 'Cliente432', 'cliente432@test.com', '10000432-4', '2025-05-11', '16:10:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (433, 'Cliente433', 'cliente433@test.com', '10000433-8', '2025-02-25', '12:51:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (434, 'Cliente434', 'cliente434@test.com', '10000434-1', '2025-03-01', '10:44:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (435, 'Cliente435', 'cliente435@test.com', '10000435-2', '2025-03-23', '19:40:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (436, 'Cliente436', 'cliente436@test.com', '10000436-0', '2025-01-20', '08:50:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (437, 'Cliente437', 'cliente437@test.com', '10000437-2', '2025-01-27', '10:36:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (438, 'Cliente438', 'cliente438@test.com', '10000438-7', '2025-04-09', '17:35:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (439, 'Cliente439', 'cliente439@test.com', '10000439-4', '2025-02-11', '13:34:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (440, 'Cliente440', 'cliente440@test.com', '10000440-4', '2025-06-01', '11:14:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (441, 'Cliente441', 'cliente441@test.com', '10000441-8', '2025-02-21', '16:55:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (442, 'Cliente442', 'cliente442@test.com', '10000442-7', '2025-05-12', '14:30:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (443, 'Cliente443', 'cliente443@test.com', '10000443-8', '2025-02-05', '09:33:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (444, 'Cliente444', 'cliente444@test.com', '10000444-4', '2025-04-22', '19:19:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (445, 'Cliente445', 'cliente445@test.com', '10000445-1', '2025-05-05', '17:36:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (446, 'Cliente446', 'cliente446@test.com', '10000446-2', '2025-01-31', '13:05:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (447, 'Cliente447', 'cliente447@test.com', '10000447-0', '2025-05-10', '19:51:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (448, 'Cliente448', 'cliente448@test.com', '10000448-1', '2025-03-22', '18:43:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (449, 'Cliente449', 'cliente449@test.com', '10000449-6', '2025-05-19', '08:23:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (450, 'Cliente450', 'cliente450@test.com', '10000450-5', '2025-02-15', '08:50:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (451, 'Cliente451', 'cliente451@test.com', '10000451-4', '2025-02-23', '10:21:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (452, 'Cliente452', 'cliente452@test.com', '10000452-2', '2025-06-15', '10:09:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (453, 'Cliente453', 'cliente453@test.com', '10000453-6', '2025-02-11', '13:38:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (454, 'Cliente454', 'cliente454@test.com', '10000454-8', '2025-03-09', '11:34:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (455, 'Cliente455', 'cliente455@test.com', '10000455-4', '2025-04-17', '18:03:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (456, 'Cliente456', 'cliente456@test.com', '10000456-1', '2025-02-18', '19:29:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (457, 'Cliente457', 'cliente457@test.com', '10000457-4', '2025-05-07', '18:15:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (458, 'Cliente458', 'cliente458@test.com', '10000458-0', '2025-02-19', '08:20:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (459, 'Cliente459', 'cliente459@test.com', '10000459-5', '2025-02-08', '19:24:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (460, 'Cliente460', 'cliente460@test.com', '10000460-4', '2025-02-14', '18:20:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (461, 'Cliente461', 'cliente461@test.com', '10000461-7', '2025-04-23', '12:37:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (462, 'Cliente462', 'cliente462@test.com', '10000462-6', '2025-04-16', '12:18:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (463, 'Cliente463', 'cliente463@test.com', '10000463-1', '2025-01-23', '08:40:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (464, 'Cliente464', 'cliente464@test.com', '10000464-2', '2025-03-05', '13:03:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (465, 'Cliente465', 'cliente465@test.com', '10000465-8', '2025-05-23', '15:19:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (466, 'Cliente466', 'cliente466@test.com', '10000466-0', '2025-03-29', '15:25:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (467, 'Cliente467', 'cliente467@test.com', '10000467-8', '2025-05-28', '13:34:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (468, 'Cliente468', 'cliente468@test.com', '10000468-4', '2025-04-19', '16:25:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (469, 'Cliente469', 'cliente469@test.com', '10000469-5', '2025-06-19', '08:00:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (470, 'Cliente470', 'cliente470@test.com', '10000470-6', '2025-01-31', '09:10:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (471, 'Cliente471', 'cliente471@test.com', '10000471-2', '2025-04-17', '14:15:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (472, 'Cliente472', 'cliente472@test.com', '10000472-3', '2025-02-09', '13:15:00', 5, 30, 3750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (473, 'Cliente473', 'cliente473@test.com', '10000473-8', '2025-04-15', '14:55:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (474, 'Cliente474', 'cliente474@test.com', '10000474-5', '2025-05-16', '16:03:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (475, 'Cliente475', 'cliente475@test.com', '10000475-1', '2025-04-02', '15:22:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (476, 'Cliente476', 'cliente476@test.com', '10000476-1', '2025-05-26', '11:41:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (477, 'Cliente477', 'cliente477@test.com', '10000477-8', '2025-05-12', '11:45:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (478, 'Cliente478', 'cliente478@test.com', '10000478-8', '2025-03-16', '14:16:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (479, 'Cliente479', 'cliente479@test.com', '10000479-1', '2025-03-29', '18:24:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (480, 'Cliente480', 'cliente480@test.com', '10000480-2', '2025-02-01', '08:11:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (481, 'Cliente481', 'cliente481@test.com', '10000481-4', '2025-07-05', '12:06:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (482, 'Cliente482', 'cliente482@test.com', '10000482-5', '2025-03-26', '18:39:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (483, 'Cliente483', 'cliente483@test.com', '10000483-5', '2025-04-08', '14:34:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (484, 'Cliente484', 'cliente484@test.com', '10000484-3', '2025-05-03', '17:36:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (485, 'Cliente485', 'cliente485@test.com', '10000485-1', '2025-06-29', '10:56:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (486, 'Cliente486', 'cliente486@test.com', '10000486-6', '2025-04-02', '17:48:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (487, 'Cliente487', 'cliente487@test.com', '10000487-0', '2025-02-08', '17:45:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (488, 'Cliente488', 'cliente488@test.com', '10000488-7', '2025-03-24', '09:19:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (489, 'Cliente489', 'cliente489@test.com', '10000489-5', '2025-02-19', '12:15:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (490, 'Cliente490', 'cliente490@test.com', '10000490-4', '2025-02-16', '16:15:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (491, 'Cliente491', 'cliente491@test.com', '10000491-7', '2025-05-15', '17:28:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (492, 'Cliente492', 'cliente492@test.com', '10000492-8', '2025-05-21', '08:34:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (493, 'Cliente493', 'cliente493@test.com', '10000493-6', '2025-05-11', '17:56:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (494, 'Cliente494', 'cliente494@test.com', '10000494-5', '2025-03-20', '15:04:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (495, 'Cliente495', 'cliente495@test.com', '10000495-4', '2025-01-23', '10:45:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (496, 'Cliente496', 'cliente496@test.com', '10000496-8', '2025-06-04', '13:21:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (497, 'Cliente497', 'cliente497@test.com', '10000497-6', '2025-05-14', '18:09:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (498, 'Cliente498', 'cliente498@test.com', '10000498-0', '2025-04-26', '17:20:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (499, 'Cliente499', 'cliente499@test.com', '10000499-6', '2025-03-25', '08:43:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (500, 'Cliente500', 'cliente500@test.com', '10000500-4', '2025-02-20', '09:30:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (501, 'Cliente501', 'cliente501@test.com', '10000501-8', '2025-06-01', '09:43:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (502, 'Cliente502', 'cliente502@test.com', '10000502-3', '2025-03-05', '15:50:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (503, 'Cliente503', 'cliente503@test.com', '10000503-6', '2025-03-24', '17:01:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (504, 'Cliente504', 'cliente504@test.com', '10000504-1', '2025-01-21', '11:03:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (505, 'Cliente505', 'cliente505@test.com', '10000505-4', '2025-05-30', '08:39:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (506, 'Cliente506', 'cliente506@test.com', '10000506-0', '2025-06-11', '18:35:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (507, 'Cliente507', 'cliente507@test.com', '10000507-4', '2025-03-02', '11:52:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (508, 'Cliente508', 'cliente508@test.com', '10000508-0', '2025-03-02', '16:43:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (509, 'Cliente509', 'cliente509@test.com', '10000509-2', '2025-06-04', '19:01:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (510, 'Cliente510', 'cliente510@test.com', '10000510-6', '2025-02-19', '11:33:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (511, 'Cliente511', 'cliente511@test.com', '10000511-2', '2025-06-25', '16:14:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (512, 'Cliente512', 'cliente512@test.com', '10000512-7', '2025-03-30', '17:22:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (513, 'Cliente513', 'cliente513@test.com', '10000513-1', '2025-02-24', '13:33:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (514, 'Cliente514', 'cliente514@test.com', '10000514-1', '2025-02-27', '19:38:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (515, 'Cliente515', 'cliente515@test.com', '10000515-3', '2025-03-27', '13:20:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (516, 'Cliente516', 'cliente516@test.com', '10000516-1', '2025-03-13', '18:38:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (517, 'Cliente517', 'cliente517@test.com', '10000517-3', '2025-05-23', '11:16:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (518, 'Cliente518', 'cliente518@test.com', '10000518-0', '2025-07-05', '17:54:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (519, 'Cliente519', 'cliente519@test.com', '10000519-4', '2025-05-10', '18:15:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (520, 'Cliente520', 'cliente520@test.com', '10000520-5', '2025-06-30', '16:37:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (521, 'Cliente521', 'cliente521@test.com', '10000521-5', '2025-03-19', '09:36:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (522, 'Cliente522', 'cliente522@test.com', '10000522-3', '2025-03-02', '14:50:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (523, 'Cliente523', 'cliente523@test.com', '10000523-6', '2025-03-25', '17:51:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (524, 'Cliente524', 'cliente524@test.com', '10000524-7', '2025-06-02', '12:42:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (525, 'Cliente525', 'cliente525@test.com', '10000525-2', '2025-04-14', '19:26:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (526, 'Cliente526', 'cliente526@test.com', '10000526-2', '2025-06-24', '10:39:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (527, 'Cliente527', 'cliente527@test.com', '10000527-7', '2025-03-24', '13:14:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (528, 'Cliente528', 'cliente528@test.com', '10000528-0', '2025-04-03', '17:36:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (529, 'Cliente529', 'cliente529@test.com', '10000529-8', '2025-06-12', '12:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (530, 'Cliente530', 'cliente530@test.com', '10000530-2', '2025-07-04', '16:06:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (531, 'Cliente531', 'cliente531@test.com', '10000531-2', '2025-02-06', '08:04:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (532, 'Cliente532', 'cliente532@test.com', '10000532-4', '2025-05-17', '13:03:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (533, 'Cliente533', 'cliente533@test.com', '10000533-6', '2025-02-12', '16:53:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (534, 'Cliente534', 'cliente534@test.com', '10000534-2', '2025-01-21', '10:17:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (535, 'Cliente535', 'cliente535@test.com', '10000535-8', '2025-04-07', '18:03:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (536, 'Cliente536', 'cliente536@test.com', '10000536-1', '2025-02-28', '09:07:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (537, 'Cliente537', 'cliente537@test.com', '10000537-2', '2025-05-12', '11:55:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (538, 'Cliente538', 'cliente538@test.com', '10000538-4', '2025-05-24', '17:50:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (539, 'Cliente539', 'cliente539@test.com', '10000539-3', '2025-05-28', '09:16:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (540, 'Cliente540', 'cliente540@test.com', '10000540-5', '2025-05-27', '10:44:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (541, 'Cliente541', 'cliente541@test.com', '10000541-1', '2025-03-25', '16:34:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (542, 'Cliente542', 'cliente542@test.com', '10000542-6', '2025-03-24', '15:26:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (543, 'Cliente543', 'cliente543@test.com', '10000543-4', '2025-03-11', '17:26:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (544, 'Cliente544', 'cliente544@test.com', '10000544-5', '2025-01-28', '15:56:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (545, 'Cliente545', 'cliente545@test.com', '10000545-4', '2025-05-26', '13:14:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (546, 'Cliente546', 'cliente546@test.com', '10000546-3', '2025-04-29', '11:29:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (547, 'Cliente547', 'cliente547@test.com', '10000547-3', '2025-06-07', '16:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (548, 'Cliente548', 'cliente548@test.com', '10000548-0', '2025-02-09', '12:33:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (549, 'Cliente549', 'cliente549@test.com', '10000549-6', '2025-04-14', '19:33:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (550, 'Cliente550', 'cliente550@test.com', '10000550-2', '2025-04-21', '10:29:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (551, 'Cliente551', 'cliente551@test.com', '10000551-3', '2025-06-12', '11:40:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (552, 'Cliente552', 'cliente552@test.com', '10000552-4', '2025-02-17', '10:41:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (553, 'Cliente553', 'cliente553@test.com', '10000553-4', '2025-01-25', '09:31:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (554, 'Cliente554', 'cliente554@test.com', '10000554-5', '2025-04-11', '18:57:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (555, 'Cliente555', 'cliente555@test.com', '10000555-1', '2025-05-30', '18:13:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (556, 'Cliente556', 'cliente556@test.com', '10000556-4', '2025-04-07', '15:26:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (557, 'Cliente557', 'cliente557@test.com', '10000557-3', '2025-03-13', '09:17:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (558, 'Cliente558', 'cliente558@test.com', '10000558-1', '2025-03-24', '19:44:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (559, 'Cliente559', 'cliente559@test.com', '10000559-0', '2025-02-10', '14:26:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (560, 'Cliente560', 'cliente560@test.com', '10000560-5', '2025-04-20', '18:53:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (561, 'Cliente561', 'cliente561@test.com', '10000561-1', '2025-06-30', '11:52:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (562, 'Cliente562', 'cliente562@test.com', '10000562-4', '2025-04-19', '14:51:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (563, 'Cliente563', 'cliente563@test.com', '10000563-1', '2025-03-31', '19:14:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (564, 'Cliente564', 'cliente564@test.com', '10000564-0', '2025-02-22', '19:00:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (565, 'Cliente565', 'cliente565@test.com', '10000565-2', '2025-01-24', '10:37:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (566, 'Cliente566', 'cliente566@test.com', '10000566-3', '2025-02-15', '08:22:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (567, 'Cliente567', 'cliente567@test.com', '10000567-1', '2025-03-11', '13:44:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (568, 'Cliente568', 'cliente568@test.com', '10000568-6', '2025-02-16', '15:48:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (569, 'Cliente569', 'cliente569@test.com', '10000569-0', '2025-05-28', '12:10:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (570, 'Cliente570', 'cliente570@test.com', '10000570-5', '2025-03-06', '17:27:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (571, 'Cliente571', 'cliente571@test.com', '10000571-2', '2025-06-07', '11:51:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (572, 'Cliente572', 'cliente572@test.com', '10000572-7', '2025-03-26', '09:47:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (573, 'Cliente573', 'cliente573@test.com', '10000573-6', '2025-01-24', '09:42:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (574, 'Cliente574', 'cliente574@test.com', '10000574-1', '2025-05-24', '11:27:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (575, 'Cliente575', 'cliente575@test.com', '10000575-3', '2025-04-01', '11:45:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (576, 'Cliente576', 'cliente576@test.com', '10000576-5', '2025-01-24', '18:37:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (577, 'Cliente577', 'cliente577@test.com', '10000577-8', '2025-06-08', '19:45:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (578, 'Cliente578', 'cliente578@test.com', '10000578-7', '2025-05-27', '18:17:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (579, 'Cliente579', 'cliente579@test.com', '10000579-6', '2025-06-21', '11:19:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (580, 'Cliente580', 'cliente580@test.com', '10000580-0', '2025-03-17', '14:22:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (581, 'Cliente581', 'cliente581@test.com', '10000581-4', '2025-02-04', '16:14:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (582, 'Cliente582', 'cliente582@test.com', '10000582-2', '2025-05-21', '17:38:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (583, 'Cliente583', 'cliente583@test.com', '10000583-0', '2025-06-18', '12:55:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (584, 'Cliente584', 'cliente584@test.com', '10000584-7', '2025-05-24', '12:24:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (585, 'Cliente585', 'cliente585@test.com', '10000585-8', '2025-02-27', '10:47:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (586, 'Cliente586', 'cliente586@test.com', '10000586-2', '2025-04-17', '15:42:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (587, 'Cliente587', 'cliente587@test.com', '10000587-0', '2025-05-07', '12:29:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (588, 'Cliente588', 'cliente588@test.com', '10000588-2', '2025-02-20', '10:57:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (589, 'Cliente589', 'cliente589@test.com', '10000589-7', '2025-05-16', '11:35:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (590, 'Cliente590', 'cliente590@test.com', '10000590-0', '2025-05-22', '18:15:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (591, 'Cliente591', 'cliente591@test.com', '10000591-4', '2025-02-05', '16:09:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (592, 'Cliente592', 'cliente592@test.com', '10000592-6', '2025-07-06', '09:55:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (593, 'Cliente593', 'cliente593@test.com', '10000593-5', '2025-03-22', '17:56:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (594, 'Cliente594', 'cliente594@test.com', '10000594-8', '2025-04-28', '18:05:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (595, 'Cliente595', 'cliente595@test.com', '10000595-0', '2025-05-27', '08:17:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (596, 'Cliente596', 'cliente596@test.com', '10000596-1', '2025-06-30', '10:39:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (597, 'Cliente597', 'cliente597@test.com', '10000597-6', '2025-02-22', '14:41:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (598, 'Cliente598', 'cliente598@test.com', '10000598-0', '2025-03-21', '19:07:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (599, 'Cliente599', 'cliente599@test.com', '10000599-1', '2025-05-13', '08:14:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (600, 'Cliente600', 'cliente600@test.com', '10000600-8', '2025-06-30', '17:25:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (601, 'Cliente601', 'cliente601@test.com', '10000601-7', '2025-02-07', '14:50:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (602, 'Cliente602', 'cliente602@test.com', '10000602-6', '2025-02-06', '12:01:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (603, 'Cliente603', 'cliente603@test.com', '10000603-8', '2025-04-14', '19:34:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (604, 'Cliente604', 'cliente604@test.com', '10000604-6', '2025-03-04', '09:12:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (605, 'Cliente605', 'cliente605@test.com', '10000605-6', '2025-06-03', '11:40:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (606, 'Cliente606', 'cliente606@test.com', '10000606-8', '2025-06-26', '14:47:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (607, 'Cliente607', 'cliente607@test.com', '10000607-5', '2025-06-10', '18:31:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (608, 'Cliente608', 'cliente608@test.com', '10000608-4', '2025-03-15', '15:25:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (609, 'Cliente609', 'cliente609@test.com', '10000609-2', '2025-05-11', '09:49:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (610, 'Cliente610', 'cliente610@test.com', '10000610-3', '2025-03-12', '18:11:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (611, 'Cliente611', 'cliente611@test.com', '10000611-8', '2025-04-10', '12:44:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (612, 'Cliente612', 'cliente612@test.com', '10000612-6', '2025-05-17', '12:56:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (613, 'Cliente613', 'cliente613@test.com', '10000613-8', '2025-04-14', '18:16:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (614, 'Cliente614', 'cliente614@test.com', '10000614-3', '2025-05-03', '11:48:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (615, 'Cliente615', 'cliente615@test.com', '10000615-5', '2025-02-24', '18:44:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (616, 'Cliente616', 'cliente616@test.com', '10000616-1', '2025-03-30', '13:10:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (617, 'Cliente617', 'cliente617@test.com', '10000617-5', '2025-06-18', '10:08:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (618, 'Cliente618', 'cliente618@test.com', '10000618-6', '2025-04-24', '17:28:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (619, 'Cliente619', 'cliente619@test.com', '10000619-2', '2025-04-12', '16:57:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (620, 'Cliente620', 'cliente620@test.com', '10000620-1', '2025-03-04', '17:37:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (621, 'Cliente621', 'cliente621@test.com', '10000621-3', '2025-06-26', '15:22:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (622, 'Cliente622', 'cliente622@test.com', '10000622-6', '2025-03-30', '15:22:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (623, 'Cliente623', 'cliente623@test.com', '10000623-7', '2025-04-11', '13:14:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (624, 'Cliente624', 'cliente624@test.com', '10000624-5', '2025-04-12', '14:00:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (625, 'Cliente625', 'cliente625@test.com', '10000625-2', '2025-04-13', '12:34:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (626, 'Cliente626', 'cliente626@test.com', '10000626-7', '2025-04-11', '17:14:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (627, 'Cliente627', 'cliente627@test.com', '10000627-5', '2025-02-20', '10:35:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (628, 'Cliente628', 'cliente628@test.com', '10000628-8', '2025-01-30', '13:08:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (629, 'Cliente629', 'cliente629@test.com', '10000629-5', '2025-04-04', '16:05:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (630, 'Cliente630', 'cliente630@test.com', '10000630-5', '2025-03-10', '17:47:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (631, 'Cliente631', 'cliente631@test.com', '10000631-3', '2025-06-05', '08:56:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (632, 'Cliente632', 'cliente632@test.com', '10000632-8', '2025-01-30', '09:08:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (633, 'Cliente633', 'cliente633@test.com', '10000633-2', '2025-05-16', '09:32:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (634, 'Cliente634', 'cliente634@test.com', '10000634-0', '2025-05-04', '18:19:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (635, 'Cliente635', 'cliente635@test.com', '10000635-7', '2025-06-03', '13:09:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (636, 'Cliente636', 'cliente636@test.com', '10000636-8', '2025-03-20', '19:48:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (637, 'Cliente637', 'cliente637@test.com', '10000637-2', '2025-03-11', '15:06:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (638, 'Cliente638', 'cliente638@test.com', '10000638-7', '2025-02-27', '08:08:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (639, 'Cliente639', 'cliente639@test.com', '10000639-6', '2025-07-02', '14:11:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (640, 'Cliente640', 'cliente640@test.com', '10000640-6', '2025-02-14', '09:37:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (641, 'Cliente641', 'cliente641@test.com', '10000641-8', '2025-04-30', '17:31:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (642, 'Cliente642', 'cliente642@test.com', '10000642-6', '2025-06-23', '09:23:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (643, 'Cliente643', 'cliente643@test.com', '10000643-6', '2025-03-15', '10:14:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (644, 'Cliente644', 'cliente644@test.com', '10000644-3', '2025-07-02', '08:57:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (645, 'Cliente645', 'cliente645@test.com', '10000645-4', '2025-06-27', '18:25:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (646, 'Cliente646', 'cliente646@test.com', '10000646-7', '2025-04-21', '11:11:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (647, 'Cliente647', 'cliente647@test.com', '10000647-1', '2025-06-07', '13:35:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (648, 'Cliente648', 'cliente648@test.com', '10000648-0', '2025-03-15', '11:34:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (649, 'Cliente649', 'cliente649@test.com', '10000649-4', '2025-06-06', '14:33:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (650, 'Cliente650', 'cliente650@test.com', '10000650-0', '2025-03-01', '11:52:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (651, 'Cliente651', 'cliente651@test.com', '10000651-0', '2025-04-17', '16:12:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (652, 'Cliente652', 'cliente652@test.com', '10000652-5', '2025-04-24', '11:42:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (653, 'Cliente653', 'cliente653@test.com', '10000653-2', '2025-06-19', '12:46:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (654, 'Cliente654', 'cliente654@test.com', '10000654-5', '2025-06-02', '10:57:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (655, 'Cliente655', 'cliente655@test.com', '10000655-4', '2025-02-07', '14:35:00', 6, 45, 6750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (656, 'Cliente656', 'cliente656@test.com', '10000656-5', '2025-04-15', '17:22:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (657, 'Cliente657', 'cliente657@test.com', '10000657-4', '2025-05-05', '14:12:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (658, 'Cliente658', 'cliente658@test.com', '10000658-0', '2025-06-13', '12:08:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (659, 'Cliente659', 'cliente659@test.com', '10000659-8', '2025-06-24', '14:49:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (660, 'Cliente660', 'cliente660@test.com', '10000660-8', '2025-04-24', '16:54:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (661, 'Cliente661', 'cliente661@test.com', '10000661-7', '2025-02-05', '08:13:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (662, 'Cliente662', 'cliente662@test.com', '10000662-6', '2025-06-26', '17:55:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (663, 'Cliente663', 'cliente663@test.com', '10000663-7', '2025-05-03', '12:28:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (664, 'Cliente664', 'cliente664@test.com', '10000664-1', '2025-06-25', '10:44:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (665, 'Cliente665', 'cliente665@test.com', '10000665-6', '2025-04-22', '08:20:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (666, 'Cliente666', 'cliente666@test.com', '10000666-3', '2025-03-15', '11:13:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (667, 'Cliente667', 'cliente667@test.com', '10000667-1', '2025-05-18', '18:20:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (668, 'Cliente668', 'cliente668@test.com', '10000668-4', '2025-06-24', '13:03:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (669, 'Cliente669', 'cliente669@test.com', '10000669-5', '2025-04-09', '09:05:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (670, 'Cliente670', 'cliente670@test.com', '10000670-0', '2025-04-15', '14:40:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (671, 'Cliente671', 'cliente671@test.com', '10000671-4', '2025-05-05', '18:48:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (672, 'Cliente672', 'cliente672@test.com', '10000672-7', '2025-06-24', '11:33:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (673, 'Cliente673', 'cliente673@test.com', '10000673-8', '2025-01-23', '15:52:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (674, 'Cliente674', 'cliente674@test.com', '10000674-0', '2025-01-27', '10:43:00', 2, 30, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (675, 'Cliente675', 'cliente675@test.com', '10000675-7', '2025-03-13', '12:28:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (676, 'Cliente676', 'cliente676@test.com', '10000676-8', '2025-02-12', '09:52:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (677, 'Cliente677', 'cliente677@test.com', '10000677-8', '2025-06-11', '12:39:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (678, 'Cliente678', 'cliente678@test.com', '10000678-2', '2025-06-16', '10:17:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (679, 'Cliente679', 'cliente679@test.com', '10000679-6', '2025-04-17', '09:14:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (680, 'Cliente680', 'cliente680@test.com', '10000680-8', '2025-04-28', '17:35:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (681, 'Cliente681', 'cliente681@test.com', '10000681-8', '2025-06-14', '13:09:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (682, 'Cliente682', 'cliente682@test.com', '10000682-0', '2025-03-24', '11:11:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (683, 'Cliente683', 'cliente683@test.com', '10000683-2', '2025-05-20', '19:50:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (684, 'Cliente684', 'cliente684@test.com', '10000684-0', '2025-06-22', '17:50:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (685, 'Cliente685', 'cliente685@test.com', '10000685-7', '2025-03-14', '15:18:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (686, 'Cliente686', 'cliente686@test.com', '10000686-3', '2025-06-04', '13:52:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (687, 'Cliente687', 'cliente687@test.com', '10000687-5', '2025-02-08', '09:45:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (688, 'Cliente688', 'cliente688@test.com', '10000688-8', '2025-04-24', '18:58:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (689, 'Cliente689', 'cliente689@test.com', '10000689-7', '2025-05-19', '15:50:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (690, 'Cliente690', 'cliente690@test.com', '10000690-4', '2025-06-29', '15:34:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (691, 'Cliente691', 'cliente691@test.com', '10000691-8', '2025-02-06', '19:41:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (692, 'Cliente692', 'cliente692@test.com', '10000692-5', '2025-05-27', '14:26:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (693, 'Cliente693', 'cliente693@test.com', '10000693-0', '2025-06-29', '09:51:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (694, 'Cliente694', 'cliente694@test.com', '10000694-0', '2025-03-21', '09:50:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (695, 'Cliente695', 'cliente695@test.com', '10000695-2', '2025-03-30', '08:58:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (696, 'Cliente696', 'cliente696@test.com', '10000696-5', '2025-06-11', '15:19:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (697, 'Cliente697', 'cliente697@test.com', '10000697-8', '2025-05-06', '13:52:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (698, 'Cliente698', 'cliente698@test.com', '10000698-7', '2025-04-04', '10:21:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (699, 'Cliente699', 'cliente699@test.com', '10000699-8', '2025-06-14', '14:40:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (700, 'Cliente700', 'cliente700@test.com', '10000700-6', '2025-04-30', '18:16:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (701, 'Cliente701', 'cliente701@test.com', '10000701-6', '2025-05-19', '09:04:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (702, 'Cliente702', 'cliente702@test.com', '10000702-8', '2025-04-16', '12:46:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (703, 'Cliente703', 'cliente703@test.com', '10000703-5', '2025-04-01', '11:04:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (704, 'Cliente704', 'cliente704@test.com', '10000704-0', '2025-03-31', '13:11:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (705, 'Cliente705', 'cliente705@test.com', '10000705-3', '2025-02-15', '16:18:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (706, 'Cliente706', 'cliente706@test.com', '10000706-6', '2025-06-07', '17:18:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (707, 'Cliente707', 'cliente707@test.com', '10000707-0', '2025-03-23', '12:21:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (708, 'Cliente708', 'cliente708@test.com', '10000708-0', '2025-01-21', '17:17:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (709, 'Cliente709', 'cliente709@test.com', '10000709-7', '2025-04-24', '11:33:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (710, 'Cliente710', 'cliente710@test.com', '10000710-0', '2025-02-01', '10:37:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (711, 'Cliente711', 'cliente711@test.com', '10000711-8', '2025-05-17', '10:42:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (712, 'Cliente712', 'cliente712@test.com', '10000712-7', '2025-05-25', '10:58:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (713, 'Cliente713', 'cliente713@test.com', '10000713-8', '2025-03-24', '10:10:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (714, 'Cliente714', 'cliente714@test.com', '10000714-2', '2025-06-24', '15:18:00', 7, 30, 5250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (715, 'Cliente715', 'cliente715@test.com', '10000715-3', '2025-02-03', '09:40:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (716, 'Cliente716', 'cliente716@test.com', '10000716-6', '2025-06-01', '10:17:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (717, 'Cliente717', 'cliente717@test.com', '10000717-7', '2025-04-16', '12:07:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (718, 'Cliente718', 'cliente718@test.com', '10000718-1', '2025-02-06', '08:35:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (719, 'Cliente719', 'cliente719@test.com', '10000719-7', '2025-04-23', '18:23:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (720, 'Cliente720', 'cliente720@test.com', '10000720-4', '2025-04-21', '16:04:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (721, 'Cliente721', 'cliente721@test.com', '10000721-4', '2025-05-30', '13:35:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (722, 'Cliente722', 'cliente722@test.com', '10000722-2', '2025-04-03', '16:33:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (723, 'Cliente723', 'cliente723@test.com', '10000723-5', '2025-03-12', '09:10:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (724, 'Cliente724', 'cliente724@test.com', '10000724-1', '2025-07-03', '15:06:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (725, 'Cliente725', 'cliente725@test.com', '10000725-6', '2025-05-08', '18:18:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (726, 'Cliente726', 'cliente726@test.com', '10000726-5', '2025-05-01', '12:05:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (727, 'Cliente727', 'cliente727@test.com', '10000727-7', '2025-05-29', '13:24:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (728, 'Cliente728', 'cliente728@test.com', '10000728-8', '2025-07-01', '11:09:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (729, 'Cliente729', 'cliente729@test.com', '10000729-4', '2025-02-27', '19:52:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (730, 'Cliente730', 'cliente730@test.com', '10000730-8', '2025-04-17', '14:58:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (731, 'Cliente731', 'cliente731@test.com', '10000731-6', '2025-06-16', '15:29:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (732, 'Cliente732', 'cliente732@test.com', '10000732-6', '2025-04-23', '11:16:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (733, 'Cliente733', 'cliente733@test.com', '10000733-4', '2025-02-16', '14:52:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (734, 'Cliente734', 'cliente734@test.com', '10000734-1', '2025-05-21', '16:20:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (735, 'Cliente735', 'cliente735@test.com', '10000735-6', '2025-03-26', '14:39:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (736, 'Cliente736', 'cliente736@test.com', '10000736-6', '2025-06-18', '09:00:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (737, 'Cliente737', 'cliente737@test.com', '10000737-4', '2025-02-14', '17:35:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (738, 'Cliente738', 'cliente738@test.com', '10000738-7', '2025-03-23', '17:05:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (739, 'Cliente739', 'cliente739@test.com', '10000739-7', '2025-02-07', '19:52:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (740, 'Cliente740', 'cliente740@test.com', '10000740-1', '2025-04-04', '16:13:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (741, 'Cliente741', 'cliente741@test.com', '10000741-4', '2025-05-26', '13:11:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (742, 'Cliente742', 'cliente742@test.com', '10000742-5', '2025-06-07', '16:28:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (743, 'Cliente743', 'cliente743@test.com', '10000743-1', '2025-04-21', '19:32:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (744, 'Cliente744', 'cliente744@test.com', '10000744-1', '2025-04-26', '08:02:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (745, 'Cliente745', 'cliente745@test.com', '10000745-7', '2025-06-02', '11:42:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (746, 'Cliente746', 'cliente746@test.com', '10000746-6', '2025-05-08', '09:30:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (747, 'Cliente747', 'cliente747@test.com', '10000747-5', '2025-03-26', '13:47:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (748, 'Cliente748', 'cliente748@test.com', '10000748-1', '2025-06-23', '17:54:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (749, 'Cliente749', 'cliente749@test.com', '10000749-6', '2025-02-14', '12:00:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (750, 'Cliente750', 'cliente750@test.com', '10000750-3', '2025-05-02', '16:39:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (751, 'Cliente751', 'cliente751@test.com', '10000751-8', '2025-01-24', '19:37:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (752, 'Cliente752', 'cliente752@test.com', '10000752-0', '2025-04-29', '18:23:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (753, 'Cliente753', 'cliente753@test.com', '10000753-5', '2025-05-19', '13:53:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (754, 'Cliente754', 'cliente754@test.com', '10000754-1', '2025-04-24', '14:28:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (755, 'Cliente755', 'cliente755@test.com', '10000755-6', '2025-04-22', '11:47:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (756, 'Cliente756', 'cliente756@test.com', '10000756-7', '2025-03-03', '18:52:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (757, 'Cliente757', 'cliente757@test.com', '10000757-4', '2025-02-10', '08:30:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (758, 'Cliente758', 'cliente758@test.com', '10000758-8', '2025-02-06', '15:21:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (759, 'Cliente759', 'cliente759@test.com', '10000759-1', '2025-03-21', '13:43:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (760, 'Cliente760', 'cliente760@test.com', '10000760-6', '2025-07-04', '13:36:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (761, 'Cliente761', 'cliente761@test.com', '10000761-0', '2025-04-08', '18:32:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (762, 'Cliente762', 'cliente762@test.com', '10000762-8', '2025-06-16', '19:49:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (763, 'Cliente763', 'cliente763@test.com', '10000763-7', '2025-02-17', '09:40:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (764, 'Cliente764', 'cliente764@test.com', '10000764-4', '2025-03-04', '08:26:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (765, 'Cliente765', 'cliente765@test.com', '10000765-1', '2025-06-11', '09:14:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (766, 'Cliente766', 'cliente766@test.com', '10000766-2', '2025-05-12', '09:05:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (767, 'Cliente767', 'cliente767@test.com', '10000767-3', '2025-04-20', '10:09:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (768, 'Cliente768', 'cliente768@test.com', '10000768-2', '2025-06-01', '10:26:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (769, 'Cliente769', 'cliente769@test.com', '10000769-3', '2025-02-11', '15:07:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (770, 'Cliente770', 'cliente770@test.com', '10000770-7', '2025-05-21', '09:24:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (771, 'Cliente771', 'cliente771@test.com', '10000771-5', '2025-03-24', '09:28:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (772, 'Cliente772', 'cliente772@test.com', '10000772-8', '2025-03-16', '11:04:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (773, 'Cliente773', 'cliente773@test.com', '10000773-8', '2025-06-24', '13:56:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (774, 'Cliente774', 'cliente774@test.com', '10000774-2', '2025-02-09', '18:33:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (775, 'Cliente775', 'cliente775@test.com', '10000775-2', '2025-03-14', '08:12:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (776, 'Cliente776', 'cliente776@test.com', '10000776-2', '2025-04-04', '11:23:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (777, 'Cliente777', 'cliente777@test.com', '10000777-5', '2025-06-26', '12:37:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (778, 'Cliente778', 'cliente778@test.com', '10000778-7', '2025-04-10', '13:49:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (779, 'Cliente779', 'cliente779@test.com', '10000779-2', '2025-01-29', '13:36:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (780, 'Cliente780', 'cliente780@test.com', '10000780-0', '2025-05-16', '17:43:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (781, 'Cliente781', 'cliente781@test.com', '10000781-7', '2025-02-22', '09:03:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (782, 'Cliente782', 'cliente782@test.com', '10000782-7', '2025-02-05', '09:24:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (783, 'Cliente783', 'cliente783@test.com', '10000783-2', '2025-06-14', '10:52:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (784, 'Cliente784', 'cliente784@test.com', '10000784-4', '2025-06-27', '12:57:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (785, 'Cliente785', 'cliente785@test.com', '10000785-4', '2025-05-10', '08:58:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (786, 'Cliente786', 'cliente786@test.com', '10000786-8', '2025-03-25', '16:05:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (787, 'Cliente787', 'cliente787@test.com', '10000787-6', '2025-04-04', '08:44:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (788, 'Cliente788', 'cliente788@test.com', '10000788-4', '2025-04-25', '08:22:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (789, 'Cliente789', 'cliente789@test.com', '10000789-1', '2025-06-06', '13:25:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (790, 'Cliente790', 'cliente790@test.com', '10000790-3', '2025-01-25', '08:48:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (791, 'Cliente791', 'cliente791@test.com', '10000791-6', '2025-01-29', '18:43:00', 7, 30, 5250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (792, 'Cliente792', 'cliente792@test.com', '10000792-7', '2025-06-08', '08:36:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (793, 'Cliente793', 'cliente793@test.com', '10000793-3', '2025-04-01', '15:40:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (794, 'Cliente794', 'cliente794@test.com', '10000794-7', '2025-01-20', '17:43:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (795, 'Cliente795', 'cliente795@test.com', '10000795-8', '2025-05-19', '12:20:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (796, 'Cliente796', 'cliente796@test.com', '10000796-7', '2025-04-27', '13:04:00', 3, 60, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (797, 'Cliente797', 'cliente797@test.com', '10000797-2', '2025-04-29', '11:40:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (798, 'Cliente798', 'cliente798@test.com', '10000798-7', '2025-05-07', '11:21:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (799, 'Cliente799', 'cliente799@test.com', '10000799-6', '2025-03-23', '15:54:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (800, 'Cliente800', 'cliente800@test.com', '10000800-0', '2025-03-10', '14:07:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (801, 'Cliente801', 'cliente801@test.com', '10000801-8', '2025-03-04', '12:43:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (802, 'Cliente802', 'cliente802@test.com', '10000802-3', '2025-03-08', '13:04:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (803, 'Cliente803', 'cliente803@test.com', '10000803-6', '2025-03-02', '08:16:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (804, 'Cliente804', 'cliente804@test.com', '10000804-3', '2025-03-28', '17:34:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (805, 'Cliente805', 'cliente805@test.com', '10000805-0', '2025-04-02', '11:54:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (806, 'Cliente806', 'cliente806@test.com', '10000806-8', '2025-02-03', '08:30:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (807, 'Cliente807', 'cliente807@test.com', '10000807-7', '2025-05-12', '17:46:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (808, 'Cliente808', 'cliente808@test.com', '10000808-5', '2025-06-10', '13:24:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (809, 'Cliente809', 'cliente809@test.com', '10000809-1', '2025-05-31', '10:37:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (810, 'Cliente810', 'cliente810@test.com', '10000810-3', '2025-04-04', '08:28:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (811, 'Cliente811', 'cliente811@test.com', '10000811-2', '2025-02-20', '16:44:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (812, 'Cliente812', 'cliente812@test.com', '10000812-0', '2025-03-12', '10:12:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (813, 'Cliente813', 'cliente813@test.com', '10000813-7', '2025-05-01', '10:30:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (814, 'Cliente814', 'cliente814@test.com', '10000814-7', '2025-01-20', '14:03:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (815, 'Cliente815', 'cliente815@test.com', '10000815-4', '2025-04-09', '16:39:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (816, 'Cliente816', 'cliente816@test.com', '10000816-3', '2025-04-02', '11:19:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (817, 'Cliente817', 'cliente817@test.com', '10000817-4', '2025-07-03', '09:52:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (818, 'Cliente818', 'cliente818@test.com', '10000818-4', '2025-03-25', '16:15:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (819, 'Cliente819', 'cliente819@test.com', '10000819-4', '2025-06-07', '18:50:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (820, 'Cliente820', 'cliente820@test.com', '10000820-4', '2025-04-11', '10:32:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (821, 'Cliente821', 'cliente821@test.com', '10000821-4', '2025-06-11', '09:20:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (822, 'Cliente822', 'cliente822@test.com', '10000822-2', '2025-04-17', '16:19:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (823, 'Cliente823', 'cliente823@test.com', '10000823-0', '2025-06-25', '16:36:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (824, 'Cliente824', 'cliente824@test.com', '10000824-8', '2025-02-06', '12:44:00', 6, 45, 6750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (825, 'Cliente825', 'cliente825@test.com', '10000825-4', '2025-03-08', '14:56:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (826, 'Cliente826', 'cliente826@test.com', '10000826-4', '2025-02-26', '15:17:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (827, 'Cliente827', 'cliente827@test.com', '10000827-3', '2025-05-22', '18:20:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (828, 'Cliente828', 'cliente828@test.com', '10000828-3', '2025-03-16', '13:00:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (829, 'Cliente829', 'cliente829@test.com', '10000829-0', '2025-06-12', '08:43:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (830, 'Cliente830', 'cliente830@test.com', '10000830-0', '2025-02-17', '13:51:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (831, 'Cliente831', 'cliente831@test.com', '10000831-7', '2025-06-07', '11:57:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (832, 'Cliente832', 'cliente832@test.com', '10000832-2', '2025-02-08', '12:33:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (833, 'Cliente833', 'cliente833@test.com', '10000833-2', '2025-06-12', '12:16:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (834, 'Cliente834', 'cliente834@test.com', '10000834-0', '2025-06-07', '14:56:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (835, 'Cliente835', 'cliente835@test.com', '10000835-2', '2025-05-24', '11:43:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (836, 'Cliente836', 'cliente836@test.com', '10000836-4', '2025-02-28', '19:19:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (837, 'Cliente837', 'cliente837@test.com', '10000837-3', '2025-05-02', '09:18:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (838, 'Cliente838', 'cliente838@test.com', '10000838-0', '2025-06-30', '08:10:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (839, 'Cliente839', 'cliente839@test.com', '10000839-7', '2025-04-12', '13:23:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (840, 'Cliente840', 'cliente840@test.com', '10000840-7', '2025-05-05', '19:36:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (841, 'Cliente841', 'cliente841@test.com', '10000841-8', '2025-01-28', '16:24:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (842, 'Cliente842', 'cliente842@test.com', '10000842-8', '2025-02-28', '17:47:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (843, 'Cliente843', 'cliente843@test.com', '10000843-3', '2025-03-21', '16:02:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (844, 'Cliente844', 'cliente844@test.com', '10000844-3', '2025-07-04', '14:47:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (845, 'Cliente845', 'cliente845@test.com', '10000845-6', '2025-06-13', '09:29:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (846, 'Cliente846', 'cliente846@test.com', '10000846-4', '2025-04-15', '17:25:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (847, 'Cliente847', 'cliente847@test.com', '10000847-2', '2025-03-02', '10:10:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (848, 'Cliente848', 'cliente848@test.com', '10000848-6', '2025-04-30', '12:46:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (849, 'Cliente849', 'cliente849@test.com', '10000849-0', '2025-02-04', '15:01:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (850, 'Cliente850', 'cliente850@test.com', '10000850-4', '2025-01-23', '13:42:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (851, 'Cliente851', 'cliente851@test.com', '10000851-8', '2025-03-27', '08:51:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (852, 'Cliente852', 'cliente852@test.com', '10000852-5', '2025-06-16', '11:04:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (853, 'Cliente853', 'cliente853@test.com', '10000853-8', '2025-01-23', '10:18:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (854, 'Cliente854', 'cliente854@test.com', '10000854-0', '2025-06-18', '08:18:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (855, 'Cliente855', 'cliente855@test.com', '10000855-8', '2025-02-10', '12:24:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (856, 'Cliente856', 'cliente856@test.com', '10000856-6', '2025-05-31', '18:21:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (857, 'Cliente857', 'cliente857@test.com', '10000857-6', '2025-05-18', '16:00:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (858, 'Cliente858', 'cliente858@test.com', '10000858-3', '2025-02-19', '08:15:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (859, 'Cliente859', 'cliente859@test.com', '10000859-2', '2025-02-06', '13:45:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (860, 'Cliente860', 'cliente860@test.com', '10000860-2', '2025-03-16', '08:31:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (861, 'Cliente861', 'cliente861@test.com', '10000861-6', '2025-06-06', '13:07:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (862, 'Cliente862', 'cliente862@test.com', '10000862-6', '2025-05-04', '09:25:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (863, 'Cliente863', 'cliente863@test.com', '10000863-8', '2025-02-19', '17:03:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (864, 'Cliente864', 'cliente864@test.com', '10000864-8', '2025-04-10', '16:22:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (865, 'Cliente865', 'cliente865@test.com', '10000865-4', '2025-03-19', '19:20:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (866, 'Cliente866', 'cliente866@test.com', '10000866-8', '2025-01-24', '09:30:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (867, 'Cliente867', 'cliente867@test.com', '10000867-1', '2025-01-26', '14:58:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (868, 'Cliente868', 'cliente868@test.com', '10000868-1', '2025-04-13', '14:58:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (869, 'Cliente869', 'cliente869@test.com', '10000869-2', '2025-06-26', '18:13:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (870, 'Cliente870', 'cliente870@test.com', '10000870-4', '2025-05-05', '10:40:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (871, 'Cliente871', 'cliente871@test.com', '10000871-1', '2025-06-15', '14:56:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (872, 'Cliente872', 'cliente872@test.com', '10000872-3', '2025-06-01', '19:40:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (873, 'Cliente873', 'cliente873@test.com', '10000873-6', '2025-04-18', '13:44:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (874, 'Cliente874', 'cliente874@test.com', '10000874-3', '2025-04-05', '13:07:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (875, 'Cliente875', 'cliente875@test.com', '10000875-5', '2025-05-03', '17:50:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (876, 'Cliente876', 'cliente876@test.com', '10000876-5', '2025-02-15', '16:37:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (877, 'Cliente877', 'cliente877@test.com', '10000877-8', '2025-05-21', '16:24:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (878, 'Cliente878', 'cliente878@test.com', '10000878-2', '2025-07-02', '10:52:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (879, 'Cliente879', 'cliente879@test.com', '10000879-4', '2025-02-11', '09:18:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (880, 'Cliente880', 'cliente880@test.com', '10000880-1', '2025-02-27', '13:14:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (881, 'Cliente881', 'cliente881@test.com', '10000881-6', '2025-03-24', '18:26:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (882, 'Cliente882', 'cliente882@test.com', '10000882-5', '2025-06-27', '16:28:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (883, 'Cliente883', 'cliente883@test.com', '10000883-8', '2025-04-16', '18:12:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (884, 'Cliente884', 'cliente884@test.com', '10000884-4', '2025-05-16', '08:56:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (885, 'Cliente885', 'cliente885@test.com', '10000885-1', '2025-05-01', '16:08:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (886, 'Cliente886', 'cliente886@test.com', '10000886-1', '2025-05-12', '13:53:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (887, 'Cliente887', 'cliente887@test.com', '10000887-3', '2025-01-21', '19:20:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (888, 'Cliente888', 'cliente888@test.com', '10000888-8', '2025-06-17', '12:15:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (889, 'Cliente889', 'cliente889@test.com', '10000889-0', '2025-05-02', '14:36:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (890, 'Cliente890', 'cliente890@test.com', '10000890-4', '2025-03-18', '11:42:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (891, 'Cliente891', 'cliente891@test.com', '10000891-6', '2025-01-27', '15:06:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (892, 'Cliente892', 'cliente892@test.com', '10000892-7', '2025-06-19', '15:07:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (893, 'Cliente893', 'cliente893@test.com', '10000893-7', '2025-06-13', '12:27:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (894, 'Cliente894', 'cliente894@test.com', '10000894-5', '2025-04-06', '14:29:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (895, 'Cliente895', 'cliente895@test.com', '10000895-8', '2025-03-09', '18:11:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (896, 'Cliente896', 'cliente896@test.com', '10000896-8', '2025-04-03', '16:42:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (897, 'Cliente897', 'cliente897@test.com', '10000897-2', '2025-05-12', '14:00:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (898, 'Cliente898', 'cliente898@test.com', '10000898-0', '2025-05-06', '19:51:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (899, 'Cliente899', 'cliente899@test.com', '10000899-5', '2025-02-28', '10:31:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (900, 'Cliente900', 'cliente900@test.com', '10000900-1', '2025-06-04', '18:03:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (901, 'Cliente901', 'cliente901@test.com', '10000901-5', '2025-05-07', '19:10:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (902, 'Cliente902', 'cliente902@test.com', '10000902-2', '2025-02-10', '13:23:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (903, 'Cliente903', 'cliente903@test.com', '10000903-6', '2025-06-19', '17:23:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (904, 'Cliente904', 'cliente904@test.com', '10000904-1', '2025-04-09', '12:04:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (905, 'Cliente905', 'cliente905@test.com', '10000905-3', '2025-06-30', '09:32:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (906, 'Cliente906', 'cliente906@test.com', '10000906-4', '2025-01-31', '19:56:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (907, 'Cliente907', 'cliente907@test.com', '10000907-1', '2025-01-28', '18:26:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (908, 'Cliente908', 'cliente908@test.com', '10000908-8', '2025-04-10', '17:43:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (909, 'Cliente909', 'cliente909@test.com', '10000909-4', '2025-03-31', '10:04:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (910, 'Cliente910', 'cliente910@test.com', '10000910-5', '2025-06-12', '16:53:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (911, 'Cliente911', 'cliente911@test.com', '10000911-3', '2025-06-10', '15:14:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (912, 'Cliente912', 'cliente912@test.com', '10000912-4', '2025-01-26', '12:46:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (913, 'Cliente913', 'cliente913@test.com', '10000913-8', '2025-05-11', '09:20:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (914, 'Cliente914', 'cliente914@test.com', '10000914-5', '2025-06-25', '16:49:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (915, 'Cliente915', 'cliente915@test.com', '10000915-2', '2025-04-19', '17:19:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (916, 'Cliente916', 'cliente916@test.com', '10000916-6', '2025-05-24', '16:13:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (917, 'Cliente917', 'cliente917@test.com', '10000917-4', '2025-04-20', '12:39:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (918, 'Cliente918', 'cliente918@test.com', '10000918-4', '2025-06-11', '14:24:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (919, 'Cliente919', 'cliente919@test.com', '10000919-0', '2025-04-08', '10:12:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (920, 'Cliente920', 'cliente920@test.com', '10000920-3', '2025-02-25', '16:36:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (921, 'Cliente921', 'cliente921@test.com', '10000921-3', '2025-06-26', '16:21:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (922, 'Cliente922', 'cliente922@test.com', '10000922-3', '2025-05-22', '09:48:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (923, 'Cliente923', 'cliente923@test.com', '10000923-6', '2025-03-29', '09:24:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (924, 'Cliente924', 'cliente924@test.com', '10000924-4', '2025-06-15', '14:35:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (925, 'Cliente925', 'cliente925@test.com', '10000925-7', '2025-06-05', '14:57:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (926, 'Cliente926', 'cliente926@test.com', '10000926-3', '2025-05-09', '10:41:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (927, 'Cliente927', 'cliente927@test.com', '10000927-0', '2025-05-01', '12:20:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (928, 'Cliente928', 'cliente928@test.com', '10000928-6', '2025-05-17', '09:14:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (929, 'Cliente929', 'cliente929@test.com', '10000929-0', '2025-02-02', '11:04:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (930, 'Cliente930', 'cliente930@test.com', '10000930-4', '2025-02-17', '16:41:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (931, 'Cliente931', 'cliente931@test.com', '10000931-7', '2025-04-26', '15:46:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (932, 'Cliente932', 'cliente932@test.com', '10000932-5', '2025-06-25', '12:42:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (933, 'Cliente933', 'cliente933@test.com', '10000933-3', '2025-06-03', '11:37:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (934, 'Cliente934', 'cliente934@test.com', '10000934-1', '2025-06-17', '15:12:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (935, 'Cliente935', 'cliente935@test.com', '10000935-8', '2025-03-28', '18:40:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (936, 'Cliente936', 'cliente936@test.com', '10000936-1', '2025-06-26', '18:24:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (937, 'Cliente937', 'cliente937@test.com', '10000937-4', '2025-01-31', '18:26:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (938, 'Cliente938', 'cliente938@test.com', '10000938-1', '2025-05-24', '11:19:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (939, 'Cliente939', 'cliente939@test.com', '10000939-2', '2025-06-24', '11:42:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (940, 'Cliente940', 'cliente940@test.com', '10000940-5', '2025-06-23', '11:15:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (941, 'Cliente941', 'cliente941@test.com', '10000941-4', '2025-05-20', '14:12:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (942, 'Cliente942', 'cliente942@test.com', '10000942-4', '2025-03-01', '14:52:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (943, 'Cliente943', 'cliente943@test.com', '10000943-5', '2025-04-02', '16:39:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (944, 'Cliente944', 'cliente944@test.com', '10000944-8', '2025-04-08', '10:48:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (945, 'Cliente945', 'cliente945@test.com', '10000945-8', '2025-07-04', '19:22:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (946, 'Cliente946', 'cliente946@test.com', '10000946-6', '2025-03-02', '18:16:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (947, 'Cliente947', 'cliente947@test.com', '10000947-6', '2025-02-09', '13:14:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (948, 'Cliente948', 'cliente948@test.com', '10000948-5', '2025-01-21', '19:13:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (949, 'Cliente949', 'cliente949@test.com', '10000949-1', '2025-02-23', '18:17:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (950, 'Cliente950', 'cliente950@test.com', '10000950-5', '2025-05-30', '09:22:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (951, 'Cliente951', 'cliente951@test.com', '10000951-4', '2025-04-29', '10:14:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (952, 'Cliente952', 'cliente952@test.com', '10000952-4', '2025-05-18', '10:27:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (953, 'Cliente953', 'cliente953@test.com', '10000953-3', '2025-05-09', '11:18:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (954, 'Cliente954', 'cliente954@test.com', '10000954-7', '2025-01-31', '11:04:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (955, 'Cliente955', 'cliente955@test.com', '10000955-0', '2025-02-02', '11:50:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (956, 'Cliente956', 'cliente956@test.com', '10000956-7', '2025-04-05', '16:50:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (957, 'Cliente957', 'cliente957@test.com', '10000957-4', '2025-05-20', '19:19:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (958, 'Cliente958', 'cliente958@test.com', '10000958-1', '2025-05-05', '15:46:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (959, 'Cliente959', 'cliente959@test.com', '10000959-3', '2025-06-20', '18:25:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (960, 'Cliente960', 'cliente960@test.com', '10000960-7', '2025-03-16', '11:28:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (961, 'Cliente961', 'cliente961@test.com', '10000961-8', '2025-02-28', '16:12:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (962, 'Cliente962', 'cliente962@test.com', '10000962-4', '2025-06-10', '18:21:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (963, 'Cliente963', 'cliente963@test.com', '10000963-7', '2025-06-19', '14:18:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (964, 'Cliente964', 'cliente964@test.com', '10000964-5', '2025-06-28', '12:23:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (965, 'Cliente965', 'cliente965@test.com', '10000965-7', '2025-05-26', '10:50:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (966, 'Cliente966', 'cliente966@test.com', '10000966-2', '2025-03-20', '11:15:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (967, 'Cliente967', 'cliente967@test.com', '10000967-2', '2025-02-04', '14:16:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (968, 'Cliente968', 'cliente968@test.com', '10000968-6', '2025-04-14', '13:41:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (969, 'Cliente969', 'cliente969@test.com', '10000969-5', '2025-06-09', '13:35:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (970, 'Cliente970', 'cliente970@test.com', '10000970-8', '2025-01-20', '10:18:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (971, 'Cliente971', 'cliente971@test.com', '10000971-3', '2025-05-14', '16:43:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (972, 'Cliente972', 'cliente972@test.com', '10000972-3', '2025-01-25', '12:56:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (973, 'Cliente973', 'cliente973@test.com', '10000973-2', '2025-02-11', '11:05:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (974, 'Cliente974', 'cliente974@test.com', '10000974-6', '2025-03-26', '17:40:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (975, 'Cliente975', 'cliente975@test.com', '10000975-6', '2025-05-23', '18:06:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (976, 'Cliente976', 'cliente976@test.com', '10000976-0', '2025-07-02', '12:16:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (977, 'Cliente977', 'cliente977@test.com', '10000977-3', '2025-05-06', '15:05:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (978, 'Cliente978', 'cliente978@test.com', '10000978-3', '2025-06-04', '14:58:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (979, 'Cliente979', 'cliente979@test.com', '10000979-6', '2025-05-23', '17:36:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (980, 'Cliente980', 'cliente980@test.com', '10000980-0', '2025-03-18', '12:44:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (981, 'Cliente981', 'cliente981@test.com', '10000981-6', '2025-03-23', '17:12:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (982, 'Cliente982', 'cliente982@test.com', '10000982-6', '2025-03-14', '13:51:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (983, 'Cliente983', 'cliente983@test.com', '10000983-6', '2025-03-17', '12:37:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (984, 'Cliente984', 'cliente984@test.com', '10000984-2', '2025-06-04', '15:34:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (985, 'Cliente985', 'cliente985@test.com', '10000985-2', '2025-04-11', '10:02:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (986, 'Cliente986', 'cliente986@test.com', '10000986-4', '2025-02-24', '16:56:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (987, 'Cliente987', 'cliente987@test.com', '10000987-1', '2025-05-24', '16:17:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (988, 'Cliente988', 'cliente988@test.com', '10000988-7', '2025-05-15', '16:56:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (989, 'Cliente989', 'cliente989@test.com', '10000989-3', '2025-03-30', '18:55:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (990, 'Cliente990', 'cliente990@test.com', '10000990-3', '2025-01-25', '18:44:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (991, 'Cliente991', 'cliente991@test.com', '10000991-8', '2025-06-07', '18:05:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (992, 'Cliente992', 'cliente992@test.com', '10000992-0', '2025-06-17', '17:54:00', 3, 60, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (993, 'Cliente993', 'cliente993@test.com', '10000993-0', '2025-04-04', '10:18:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (994, 'Cliente994', 'cliente994@test.com', '10000994-5', '2025-03-16', '16:04:00', 4, 15, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (995, 'Cliente995', 'cliente995@test.com', '10000995-1', '2025-05-20', '18:38:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (996, 'Cliente996', 'cliente996@test.com', '10000996-3', '2025-05-10', '15:01:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (997, 'Cliente997', 'cliente997@test.com', '10000997-6', '2025-02-17', '12:39:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (998, 'Cliente998', 'cliente998@test.com', '10000998-5', '2025-04-15', '17:29:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (999, 'Cliente999', 'cliente999@test.com', '10000999-7', '2025-01-25', '12:28:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1000, 'Cliente1000', 'cliente1000@test.com', '10001000-1', '2025-06-13', '11:52:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1001, 'Cliente1001', 'cliente1001@test.com', '10001001-3', '2025-04-02', '11:39:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1002, 'Cliente1002', 'cliente1002@test.com', '10001002-7', '2025-07-01', '14:02:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1003, 'Cliente1003', 'cliente1003@test.com', '10001003-8', '2025-04-11', '13:31:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1004, 'Cliente1004', 'cliente1004@test.com', '10001004-1', '2025-04-08', '17:52:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1005, 'Cliente1005', 'cliente1005@test.com', '10001005-7', '2025-06-16', '10:12:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1006, 'Cliente1006', 'cliente1006@test.com', '10001006-0', '2025-06-20', '19:19:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1007, 'Cliente1007', 'cliente1007@test.com', '10001007-1', '2025-04-07', '16:42:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1008, 'Cliente1008', 'cliente1008@test.com', '10001008-1', '2025-04-13', '17:27:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1009, 'Cliente1009', 'cliente1009@test.com', '10001009-8', '2025-03-02', '13:54:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1010, 'Cliente1010', 'cliente1010@test.com', '10001010-1', '2025-05-05', '16:51:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1011, 'Cliente1011', 'cliente1011@test.com', '10001011-8', '2025-02-15', '14:29:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1012, 'Cliente1012', 'cliente1012@test.com', '10001012-1', '2025-01-23', '10:04:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1013, 'Cliente1013', 'cliente1013@test.com', '10001013-6', '2025-02-15', '11:48:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1014, 'Cliente1014', 'cliente1014@test.com', '10001014-0', '2025-04-06', '09:09:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1015, 'Cliente1015', 'cliente1015@test.com', '10001015-0', '2025-02-18', '18:22:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1016, 'Cliente1016', 'cliente1016@test.com', '10001016-8', '2025-04-18', '19:18:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1017, 'Cliente1017', 'cliente1017@test.com', '10001017-4', '2025-02-17', '14:18:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1018, 'Cliente1018', 'cliente1018@test.com', '10001018-8', '2025-01-24', '15:20:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1019, 'Cliente1019', 'cliente1019@test.com', '10001019-7', '2025-05-28', '09:54:00', 1, 15, 375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1020, 'Cliente1020', 'cliente1020@test.com', '10001020-6', '2025-03-05', '18:39:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1021, 'Cliente1021', 'cliente1021@test.com', '10001021-6', '2025-01-23', '16:16:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1022, 'Cliente1022', 'cliente1022@test.com', '10001022-4', '2025-05-17', '11:47:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1023, 'Cliente1023', 'cliente1023@test.com', '10001023-1', '2025-01-29', '15:39:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1024, 'Cliente1024', 'cliente1024@test.com', '10001024-4', '2025-06-13', '18:15:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1025, 'Cliente1025', 'cliente1025@test.com', '10001025-5', '2025-06-06', '16:54:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1026, 'Cliente1026', 'cliente1026@test.com', '10001026-0', '2025-06-30', '17:28:00', 4, 15, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1027, 'Cliente1027', 'cliente1027@test.com', '10001027-0', '2025-02-15', '11:45:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1028, 'Cliente1028', 'cliente1028@test.com', '10001028-4', '2025-04-30', '09:34:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1029, 'Cliente1029', 'cliente1029@test.com', '10001029-8', '2025-01-21', '12:55:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1030, 'Cliente1030', 'cliente1030@test.com', '10001030-8', '2025-05-30', '15:14:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1031, 'Cliente1031', 'cliente1031@test.com', '10001031-6', '2025-02-18', '08:23:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1032, 'Cliente1032', 'cliente1032@test.com', '10001032-3', '2025-02-21', '14:14:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1033, 'Cliente1033', 'cliente1033@test.com', '10001033-2', '2025-04-25', '18:39:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1034, 'Cliente1034', 'cliente1034@test.com', '10001034-5', '2025-04-11', '08:57:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1035, 'Cliente1035', 'cliente1035@test.com', '10001035-6', '2025-06-03', '15:49:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1036, 'Cliente1036', 'cliente1036@test.com', '10001036-6', '2025-03-15', '15:22:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1037, 'Cliente1037', 'cliente1037@test.com', '10001037-3', '2025-03-02', '10:09:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1038, 'Cliente1038', 'cliente1038@test.com', '10001038-7', '2025-05-08', '16:53:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1039, 'Cliente1039', 'cliente1039@test.com', '10001039-7', '2025-05-06', '09:24:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1040, 'Cliente1040', 'cliente1040@test.com', '10001040-6', '2025-05-03', '15:33:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1041, 'Cliente1041', 'cliente1041@test.com', '10001041-1', '2025-04-06', '15:46:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1042, 'Cliente1042', 'cliente1042@test.com', '10001042-4', '2025-06-22', '15:41:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1043, 'Cliente1043', 'cliente1043@test.com', '10001043-6', '2025-03-01', '11:02:00', 2, 30, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1044, 'Cliente1044', 'cliente1044@test.com', '10001044-6', '2025-07-05', '09:13:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1045, 'Cliente1045', 'cliente1045@test.com', '10001045-4', '2025-04-14', '17:09:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1046, 'Cliente1046', 'cliente1046@test.com', '10001046-1', '2025-03-20', '11:41:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1047, 'Cliente1047', 'cliente1047@test.com', '10001047-5', '2025-05-27', '12:36:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1048, 'Cliente1048', 'cliente1048@test.com', '10001048-2', '2025-04-24', '19:00:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1049, 'Cliente1049', 'cliente1049@test.com', '10001049-3', '2025-06-18', '19:42:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1050, 'Cliente1050', 'cliente1050@test.com', '10001050-0', '2025-01-24', '12:02:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1051, 'Cliente1051', 'cliente1051@test.com', '10001051-4', '2025-06-13', '18:58:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1052, 'Cliente1052', 'cliente1052@test.com', '10001052-8', '2025-03-08', '09:55:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1053, 'Cliente1053', 'cliente1053@test.com', '10001053-1', '2025-01-21', '11:46:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1054, 'Cliente1054', 'cliente1054@test.com', '10001054-1', '2025-04-06', '13:50:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1055, 'Cliente1055', 'cliente1055@test.com', '10001055-4', '2025-05-03', '17:30:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1056, 'Cliente1056', 'cliente1056@test.com', '10001056-5', '2025-06-18', '13:32:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1057, 'Cliente1057', 'cliente1057@test.com', '10001057-5', '2025-03-09', '13:32:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1058, 'Cliente1058', 'cliente1058@test.com', '10001058-5', '2025-05-17', '08:41:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1059, 'Cliente1059', 'cliente1059@test.com', '10001059-7', '2025-04-10', '11:33:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1060, 'Cliente1060', 'cliente1060@test.com', '10001060-5', '2025-05-19', '13:16:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1061, 'Cliente1061', 'cliente1061@test.com', '10001061-1', '2025-02-16', '19:58:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1062, 'Cliente1062', 'cliente1062@test.com', '10001062-7', '2025-02-02', '09:43:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1063, 'Cliente1063', 'cliente1063@test.com', '10001063-0', '2025-06-21', '11:33:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1064, 'Cliente1064', 'cliente1064@test.com', '10001064-2', '2025-03-12', '19:18:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1065, 'Cliente1065', 'cliente1065@test.com', '10001065-8', '2025-03-18', '11:57:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1066, 'Cliente1066', 'cliente1066@test.com', '10001066-0', '2025-05-15', '11:24:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1067, 'Cliente1067', 'cliente1067@test.com', '10001067-0', '2025-06-24', '14:34:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1068, 'Cliente1068', 'cliente1068@test.com', '10001068-6', '2025-03-17', '09:54:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1069, 'Cliente1069', 'cliente1069@test.com', '10001069-0', '2025-06-29', '08:49:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1070, 'Cliente1070', 'cliente1070@test.com', '10001070-0', '2025-07-04', '15:55:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1071, 'Cliente1071', 'cliente1071@test.com', '10001071-5', '2025-05-26', '14:12:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1072, 'Cliente1072', 'cliente1072@test.com', '10001072-8', '2025-05-06', '08:04:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1073, 'Cliente1073', 'cliente1073@test.com', '10001073-7', '2025-03-21', '15:42:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1074, 'Cliente1074', 'cliente1074@test.com', '10001074-3', '2025-02-03', '11:24:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1075, 'Cliente1075', 'cliente1075@test.com', '10001075-7', '2025-06-05', '08:43:00', 6, 45, 6750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1076, 'Cliente1076', 'cliente1076@test.com', '10001076-0', '2025-05-19', '15:24:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1077, 'Cliente1077', 'cliente1077@test.com', '10001077-3', '2025-02-09', '15:39:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1078, 'Cliente1078', 'cliente1078@test.com', '10001078-1', '2025-04-28', '11:06:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1079, 'Cliente1079', 'cliente1079@test.com', '10001079-3', '2025-04-22', '14:14:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1080, 'Cliente1080', 'cliente1080@test.com', '10001080-2', '2025-04-12', '18:06:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1081, 'Cliente1081', 'cliente1081@test.com', '10001081-1', '2025-05-12', '14:24:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1082, 'Cliente1082', 'cliente1082@test.com', '10001082-3', '2025-05-26', '17:58:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1083, 'Cliente1083', 'cliente1083@test.com', '10001083-6', '2025-06-07', '09:32:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1084, 'Cliente1084', 'cliente1084@test.com', '10001084-2', '2025-05-30', '16:52:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1085, 'Cliente1085', 'cliente1085@test.com', '10001085-2', '2025-01-30', '09:54:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1086, 'Cliente1086', 'cliente1086@test.com', '10001086-3', '2025-02-23', '09:35:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1087, 'Cliente1087', 'cliente1087@test.com', '10001087-0', '2025-06-21', '08:34:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1088, 'Cliente1088', 'cliente1088@test.com', '10001088-5', '2025-04-23', '12:21:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1089, 'Cliente1089', 'cliente1089@test.com', '10001089-6', '2025-06-26', '08:11:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1090, 'Cliente1090', 'cliente1090@test.com', '10001090-4', '2025-06-09', '11:19:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1091, 'Cliente1091', 'cliente1091@test.com', '10001091-1', '2025-06-10', '10:12:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1092, 'Cliente1092', 'cliente1092@test.com', '10001092-3', '2025-04-27', '19:33:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1093, 'Cliente1093', 'cliente1093@test.com', '10001093-3', '2025-03-30', '16:30:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1094, 'Cliente1094', 'cliente1094@test.com', '10001094-3', '2025-01-20', '08:02:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1095, 'Cliente1095', 'cliente1095@test.com', '10001095-0', '2025-03-20', '08:48:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1096, 'Cliente1096', 'cliente1096@test.com', '10001096-0', '2025-05-30', '12:26:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1097, 'Cliente1097', 'cliente1097@test.com', '10001097-5', '2025-05-24', '09:26:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1098, 'Cliente1098', 'cliente1098@test.com', '10001098-7', '2025-05-13', '14:47:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1099, 'Cliente1099', 'cliente1099@test.com', '10001099-5', '2025-04-19', '09:24:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1100, 'Cliente1100', 'cliente1100@test.com', '10001100-7', '2025-03-25', '08:31:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1101, 'Cliente1101', 'cliente1101@test.com', '10001101-6', '2025-03-01', '11:02:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1102, 'Cliente1102', 'cliente1102@test.com', '10001102-2', '2025-02-14', '16:05:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1103, 'Cliente1103', 'cliente1103@test.com', '10001103-0', '2025-03-03', '15:10:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1104, 'Cliente1104', 'cliente1104@test.com', '10001104-2', '2025-04-20', '15:28:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1105, 'Cliente1105', 'cliente1105@test.com', '10001105-1', '2025-03-05', '11:31:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1106, 'Cliente1106', 'cliente1106@test.com', '10001106-4', '2025-02-09', '17:49:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1107, 'Cliente1107', 'cliente1107@test.com', '10001107-8', '2025-04-15', '15:43:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1108, 'Cliente1108', 'cliente1108@test.com', '10001108-0', '2025-02-10', '14:34:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1109, 'Cliente1109', 'cliente1109@test.com', '10001109-8', '2025-05-29', '16:03:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1110, 'Cliente1110', 'cliente1110@test.com', '10001110-0', '2025-03-16', '17:47:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1111, 'Cliente1111', 'cliente1111@test.com', '10001111-7', '2025-05-24', '09:23:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1112, 'Cliente1112', 'cliente1112@test.com', '10001112-4', '2025-02-23', '19:08:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1113, 'Cliente1113', 'cliente1113@test.com', '10001113-7', '2025-05-20', '13:09:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1114, 'Cliente1114', 'cliente1114@test.com', '10001114-8', '2025-01-31', '19:09:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1115, 'Cliente1115', 'cliente1115@test.com', '10001115-3', '2025-05-19', '11:14:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1116, 'Cliente1116', 'cliente1116@test.com', '10001116-4', '2025-05-12', '10:57:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1117, 'Cliente1117', 'cliente1117@test.com', '10001117-1', '2025-06-25', '09:09:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1118, 'Cliente1118', 'cliente1118@test.com', '10001118-5', '2025-06-09', '16:31:00', 5, 30, 3750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1119, 'Cliente1119', 'cliente1119@test.com', '10001119-1', '2025-01-28', '11:57:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1120, 'Cliente1120', 'cliente1120@test.com', '10001120-4', '2025-01-29', '09:08:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1121, 'Cliente1121', 'cliente1121@test.com', '10001121-6', '2025-06-24', '17:31:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1122, 'Cliente1122', 'cliente1122@test.com', '10001122-3', '2025-03-24', '09:48:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1123, 'Cliente1123', 'cliente1123@test.com', '10001123-3', '2025-06-04', '09:40:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1124, 'Cliente1124', 'cliente1124@test.com', '10001124-8', '2025-03-16', '13:03:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1125, 'Cliente1125', 'cliente1125@test.com', '10001125-1', '2025-05-01', '09:13:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1126, 'Cliente1126', 'cliente1126@test.com', '10001126-2', '2025-03-28', '17:09:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1127, 'Cliente1127', 'cliente1127@test.com', '10001127-4', '2025-03-01', '18:45:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1128, 'Cliente1128', 'cliente1128@test.com', '10001128-3', '2025-02-02', '19:51:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1129, 'Cliente1129', 'cliente1129@test.com', '10001129-7', '2025-05-14', '18:33:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1130, 'Cliente1130', 'cliente1130@test.com', '10001130-4', '2025-06-02', '11:33:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1131, 'Cliente1131', 'cliente1131@test.com', '10001131-0', '2025-07-01', '11:32:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1132, 'Cliente1132', 'cliente1132@test.com', '10001132-6', '2025-03-02', '14:34:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1133, 'Cliente1133', 'cliente1133@test.com', '10001133-3', '2025-01-24', '08:37:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1134, 'Cliente1134', 'cliente1134@test.com', '10001134-1', '2025-06-10', '14:26:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1135, 'Cliente1135', 'cliente1135@test.com', '10001135-1', '2025-03-12', '17:45:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1136, 'Cliente1136', 'cliente1136@test.com', '10001136-2', '2025-06-24', '14:00:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1137, 'Cliente1137', 'cliente1137@test.com', '10001137-1', '2025-04-15', '10:56:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1138, 'Cliente1138', 'cliente1138@test.com', '10001138-8', '2025-01-20', '08:29:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1139, 'Cliente1139', 'cliente1139@test.com', '10001139-3', '2025-06-29', '11:06:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1140, 'Cliente1140', 'cliente1140@test.com', '10001140-2', '2025-03-20', '11:37:00', 5, 45, 5625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1141, 'Cliente1141', 'cliente1141@test.com', '10001141-8', '2025-02-12', '09:20:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1142, 'Cliente1142', 'cliente1142@test.com', '10001142-0', '2025-03-08', '17:40:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1143, 'Cliente1143', 'cliente1143@test.com', '10001143-5', '2025-01-31', '14:56:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1144, 'Cliente1144', 'cliente1144@test.com', '10001144-8', '2025-05-12', '12:14:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1145, 'Cliente1145', 'cliente1145@test.com', '10001145-5', '2025-06-12', '13:08:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1146, 'Cliente1146', 'cliente1146@test.com', '10001146-5', '2025-06-13', '13:58:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1147, 'Cliente1147', 'cliente1147@test.com', '10001147-1', '2025-06-22', '19:58:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1148, 'Cliente1148', 'cliente1148@test.com', '10001148-2', '2025-02-04', '10:14:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1149, 'Cliente1149', 'cliente1149@test.com', '10001149-5', '2025-02-21', '09:33:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1150, 'Cliente1150', 'cliente1150@test.com', '10001150-1', '2025-05-21', '18:51:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1151, 'Cliente1151', 'cliente1151@test.com', '10001151-8', '2025-06-26', '19:21:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1152, 'Cliente1152', 'cliente1152@test.com', '10001152-7', '2025-03-13', '18:04:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1153, 'Cliente1153', 'cliente1153@test.com', '10001153-3', '2025-06-11', '18:26:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1154, 'Cliente1154', 'cliente1154@test.com', '10001154-3', '2025-06-30', '16:44:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1155, 'Cliente1155', 'cliente1155@test.com', '10001155-0', '2025-01-22', '16:11:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1156, 'Cliente1156', 'cliente1156@test.com', '10001156-6', '2025-05-04', '17:29:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1157, 'Cliente1157', 'cliente1157@test.com', '10001157-0', '2025-03-06', '09:26:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1158, 'Cliente1158', 'cliente1158@test.com', '10001158-0', '2025-01-27', '08:43:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1159, 'Cliente1159', 'cliente1159@test.com', '10001159-6', '2025-04-20', '13:40:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1160, 'Cliente1160', 'cliente1160@test.com', '10001160-7', '2025-05-07', '08:23:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1161, 'Cliente1161', 'cliente1161@test.com', '10001161-2', '2025-03-01', '15:32:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1162, 'Cliente1162', 'cliente1162@test.com', '10001162-3', '2025-02-06', '10:47:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1163, 'Cliente1163', 'cliente1163@test.com', '10001163-5', '2025-05-21', '11:19:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1164, 'Cliente1164', 'cliente1164@test.com', '10001164-3', '2025-01-26', '08:46:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1165, 'Cliente1165', 'cliente1165@test.com', '10001165-4', '2025-06-19', '17:19:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1166, 'Cliente1166', 'cliente1166@test.com', '10001166-3', '2025-06-02', '09:19:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1167, 'Cliente1167', 'cliente1167@test.com', '10001167-7', '2025-02-27', '10:17:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1168, 'Cliente1168', 'cliente1168@test.com', '10001168-5', '2025-05-20', '17:56:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1169, 'Cliente1169', 'cliente1169@test.com', '10001169-3', '2025-03-27', '19:14:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1170, 'Cliente1170', 'cliente1170@test.com', '10001170-7', '2025-05-04', '15:52:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1171, 'Cliente1171', 'cliente1171@test.com', '10001171-8', '2025-01-29', '13:17:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1172, 'Cliente1172', 'cliente1172@test.com', '10001172-4', '2025-05-09', '15:13:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1173, 'Cliente1173', 'cliente1173@test.com', '10001173-5', '2025-03-26', '16:37:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1174, 'Cliente1174', 'cliente1174@test.com', '10001174-3', '2025-04-03', '09:51:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1175, 'Cliente1175', 'cliente1175@test.com', '10001175-8', '2025-06-07', '08:15:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1176, 'Cliente1176', 'cliente1176@test.com', '10001176-6', '2025-03-08', '09:05:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1177, 'Cliente1177', 'cliente1177@test.com', '10001177-0', '2025-02-09', '15:31:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1178, 'Cliente1178', 'cliente1178@test.com', '10001178-3', '2025-03-21', '13:19:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1179, 'Cliente1179', 'cliente1179@test.com', '10001179-6', '2025-03-18', '17:42:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1180, 'Cliente1180', 'cliente1180@test.com', '10001180-1', '2025-05-16', '17:55:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1181, 'Cliente1181', 'cliente1181@test.com', '10001181-7', '2025-06-10', '11:44:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1182, 'Cliente1182', 'cliente1182@test.com', '10001182-3', '2025-02-28', '11:17:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1183, 'Cliente1183', 'cliente1183@test.com', '10001183-3', '2025-02-14', '15:55:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1184, 'Cliente1184', 'cliente1184@test.com', '10001184-6', '2025-05-12', '11:50:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1185, 'Cliente1185', 'cliente1185@test.com', '10001185-8', '2025-03-01', '18:07:00', 1, 45, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1186, 'Cliente1186', 'cliente1186@test.com', '10001186-1', '2025-04-25', '16:13:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1187, 'Cliente1187', 'cliente1187@test.com', '10001187-8', '2025-04-30', '10:14:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1188, 'Cliente1188', 'cliente1188@test.com', '10001188-0', '2025-06-10', '18:27:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1189, 'Cliente1189', 'cliente1189@test.com', '10001189-6', '2025-06-16', '18:21:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1190, 'Cliente1190', 'cliente1190@test.com', '10001190-5', '2025-03-30', '10:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1191, 'Cliente1191', 'cliente1191@test.com', '10001191-7', '2025-02-03', '09:45:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1192, 'Cliente1192', 'cliente1192@test.com', '10001192-6', '2025-05-08', '15:46:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1193, 'Cliente1193', 'cliente1193@test.com', '10001193-5', '2025-02-10', '08:57:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1194, 'Cliente1194', 'cliente1194@test.com', '10001194-0', '2025-03-10', '09:20:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1195, 'Cliente1195', 'cliente1195@test.com', '10001195-3', '2025-01-28', '13:35:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1196, 'Cliente1196', 'cliente1196@test.com', '10001196-8', '2025-04-16', '09:06:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1197, 'Cliente1197', 'cliente1197@test.com', '10001197-7', '2025-04-12', '08:07:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1198, 'Cliente1198', 'cliente1198@test.com', '10001198-3', '2025-05-22', '15:51:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1199, 'Cliente1199', 'cliente1199@test.com', '10001199-2', '2025-06-02', '15:17:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1200, 'Cliente1200', 'cliente1200@test.com', '10001200-2', '2025-04-29', '13:31:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1201, 'Cliente1201', 'cliente1201@test.com', '10001201-3', '2025-02-01', '15:54:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1202, 'Cliente1202', 'cliente1202@test.com', '10001202-5', '2025-03-07', '10:52:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1203, 'Cliente1203', 'cliente1203@test.com', '10001203-8', '2025-04-30', '10:01:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1204, 'Cliente1204', 'cliente1204@test.com', '10001204-7', '2025-05-17', '16:31:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1205, 'Cliente1205', 'cliente1205@test.com', '10001205-6', '2025-05-31', '08:33:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1206, 'Cliente1206', 'cliente1206@test.com', '10001206-3', '2025-06-04', '10:17:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1207, 'Cliente1207', 'cliente1207@test.com', '10001207-6', '2025-07-02', '08:22:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1208, 'Cliente1208', 'cliente1208@test.com', '10001208-8', '2025-03-14', '19:18:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1209, 'Cliente1209', 'cliente1209@test.com', '10001209-0', '2025-05-17', '15:03:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1210, 'Cliente1210', 'cliente1210@test.com', '10001210-0', '2025-05-20', '11:28:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1211, 'Cliente1211', 'cliente1211@test.com', '10001211-7', '2025-04-09', '17:52:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1212, 'Cliente1212', 'cliente1212@test.com', '10001212-4', '2025-05-15', '08:11:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1213, 'Cliente1213', 'cliente1213@test.com', '10001213-1', '2025-07-02', '09:00:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1214, 'Cliente1214', 'cliente1214@test.com', '10001214-6', '2025-05-29', '08:47:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1215, 'Cliente1215', 'cliente1215@test.com', '10001215-1', '2025-03-18', '16:22:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1216, 'Cliente1216', 'cliente1216@test.com', '10001216-5', '2025-06-15', '16:44:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1217, 'Cliente1217', 'cliente1217@test.com', '10001217-8', '2025-01-26', '15:29:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1218, 'Cliente1218', 'cliente1218@test.com', '10001218-4', '2025-06-01', '12:54:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1219, 'Cliente1219', 'cliente1219@test.com', '10001219-2', '2025-06-27', '08:19:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1220, 'Cliente1220', 'cliente1220@test.com', '10001220-6', '2025-06-13', '12:50:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1221, 'Cliente1221', 'cliente1221@test.com', '10001221-7', '2025-06-05', '19:42:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1222, 'Cliente1222', 'cliente1222@test.com', '10001222-6', '2025-02-28', '14:00:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1223, 'Cliente1223', 'cliente1223@test.com', '10001223-7', '2025-06-24', '11:46:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1224, 'Cliente1224', 'cliente1224@test.com', '10001224-0', '2025-01-20', '10:24:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1225, 'Cliente1225', 'cliente1225@test.com', '10001225-6', '2025-02-04', '10:14:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1226, 'Cliente1226', 'cliente1226@test.com', '10001226-5', '2025-05-13', '11:43:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1227, 'Cliente1227', 'cliente1227@test.com', '10001227-3', '2025-03-13', '08:46:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1228, 'Cliente1228', 'cliente1228@test.com', '10001228-0', '2025-02-10', '19:46:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1229, 'Cliente1229', 'cliente1229@test.com', '10001229-3', '2025-01-25', '19:01:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1230, 'Cliente1230', 'cliente1230@test.com', '10001230-2', '2025-06-11', '12:02:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1231, 'Cliente1231', 'cliente1231@test.com', '10001231-7', '2025-05-05', '19:45:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1232, 'Cliente1232', 'cliente1232@test.com', '10001232-7', '2025-06-09', '12:09:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1233, 'Cliente1233', 'cliente1233@test.com', '10001233-2', '2025-05-08', '09:08:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1234, 'Cliente1234', 'cliente1234@test.com', '10001234-0', '2025-06-17', '13:38:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1235, 'Cliente1235', 'cliente1235@test.com', '10001235-4', '2025-05-31', '13:26:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1236, 'Cliente1236', 'cliente1236@test.com', '10001236-7', '2025-02-10', '12:02:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1237, 'Cliente1237', 'cliente1237@test.com', '10001237-2', '2025-06-27', '12:31:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1238, 'Cliente1238', 'cliente1238@test.com', '10001238-4', '2025-03-31', '14:00:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1239, 'Cliente1239', 'cliente1239@test.com', '10001239-0', '2025-02-24', '14:20:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1240, 'Cliente1240', 'cliente1240@test.com', '10001240-5', '2025-05-19', '09:16:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1241, 'Cliente1241', 'cliente1241@test.com', '10001241-8', '2025-05-26', '14:32:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1242, 'Cliente1242', 'cliente1242@test.com', '10001242-1', '2025-05-22', '11:44:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1243, 'Cliente1243', 'cliente1243@test.com', '10001243-6', '2025-02-19', '10:09:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1244, 'Cliente1244', 'cliente1244@test.com', '10001244-1', '2025-02-01', '11:10:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1245, 'Cliente1245', 'cliente1245@test.com', '10001245-3', '2025-06-03', '15:40:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1246, 'Cliente1246', 'cliente1246@test.com', '10001246-0', '2025-06-24', '19:16:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1247, 'Cliente1247', 'cliente1247@test.com', '10001247-2', '2025-02-18', '11:08:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1248, 'Cliente1248', 'cliente1248@test.com', '10001248-0', '2025-02-24', '19:47:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1249, 'Cliente1249', 'cliente1249@test.com', '10001249-7', '2025-01-24', '08:53:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1250, 'Cliente1250', 'cliente1250@test.com', '10001250-8', '2025-03-23', '18:13:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1251, 'Cliente1251', 'cliente1251@test.com', '10001251-2', '2025-07-01', '17:04:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1252, 'Cliente1252', 'cliente1252@test.com', '10001252-3', '2025-07-03', '18:41:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1253, 'Cliente1253', 'cliente1253@test.com', '10001253-5', '2025-02-21', '16:38:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1254, 'Cliente1254', 'cliente1254@test.com', '10001254-0', '2025-05-25', '09:08:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1255, 'Cliente1255', 'cliente1255@test.com', '10001255-3', '2025-07-02', '17:08:00', 6, 45, 6750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1256, 'Cliente1256', 'cliente1256@test.com', '10001256-4', '2025-03-06', '16:35:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1257, 'Cliente1257', 'cliente1257@test.com', '10001257-6', '2025-03-02', '11:39:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1258, 'Cliente1258', 'cliente1258@test.com', '10001258-2', '2025-06-30', '11:01:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1259, 'Cliente1259', 'cliente1259@test.com', '10001259-1', '2025-01-22', '14:55:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1260, 'Cliente1260', 'cliente1260@test.com', '10001260-4', '2025-03-30', '18:09:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1261, 'Cliente1261', 'cliente1261@test.com', '10001261-8', '2025-03-06', '10:34:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1262, 'Cliente1262', 'cliente1262@test.com', '10001262-3', '2025-06-14', '18:43:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1263, 'Cliente1263', 'cliente1263@test.com', '10001263-5', '2025-03-08', '18:55:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1264, 'Cliente1264', 'cliente1264@test.com', '10001264-3', '2025-03-01', '10:44:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1265, 'Cliente1265', 'cliente1265@test.com', '10001265-4', '2025-05-19', '14:44:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1266, 'Cliente1266', 'cliente1266@test.com', '10001266-8', '2025-01-26', '13:20:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1267, 'Cliente1267', 'cliente1267@test.com', '10001267-4', '2025-04-15', '16:08:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1268, 'Cliente1268', 'cliente1268@test.com', '10001268-3', '2025-03-13', '18:46:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1269, 'Cliente1269', 'cliente1269@test.com', '10001269-2', '2025-05-21', '15:25:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1270, 'Cliente1270', 'cliente1270@test.com', '10001270-8', '2025-06-02', '10:21:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1271, 'Cliente1271', 'cliente1271@test.com', '10001271-3', '2025-02-23', '19:57:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1272, 'Cliente1272', 'cliente1272@test.com', '10001272-4', '2025-01-31', '11:14:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1273, 'Cliente1273', 'cliente1273@test.com', '10001273-7', '2025-02-03', '19:39:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1274, 'Cliente1274', 'cliente1274@test.com', '10001274-2', '2025-03-02', '10:06:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1275, 'Cliente1275', 'cliente1275@test.com', '10001275-0', '2025-05-12', '13:47:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1276, 'Cliente1276', 'cliente1276@test.com', '10001276-2', '2025-06-04', '15:20:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1277, 'Cliente1277', 'cliente1277@test.com', '10001277-8', '2025-03-03', '12:27:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1278, 'Cliente1278', 'cliente1278@test.com', '10001278-3', '2025-05-25', '13:46:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1279, 'Cliente1279', 'cliente1279@test.com', '10001279-1', '2025-04-19', '10:12:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1280, 'Cliente1280', 'cliente1280@test.com', '10001280-7', '2025-03-19', '19:09:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1281, 'Cliente1281', 'cliente1281@test.com', '10001281-6', '2025-03-16', '12:21:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1282, 'Cliente1282', 'cliente1282@test.com', '10001282-6', '2025-07-06', '15:44:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1283, 'Cliente1283', 'cliente1283@test.com', '10001283-0', '2025-05-10', '09:40:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1284, 'Cliente1284', 'cliente1284@test.com', '10001284-6', '2025-05-22', '15:23:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1285, 'Cliente1285', 'cliente1285@test.com', '10001285-8', '2025-02-18', '13:36:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1286, 'Cliente1286', 'cliente1286@test.com', '10001286-1', '2025-06-06', '08:57:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1287, 'Cliente1287', 'cliente1287@test.com', '10001287-4', '2025-05-18', '11:05:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1288, 'Cliente1288', 'cliente1288@test.com', '10001288-8', '2025-06-11', '15:48:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1289, 'Cliente1289', 'cliente1289@test.com', '10001289-5', '2025-04-30', '08:13:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1290, 'Cliente1290', 'cliente1290@test.com', '10001290-4', '2025-05-25', '11:58:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1291, 'Cliente1291', 'cliente1291@test.com', '10001291-7', '2025-06-05', '19:01:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1292, 'Cliente1292', 'cliente1292@test.com', '10001292-2', '2025-04-13', '17:47:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1293, 'Cliente1293', 'cliente1293@test.com', '10001293-0', '2025-04-08', '15:25:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1294, 'Cliente1294', 'cliente1294@test.com', '10001294-5', '2025-05-01', '08:55:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1295, 'Cliente1295', 'cliente1295@test.com', '10001295-5', '2025-03-23', '11:49:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1296, 'Cliente1296', 'cliente1296@test.com', '10001296-5', '2025-04-17', '17:04:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1297, 'Cliente1297', 'cliente1297@test.com', '10001297-8', '2025-06-05', '17:01:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1298, 'Cliente1298', 'cliente1298@test.com', '10001298-7', '2025-02-04', '08:21:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1299, 'Cliente1299', 'cliente1299@test.com', '10001299-7', '2025-06-26', '19:55:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1300, 'Cliente1300', 'cliente1300@test.com', '10001300-5', '2025-04-25', '19:58:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1301, 'Cliente1301', 'cliente1301@test.com', '10001301-7', '2025-05-24', '19:03:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1302, 'Cliente1302', 'cliente1302@test.com', '10001302-2', '2025-04-21', '19:13:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1303, 'Cliente1303', 'cliente1303@test.com', '10001303-4', '2025-07-02', '08:13:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1304, 'Cliente1304', 'cliente1304@test.com', '10001304-5', '2025-04-21', '17:31:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1305, 'Cliente1305', 'cliente1305@test.com', '10001305-2', '2025-07-05', '08:18:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1306, 'Cliente1306', 'cliente1306@test.com', '10001306-7', '2025-07-03', '19:33:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1307, 'Cliente1307', 'cliente1307@test.com', '10001307-8', '2025-06-06', '09:29:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1308, 'Cliente1308', 'cliente1308@test.com', '10001308-2', '2025-01-21', '14:27:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1309, 'Cliente1309', 'cliente1309@test.com', '10001309-0', '2025-04-20', '13:16:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1310, 'Cliente1310', 'cliente1310@test.com', '10001310-1', '2025-06-09', '19:08:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1311, 'Cliente1311', 'cliente1311@test.com', '10001311-1', '2025-05-10', '11:42:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1312, 'Cliente1312', 'cliente1312@test.com', '10001312-6', '2025-01-21', '17:35:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1313, 'Cliente1313', 'cliente1313@test.com', '10001313-5', '2025-04-14', '15:49:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1314, 'Cliente1314', 'cliente1314@test.com', '10001314-4', '2025-06-09', '17:18:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1315, 'Cliente1315', 'cliente1315@test.com', '10001315-8', '2025-05-04', '10:43:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1316, 'Cliente1316', 'cliente1316@test.com', '10001316-4', '2025-03-15', '18:21:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1317, 'Cliente1317', 'cliente1317@test.com', '10001317-6', '2025-06-21', '19:18:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1318, 'Cliente1318', 'cliente1318@test.com', '10001318-6', '2025-03-03', '12:22:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1319, 'Cliente1319', 'cliente1319@test.com', '10001319-5', '2025-07-01', '14:35:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1320, 'Cliente1320', 'cliente1320@test.com', '10001320-6', '2025-01-24', '11:30:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1321, 'Cliente1321', 'cliente1321@test.com', '10001321-5', '2025-05-07', '15:31:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1322, 'Cliente1322', 'cliente1322@test.com', '10001322-5', '2025-05-11', '17:38:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1323, 'Cliente1323', 'cliente1323@test.com', '10001323-6', '2025-05-09', '19:42:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1324, 'Cliente1324', 'cliente1324@test.com', '10001324-5', '2025-05-02', '13:09:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1325, 'Cliente1325', 'cliente1325@test.com', '10001325-2', '2025-06-12', '12:54:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1326, 'Cliente1326', 'cliente1326@test.com', '10001326-6', '2025-04-11', '19:35:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1327, 'Cliente1327', 'cliente1327@test.com', '10001327-5', '2025-01-26', '11:03:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1328, 'Cliente1328', 'cliente1328@test.com', '10001328-1', '2025-03-04', '12:58:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1329, 'Cliente1329', 'cliente1329@test.com', '10001329-5', '2025-04-20', '19:41:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1330, 'Cliente1330', 'cliente1330@test.com', '10001330-2', '2025-03-15', '09:57:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1331, 'Cliente1331', 'cliente1331@test.com', '10001331-4', '2025-04-15', '18:01:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1332, 'Cliente1332', 'cliente1332@test.com', '10001332-3', '2025-01-25', '08:28:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1333, 'Cliente1333', 'cliente1333@test.com', '10001333-0', '2025-03-29', '15:23:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1334, 'Cliente1334', 'cliente1334@test.com', '10001334-6', '2025-05-15', '08:52:00', 5, 30, 3750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1335, 'Cliente1335', 'cliente1335@test.com', '10001335-8', '2025-04-14', '17:26:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1336, 'Cliente1336', 'cliente1336@test.com', '10001336-5', '2025-02-22', '18:43:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1337, 'Cliente1337', 'cliente1337@test.com', '10001337-5', '2025-06-17', '19:32:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1338, 'Cliente1338', 'cliente1338@test.com', '10001338-4', '2025-03-15', '09:33:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1339, 'Cliente1339', 'cliente1339@test.com', '10001339-1', '2025-03-22', '12:13:00', 7, 30, 5250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1340, 'Cliente1340', 'cliente1340@test.com', '10001340-5', '2025-05-10', '13:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1341, 'Cliente1341', 'cliente1341@test.com', '10001341-3', '2025-04-03', '10:08:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1342, 'Cliente1342', 'cliente1342@test.com', '10001342-5', '2025-01-30', '17:47:00', 2, 30, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1343, 'Cliente1343', 'cliente1343@test.com', '10001343-6', '2025-06-12', '19:09:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1344, 'Cliente1344', 'cliente1344@test.com', '10001344-7', '2025-06-25', '11:01:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1345, 'Cliente1345', 'cliente1345@test.com', '10001345-4', '2025-02-16', '09:14:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1346, 'Cliente1346', 'cliente1346@test.com', '10001346-6', '2025-04-25', '09:56:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1347, 'Cliente1347', 'cliente1347@test.com', '10001347-6', '2025-04-26', '08:52:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1348, 'Cliente1348', 'cliente1348@test.com', '10001348-0', '2025-01-21', '15:18:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1349, 'Cliente1349', 'cliente1349@test.com', '10001349-8', '2025-04-02', '08:53:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1350, 'Cliente1350', 'cliente1350@test.com', '10001350-6', '2025-02-20', '17:31:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1351, 'Cliente1351', 'cliente1351@test.com', '10001351-2', '2025-05-30', '10:24:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1352, 'Cliente1352', 'cliente1352@test.com', '10001352-3', '2025-04-07', '18:13:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1353, 'Cliente1353', 'cliente1353@test.com', '10001353-2', '2025-05-27', '09:55:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1354, 'Cliente1354', 'cliente1354@test.com', '10001354-5', '2025-06-24', '09:14:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1355, 'Cliente1355', 'cliente1355@test.com', '10001355-4', '2025-02-16', '08:29:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1356, 'Cliente1356', 'cliente1356@test.com', '10001356-5', '2025-05-27', '08:35:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1357, 'Cliente1357', 'cliente1357@test.com', '10001357-2', '2025-06-27', '08:55:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1358, 'Cliente1358', 'cliente1358@test.com', '10001358-4', '2025-03-20', '13:50:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1359, 'Cliente1359', 'cliente1359@test.com', '10001359-1', '2025-05-14', '19:51:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1360, 'Cliente1360', 'cliente1360@test.com', '10001360-4', '2025-01-27', '10:57:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1361, 'Cliente1361', 'cliente1361@test.com', '10001361-0', '2025-02-18', '12:20:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1362, 'Cliente1362', 'cliente1362@test.com', '10001362-8', '2025-01-27', '08:43:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1363, 'Cliente1363', 'cliente1363@test.com', '10001363-8', '2025-03-09', '12:47:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1364, 'Cliente1364', 'cliente1364@test.com', '10001364-5', '2025-07-04', '11:21:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1365, 'Cliente1365', 'cliente1365@test.com', '10001365-0', '2025-03-28', '09:01:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1366, 'Cliente1366', 'cliente1366@test.com', '10001366-2', '2025-05-01', '18:38:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1367, 'Cliente1367', 'cliente1367@test.com', '10001367-0', '2025-06-26', '10:30:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1368, 'Cliente1368', 'cliente1368@test.com', '10001368-0', '2025-02-02', '17:09:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1369, 'Cliente1369', 'cliente1369@test.com', '10001369-0', '2025-01-29', '12:29:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1370, 'Cliente1370', 'cliente1370@test.com', '10001370-4', '2025-07-05', '13:10:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1371, 'Cliente1371', 'cliente1371@test.com', '10001371-3', '2025-04-01', '09:56:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1372, 'Cliente1372', 'cliente1372@test.com', '10001372-2', '2025-04-14', '14:02:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1373, 'Cliente1373', 'cliente1373@test.com', '10001373-3', '2025-04-10', '15:54:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1374, 'Cliente1374', 'cliente1374@test.com', '10001374-4', '2025-01-28', '10:18:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1375, 'Cliente1375', 'cliente1375@test.com', '10001375-2', '2025-05-09', '19:56:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1376, 'Cliente1376', 'cliente1376@test.com', '10001376-3', '2025-01-27', '09:39:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1377, 'Cliente1377', 'cliente1377@test.com', '10001377-0', '2025-01-25', '18:47:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1378, 'Cliente1378', 'cliente1378@test.com', '10001378-3', '2025-02-22', '10:25:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1379, 'Cliente1379', 'cliente1379@test.com', '10001379-1', '2025-02-24', '18:09:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1380, 'Cliente1380', 'cliente1380@test.com', '10001380-7', '2025-03-02', '17:36:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1381, 'Cliente1381', 'cliente1381@test.com', '10001381-0', '2025-03-06', '12:58:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1382, 'Cliente1382', 'cliente1382@test.com', '10001382-1', '2025-02-05', '17:06:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1383, 'Cliente1383', 'cliente1383@test.com', '10001383-6', '2025-03-15', '13:56:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1384, 'Cliente1384', 'cliente1384@test.com', '10001384-7', '2025-03-04', '15:03:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1385, 'Cliente1385', 'cliente1385@test.com', '10001385-6', '2025-05-19', '18:40:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1386, 'Cliente1386', 'cliente1386@test.com', '10001386-5', '2025-05-26', '18:35:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1387, 'Cliente1387', 'cliente1387@test.com', '10001387-2', '2025-06-24', '17:01:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1388, 'Cliente1388', 'cliente1388@test.com', '10001388-1', '2025-02-21', '18:43:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1389, 'Cliente1389', 'cliente1389@test.com', '10001389-3', '2025-01-23', '16:16:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1390, 'Cliente1390', 'cliente1390@test.com', '10001390-0', '2025-05-06', '10:32:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1391, 'Cliente1391', 'cliente1391@test.com', '10001391-2', '2025-01-27', '14:18:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1392, 'Cliente1392', 'cliente1392@test.com', '10001392-7', '2025-02-17', '13:33:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1393, 'Cliente1393', 'cliente1393@test.com', '10001393-1', '2025-05-06', '15:29:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1394, 'Cliente1394', 'cliente1394@test.com', '10001394-1', '2025-04-09', '15:10:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1395, 'Cliente1395', 'cliente1395@test.com', '10001395-0', '2025-03-28', '08:38:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1396, 'Cliente1396', 'cliente1396@test.com', '10001396-3', '2025-07-01', '17:17:00', 6, 45, 6750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1397, 'Cliente1397', 'cliente1397@test.com', '10001397-4', '2025-05-11', '14:17:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1398, 'Cliente1398', 'cliente1398@test.com', '10001398-8', '2025-06-14', '08:10:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1399, 'Cliente1399', 'cliente1399@test.com', '10001399-8', '2025-05-07', '16:41:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1400, 'Cliente1400', 'cliente1400@test.com', '10001400-0', '2025-03-14', '15:56:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1401, 'Cliente1401', 'cliente1401@test.com', '10001401-1', '2025-03-05', '12:00:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1402, 'Cliente1402', 'cliente1402@test.com', '10001402-7', '2025-01-23', '10:03:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1403, 'Cliente1403', 'cliente1403@test.com', '10001403-2', '2025-03-18', '10:10:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1404, 'Cliente1404', 'cliente1404@test.com', '10001404-7', '2025-07-03', '13:21:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1405, 'Cliente1405', 'cliente1405@test.com', '10001405-2', '2025-04-08', '10:22:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1406, 'Cliente1406', 'cliente1406@test.com', '10001406-4', '2025-04-07', '18:24:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1407, 'Cliente1407', 'cliente1407@test.com', '10001407-8', '2025-04-03', '19:10:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1408, 'Cliente1408', 'cliente1408@test.com', '10001408-6', '2025-05-03', '17:01:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1409, 'Cliente1409', 'cliente1409@test.com', '10001409-7', '2025-05-28', '17:11:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1410, 'Cliente1410', 'cliente1410@test.com', '10001410-5', '2025-03-08', '16:18:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1411, 'Cliente1411', 'cliente1411@test.com', '10001411-8', '2025-03-19', '14:15:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1412, 'Cliente1412', 'cliente1412@test.com', '10001412-6', '2025-03-28', '15:32:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1413, 'Cliente1413', 'cliente1413@test.com', '10001413-1', '2025-03-22', '11:35:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1414, 'Cliente1414', 'cliente1414@test.com', '10001414-4', '2025-06-02', '09:08:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1415, 'Cliente1415', 'cliente1415@test.com', '10001415-4', '2025-05-23', '14:53:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1416, 'Cliente1416', 'cliente1416@test.com', '10001416-1', '2025-06-05', '17:17:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1417, 'Cliente1417', 'cliente1417@test.com', '10001417-5', '2025-03-18', '15:18:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1418, 'Cliente1418', 'cliente1418@test.com', '10001418-5', '2025-01-20', '18:30:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1419, 'Cliente1419', 'cliente1419@test.com', '10001419-3', '2025-02-16', '15:56:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1420, 'Cliente1420', 'cliente1420@test.com', '10001420-6', '2025-03-03', '14:11:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1421, 'Cliente1421', 'cliente1421@test.com', '10001421-5', '2025-06-02', '19:09:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1422, 'Cliente1422', 'cliente1422@test.com', '10001422-6', '2025-03-15', '08:45:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1423, 'Cliente1423', 'cliente1423@test.com', '10001423-5', '2025-01-23', '11:22:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1424, 'Cliente1424', 'cliente1424@test.com', '10001424-3', '2025-06-14', '15:46:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1425, 'Cliente1425', 'cliente1425@test.com', '10001425-6', '2025-06-25', '18:22:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1426, 'Cliente1426', 'cliente1426@test.com', '10001426-0', '2025-02-19', '17:10:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1427, 'Cliente1427', 'cliente1427@test.com', '10001427-1', '2025-06-10', '10:50:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1428, 'Cliente1428', 'cliente1428@test.com', '10001428-5', '2025-07-06', '18:43:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1429, 'Cliente1429', 'cliente1429@test.com', '10001429-6', '2025-01-24', '12:10:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1430, 'Cliente1430', 'cliente1430@test.com', '10001430-4', '2025-06-16', '12:39:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1431, 'Cliente1431', 'cliente1431@test.com', '10001431-3', '2025-06-09', '16:22:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1432, 'Cliente1432', 'cliente1432@test.com', '10001432-4', '2025-06-10', '15:39:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1433, 'Cliente1433', 'cliente1433@test.com', '10001433-7', '2025-01-21', '09:07:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1434, 'Cliente1434', 'cliente1434@test.com', '10001434-0', '2025-06-12', '11:15:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1435, 'Cliente1435', 'cliente1435@test.com', '10001435-1', '2025-02-25', '09:47:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1436, 'Cliente1436', 'cliente1436@test.com', '10001436-4', '2025-02-23', '14:40:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1437, 'Cliente1437', 'cliente1437@test.com', '10001437-1', '2025-05-07', '14:40:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1438, 'Cliente1438', 'cliente1438@test.com', '10001438-1', '2025-02-27', '15:08:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1439, 'Cliente1439', 'cliente1439@test.com', '10001439-0', '2025-03-10', '14:25:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1440, 'Cliente1440', 'cliente1440@test.com', '10001440-1', '2025-02-23', '13:41:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1441, 'Cliente1441', 'cliente1441@test.com', '10001441-3', '2025-06-29', '16:32:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1442, 'Cliente1442', 'cliente1442@test.com', '10001442-1', '2025-04-28', '10:38:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1443, 'Cliente1443', 'cliente1443@test.com', '10001443-6', '2025-03-25', '13:54:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1444, 'Cliente1444', 'cliente1444@test.com', '10001444-4', '2025-02-26', '12:41:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1445, 'Cliente1445', 'cliente1445@test.com', '10001445-0', '2025-05-22', '19:31:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1446, 'Cliente1446', 'cliente1446@test.com', '10001446-1', '2025-06-11', '14:32:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1447, 'Cliente1447', 'cliente1447@test.com', '10001447-2', '2025-06-24', '17:16:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1448, 'Cliente1448', 'cliente1448@test.com', '10001448-1', '2025-02-13', '10:49:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1449, 'Cliente1449', 'cliente1449@test.com', '10001449-1', '2025-04-08', '13:46:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1450, 'Cliente1450', 'cliente1450@test.com', '10001450-6', '2025-04-25', '13:16:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1451, 'Cliente1451', 'cliente1451@test.com', '10001451-3', '2025-03-13', '12:42:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1452, 'Cliente1452', 'cliente1452@test.com', '10001452-5', '2025-03-28', '16:43:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1453, 'Cliente1453', 'cliente1453@test.com', '10001453-1', '2025-06-08', '14:18:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1454, 'Cliente1454', 'cliente1454@test.com', '10001454-7', '2025-03-04', '15:07:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1455, 'Cliente1455', 'cliente1455@test.com', '10001455-1', '2025-03-28', '17:50:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1456, 'Cliente1456', 'cliente1456@test.com', '10001456-5', '2025-04-20', '18:53:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1457, 'Cliente1457', 'cliente1457@test.com', '10001457-8', '2025-02-09', '19:26:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1458, 'Cliente1458', 'cliente1458@test.com', '10001458-8', '2025-01-29', '16:09:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1459, 'Cliente1459', 'cliente1459@test.com', '10001459-4', '2025-03-29', '08:01:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1460, 'Cliente1460', 'cliente1460@test.com', '10001460-0', '2025-05-22', '09:58:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1461, 'Cliente1461', 'cliente1461@test.com', '10001461-3', '2025-03-21', '11:42:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1462, 'Cliente1462', 'cliente1462@test.com', '10001462-8', '2025-03-20', '12:16:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1463, 'Cliente1463', 'cliente1463@test.com', '10001463-4', '2025-03-02', '16:24:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1464, 'Cliente1464', 'cliente1464@test.com', '10001464-1', '2025-07-06', '15:31:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1465, 'Cliente1465', 'cliente1465@test.com', '10001465-3', '2025-03-26', '17:30:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1466, 'Cliente1466', 'cliente1466@test.com', '10001466-6', '2025-01-27', '17:22:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1467, 'Cliente1467', 'cliente1467@test.com', '10001467-6', '2025-06-17', '09:01:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1468, 'Cliente1468', 'cliente1468@test.com', '10001468-4', '2025-06-02', '13:53:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1469, 'Cliente1469', 'cliente1469@test.com', '10001469-1', '2025-05-22', '14:12:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1470, 'Cliente1470', 'cliente1470@test.com', '10001470-0', '2025-04-29', '14:56:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1471, 'Cliente1471', 'cliente1471@test.com', '10001471-8', '2025-05-14', '12:22:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1472, 'Cliente1472', 'cliente1472@test.com', '10001472-6', '2025-06-17', '18:58:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1473, 'Cliente1473', 'cliente1473@test.com', '10001473-5', '2025-05-19', '18:36:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1474, 'Cliente1474', 'cliente1474@test.com', '10001474-1', '2025-03-25', '19:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1475, 'Cliente1475', 'cliente1475@test.com', '10001475-5', '2025-05-07', '13:47:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1476, 'Cliente1476', 'cliente1476@test.com', '10001476-7', '2025-01-30', '15:35:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1477, 'Cliente1477', 'cliente1477@test.com', '10001477-5', '2025-06-08', '13:10:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1478, 'Cliente1478', 'cliente1478@test.com', '10001478-3', '2025-04-03', '16:12:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1479, 'Cliente1479', 'cliente1479@test.com', '10001479-5', '2025-04-23', '12:22:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1480, 'Cliente1480', 'cliente1480@test.com', '10001480-6', '2025-04-22', '09:57:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1481, 'Cliente1481', 'cliente1481@test.com', '10001481-5', '2025-02-01', '19:45:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1482, 'Cliente1482', 'cliente1482@test.com', '10001482-0', '2025-04-14', '19:10:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1483, 'Cliente1483', 'cliente1483@test.com', '10001483-1', '2025-03-26', '19:58:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1484, 'Cliente1484', 'cliente1484@test.com', '10001484-0', '2025-05-24', '19:03:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1485, 'Cliente1485', 'cliente1485@test.com', '10001485-3', '2025-05-07', '19:02:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1486, 'Cliente1486', 'cliente1486@test.com', '10001486-5', '2025-02-02', '18:44:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1487, 'Cliente1487', 'cliente1487@test.com', '10001487-6', '2025-05-23', '16:08:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1488, 'Cliente1488', 'cliente1488@test.com', '10001488-5', '2025-03-29', '08:48:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1489, 'Cliente1489', 'cliente1489@test.com', '10001489-2', '2025-05-31', '11:31:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1490, 'Cliente1490', 'cliente1490@test.com', '10001490-8', '2025-06-20', '09:42:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1491, 'Cliente1491', 'cliente1491@test.com', '10001491-2', '2025-07-05', '15:05:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1492, 'Cliente1492', 'cliente1492@test.com', '10001492-0', '2025-04-15', '15:43:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1493, 'Cliente1493', 'cliente1493@test.com', '10001493-8', '2025-04-05', '10:35:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1494, 'Cliente1494', 'cliente1494@test.com', '10001494-8', '2025-03-21', '12:52:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1495, 'Cliente1495', 'cliente1495@test.com', '10001495-7', '2025-01-24', '16:15:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1496, 'Cliente1496', 'cliente1496@test.com', '10001496-8', '2025-05-04', '19:42:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1497, 'Cliente1497', 'cliente1497@test.com', '10001497-8', '2025-04-19', '12:45:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1498, 'Cliente1498', 'cliente1498@test.com', '10001498-8', '2025-03-21', '16:44:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1499, 'Cliente1499', 'cliente1499@test.com', '10001499-5', '2025-03-19', '12:33:00', 7, 45, 7875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1500, 'Cliente1500', 'cliente1500@test.com', '10001500-4', '2025-02-05', '10:43:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1501, 'Cliente1501', 'cliente1501@test.com', '10001501-5', '2025-02-07', '17:52:00', 5, 30, 3750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1502, 'Cliente1502', 'cliente1502@test.com', '10001502-7', '2025-04-20', '14:55:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1503, 'Cliente1503', 'cliente1503@test.com', '10001503-3', '2025-04-11', '08:06:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1504, 'Cliente1504', 'cliente1504@test.com', '10001504-7', '2025-03-20', '15:11:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1505, 'Cliente1505', 'cliente1505@test.com', '10001505-2', '2025-03-09', '12:17:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1506, 'Cliente1506', 'cliente1506@test.com', '10001506-1', '2025-05-14', '10:32:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1507, 'Cliente1507', 'cliente1507@test.com', '10001507-6', '2025-03-22', '10:54:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1508, 'Cliente1508', 'cliente1508@test.com', '10001508-0', '2025-06-16', '10:19:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1509, 'Cliente1509', 'cliente1509@test.com', '10001509-0', '2025-03-27', '18:04:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1510, 'Cliente1510', 'cliente1510@test.com', '10001510-4', '2025-02-16', '15:22:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1511, 'Cliente1511', 'cliente1511@test.com', '10001511-1', '2025-06-01', '08:58:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1512, 'Cliente1512', 'cliente1512@test.com', '10001512-7', '2025-02-01', '14:56:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1513, 'Cliente1513', 'cliente1513@test.com', '10001513-4', '2025-03-18', '13:31:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1514, 'Cliente1514', 'cliente1514@test.com', '10001514-4', '2025-02-07', '15:39:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1515, 'Cliente1515', 'cliente1515@test.com', '10001515-5', '2025-05-17', '12:07:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1516, 'Cliente1516', 'cliente1516@test.com', '10001516-1', '2025-05-14', '17:30:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1517, 'Cliente1517', 'cliente1517@test.com', '10001517-7', '2025-04-07', '14:53:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1518, 'Cliente1518', 'cliente1518@test.com', '10001518-4', '2025-03-31', '14:24:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1519, 'Cliente1519', 'cliente1519@test.com', '10001519-2', '2025-01-21', '15:40:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1520, 'Cliente1520', 'cliente1520@test.com', '10001520-2', '2025-03-20', '18:53:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1521, 'Cliente1521', 'cliente1521@test.com', '10001521-6', '2025-01-25', '19:10:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1522, 'Cliente1522', 'cliente1522@test.com', '10001522-8', '2025-05-15', '15:57:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1523, 'Cliente1523', 'cliente1523@test.com', '10001523-0', '2025-01-23', '14:28:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1524, 'Cliente1524', 'cliente1524@test.com', '10001524-8', '2025-04-16', '13:50:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1525, 'Cliente1525', 'cliente1525@test.com', '10001525-0', '2025-06-02', '13:25:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1526, 'Cliente1526', 'cliente1526@test.com', '10001526-8', '2025-04-24', '10:06:00', 7, 30, 5250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1527, 'Cliente1527', 'cliente1527@test.com', '10001527-0', '2025-06-04', '10:11:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1528, 'Cliente1528', 'cliente1528@test.com', '10001528-3', '2025-01-20', '19:11:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1529, 'Cliente1529', 'cliente1529@test.com', '10001529-7', '2025-04-10', '11:35:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1530, 'Cliente1530', 'cliente1530@test.com', '10001530-8', '2025-06-10', '08:22:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1531, 'Cliente1531', 'cliente1531@test.com', '10001531-7', '2025-04-07', '19:50:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1532, 'Cliente1532', 'cliente1532@test.com', '10001532-3', '2025-03-26', '10:34:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1533, 'Cliente1533', 'cliente1533@test.com', '10001533-8', '2025-06-19', '18:49:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1534, 'Cliente1534', 'cliente1534@test.com', '10001534-8', '2025-05-09', '19:14:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1535, 'Cliente1535', 'cliente1535@test.com', '10001535-1', '2025-04-28', '12:43:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1536, 'Cliente1536', 'cliente1536@test.com', '10001536-4', '2025-04-14', '12:32:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1537, 'Cliente1537', 'cliente1537@test.com', '10001537-5', '2025-06-25', '17:29:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1538, 'Cliente1538', 'cliente1538@test.com', '10001538-2', '2025-04-06', '17:45:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1539, 'Cliente1539', 'cliente1539@test.com', '10001539-5', '2025-06-02', '15:57:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1540, 'Cliente1540', 'cliente1540@test.com', '10001540-5', '2025-02-28', '15:24:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1541, 'Cliente1541', 'cliente1541@test.com', '10001541-0', '2025-05-18', '18:09:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1542, 'Cliente1542', 'cliente1542@test.com', '10001542-2', '2025-04-07', '09:02:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1543, 'Cliente1543', 'cliente1543@test.com', '10001543-3', '2025-04-19', '15:49:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1544, 'Cliente1544', 'cliente1544@test.com', '10001544-0', '2025-06-25', '18:57:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1545, 'Cliente1545', 'cliente1545@test.com', '10001545-8', '2025-06-26', '16:13:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1546, 'Cliente1546', 'cliente1546@test.com', '10001546-2', '2025-02-23', '16:35:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1547, 'Cliente1547', 'cliente1547@test.com', '10001547-4', '2025-07-01', '14:45:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1548, 'Cliente1548', 'cliente1548@test.com', '10001548-5', '2025-05-20', '14:29:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1549, 'Cliente1549', 'cliente1549@test.com', '10001549-5', '2025-03-20', '11:28:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1550, 'Cliente1550', 'cliente1550@test.com', '10001550-7', '2025-04-13', '13:06:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1551, 'Cliente1551', 'cliente1551@test.com', '10001551-5', '2025-04-18', '09:58:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1552, 'Cliente1552', 'cliente1552@test.com', '10001552-1', '2025-01-28', '12:21:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1553, 'Cliente1553', 'cliente1553@test.com', '10001553-7', '2025-06-06', '16:40:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1554, 'Cliente1554', 'cliente1554@test.com', '10001554-3', '2025-05-17', '16:27:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1555, 'Cliente1555', 'cliente1555@test.com', '10001555-6', '2025-05-26', '19:41:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1556, 'Cliente1556', 'cliente1556@test.com', '10001556-6', '2025-06-30', '08:01:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1557, 'Cliente1557', 'cliente1557@test.com', '10001557-2', '2025-04-23', '14:15:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1558, 'Cliente1558', 'cliente1558@test.com', '10001558-3', '2025-05-10', '14:12:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1559, 'Cliente1559', 'cliente1559@test.com', '10001559-2', '2025-06-09', '09:37:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1560, 'Cliente1560', 'cliente1560@test.com', '10001560-0', '2025-07-03', '18:57:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1561, 'Cliente1561', 'cliente1561@test.com', '10001561-3', '2025-03-25', '11:57:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1562, 'Cliente1562', 'cliente1562@test.com', '10001562-3', '2025-06-05', '18:03:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1563, 'Cliente1563', 'cliente1563@test.com', '10001563-0', '2025-02-27', '16:19:00', 3, 60, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1564, 'Cliente1564', 'cliente1564@test.com', '10001564-8', '2025-01-24', '17:43:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1565, 'Cliente1565', 'cliente1565@test.com', '10001565-0', '2025-06-12', '17:45:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1566, 'Cliente1566', 'cliente1566@test.com', '10001566-7', '2025-06-20', '09:20:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1567, 'Cliente1567', 'cliente1567@test.com', '10001567-4', '2025-05-28', '18:10:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1568, 'Cliente1568', 'cliente1568@test.com', '10001568-7', '2025-04-17', '17:49:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1569, 'Cliente1569', 'cliente1569@test.com', '10001569-3', '2025-03-05', '18:29:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1570, 'Cliente1570', 'cliente1570@test.com', '10001570-0', '2025-06-02', '11:42:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1571, 'Cliente1571', 'cliente1571@test.com', '10001571-3', '2025-03-29', '12:25:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1572, 'Cliente1572', 'cliente1572@test.com', '10001572-4', '2025-03-19', '12:47:00', 2, 60, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1573, 'Cliente1573', 'cliente1573@test.com', '10001573-5', '2025-03-04', '19:20:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1574, 'Cliente1574', 'cliente1574@test.com', '10001574-0', '2025-03-21', '15:14:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1575, 'Cliente1575', 'cliente1575@test.com', '10001575-5', '2025-05-18', '14:30:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1576, 'Cliente1576', 'cliente1576@test.com', '10001576-2', '2025-03-16', '19:38:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1577, 'Cliente1577', 'cliente1577@test.com', '10001577-1', '2025-06-24', '18:28:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1578, 'Cliente1578', 'cliente1578@test.com', '10001578-5', '2025-03-28', '19:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1579, 'Cliente1579', 'cliente1579@test.com', '10001579-2', '2025-03-30', '10:27:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1580, 'Cliente1580', 'cliente1580@test.com', '10001580-5', '2025-06-22', '12:31:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1581, 'Cliente1581', 'cliente1581@test.com', '10001581-1', '2025-05-29', '17:06:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1582, 'Cliente1582', 'cliente1582@test.com', '10001582-5', '2025-03-15', '11:37:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1583, 'Cliente1583', 'cliente1583@test.com', '10001583-5', '2025-05-07', '15:40:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1584, 'Cliente1584', 'cliente1584@test.com', '10001584-1', '2025-06-26', '16:30:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1585, 'Cliente1585', 'cliente1585@test.com', '10001585-8', '2025-06-30', '15:46:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1586, 'Cliente1586', 'cliente1586@test.com', '10001586-3', '2025-03-26', '08:31:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1587, 'Cliente1587', 'cliente1587@test.com', '10001587-3', '2025-05-03', '13:06:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1588, 'Cliente1588', 'cliente1588@test.com', '10001588-4', '2025-06-17', '08:42:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1589, 'Cliente1589', 'cliente1589@test.com', '10001589-4', '2025-06-01', '16:28:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1590, 'Cliente1590', 'cliente1590@test.com', '10001590-1', '2025-02-02', '17:35:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1591, 'Cliente1591', 'cliente1591@test.com', '10001591-3', '2025-05-07', '15:05:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1592, 'Cliente1592', 'cliente1592@test.com', '10001592-2', '2025-04-28', '18:45:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1593, 'Cliente1593', 'cliente1593@test.com', '10001593-6', '2025-02-03', '16:56:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1594, 'Cliente1594', 'cliente1594@test.com', '10001594-8', '2025-05-31', '08:37:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1595, 'Cliente1595', 'cliente1595@test.com', '10001595-1', '2025-04-01', '15:33:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1596, 'Cliente1596', 'cliente1596@test.com', '10001596-0', '2025-01-20', '17:22:00', 4, 15, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1597, 'Cliente1597', 'cliente1597@test.com', '10001597-5', '2025-03-07', '17:47:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1598, 'Cliente1598', 'cliente1598@test.com', '10001598-5', '2025-05-23', '14:47:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1599, 'Cliente1599', 'cliente1599@test.com', '10001599-0', '2025-04-04', '16:52:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1600, 'Cliente1600', 'cliente1600@test.com', '10001600-3', '2025-03-20', '16:00:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1601, 'Cliente1601', 'cliente1601@test.com', '10001601-3', '2025-02-22', '11:10:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1602, 'Cliente1602', 'cliente1602@test.com', '10001602-5', '2025-04-16', '09:24:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1603, 'Cliente1603', 'cliente1603@test.com', '10001603-5', '2025-01-30', '16:16:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1604, 'Cliente1604', 'cliente1604@test.com', '10001604-4', '2025-03-02', '10:57:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1605, 'Cliente1605', 'cliente1605@test.com', '10001605-8', '2025-05-29', '14:41:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1606, 'Cliente1606', 'cliente1606@test.com', '10001606-5', '2025-02-07', '14:20:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1607, 'Cliente1607', 'cliente1607@test.com', '10001607-0', '2025-03-28', '16:39:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1608, 'Cliente1608', 'cliente1608@test.com', '10001608-0', '2025-04-29', '08:51:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1609, 'Cliente1609', 'cliente1609@test.com', '10001609-0', '2025-05-11', '10:30:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1610, 'Cliente1610', 'cliente1610@test.com', '10001610-0', '2025-06-25', '09:38:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1611, 'Cliente1611', 'cliente1611@test.com', '10001611-5', '2025-04-03', '18:29:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1612, 'Cliente1612', 'cliente1612@test.com', '10001612-3', '2025-06-16', '12:47:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1613, 'Cliente1613', 'cliente1613@test.com', '10001613-1', '2025-03-05', '16:52:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1614, 'Cliente1614', 'cliente1614@test.com', '10001614-8', '2025-03-15', '08:20:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1615, 'Cliente1615', 'cliente1615@test.com', '10001615-5', '2025-04-18', '12:57:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1616, 'Cliente1616', 'cliente1616@test.com', '10001616-3', '2025-04-04', '12:14:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1617, 'Cliente1617', 'cliente1617@test.com', '10001617-2', '2025-05-26', '11:46:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1618, 'Cliente1618', 'cliente1618@test.com', '10001618-7', '2025-05-11', '09:48:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1619, 'Cliente1619', 'cliente1619@test.com', '10001619-5', '2025-01-22', '08:30:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1620, 'Cliente1620', 'cliente1620@test.com', '10001620-4', '2025-05-02', '09:17:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1621, 'Cliente1621', 'cliente1621@test.com', '10001621-5', '2025-03-09', '11:13:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1622, 'Cliente1622', 'cliente1622@test.com', '10001622-6', '2025-03-08', '13:11:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1623, 'Cliente1623', 'cliente1623@test.com', '10001623-5', '2025-03-27', '17:16:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1624, 'Cliente1624', 'cliente1624@test.com', '10001624-2', '2025-04-28', '19:57:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1625, 'Cliente1625', 'cliente1625@test.com', '10001625-4', '2025-03-29', '14:42:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1626, 'Cliente1626', 'cliente1626@test.com', '10001626-2', '2025-05-01', '12:45:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1627, 'Cliente1627', 'cliente1627@test.com', '10001627-5', '2025-01-23', '09:03:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1628, 'Cliente1628', 'cliente1628@test.com', '10001628-8', '2025-02-24', '16:03:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1629, 'Cliente1629', 'cliente1629@test.com', '10001629-4', '2025-05-14', '17:42:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1630, 'Cliente1630', 'cliente1630@test.com', '10001630-6', '2025-06-23', '10:42:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1631, 'Cliente1631', 'cliente1631@test.com', '10001631-0', '2025-05-30', '17:12:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1632, 'Cliente1632', 'cliente1632@test.com', '10001632-4', '2025-02-11', '18:02:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1633, 'Cliente1633', 'cliente1633@test.com', '10001633-8', '2025-04-05', '18:18:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1634, 'Cliente1634', 'cliente1634@test.com', '10001634-1', '2025-07-02', '14:43:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1635, 'Cliente1635', 'cliente1635@test.com', '10001635-8', '2025-03-19', '17:48:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1636, 'Cliente1636', 'cliente1636@test.com', '10001636-0', '2025-07-03', '15:18:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1637, 'Cliente1637', 'cliente1637@test.com', '10001637-3', '2025-06-19', '13:29:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1638, 'Cliente1638', 'cliente1638@test.com', '10001638-6', '2025-03-07', '11:16:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1639, 'Cliente1639', 'cliente1639@test.com', '10001639-2', '2025-04-06', '11:26:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1640, 'Cliente1640', 'cliente1640@test.com', '10001640-1', '2025-04-14', '10:28:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1641, 'Cliente1641', 'cliente1641@test.com', '10001641-2', '2025-06-27', '17:40:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1642, 'Cliente1642', 'cliente1642@test.com', '10001642-8', '2025-04-24', '16:29:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1643, 'Cliente1643', 'cliente1643@test.com', '10001643-2', '2025-04-04', '10:01:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1644, 'Cliente1644', 'cliente1644@test.com', '10001644-5', '2025-03-24', '11:17:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1645, 'Cliente1645', 'cliente1645@test.com', '10001645-3', '2025-05-01', '10:47:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1646, 'Cliente1646', 'cliente1646@test.com', '10001646-8', '2025-01-29', '12:45:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1647, 'Cliente1647', 'cliente1647@test.com', '10001647-3', '2025-04-03', '19:13:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1648, 'Cliente1648', 'cliente1648@test.com', '10001648-7', '2025-03-24', '13:39:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1649, 'Cliente1649', 'cliente1649@test.com', '10001649-5', '2025-06-20', '12:26:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1650, 'Cliente1650', 'cliente1650@test.com', '10001650-1', '2025-03-26', '16:22:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1651, 'Cliente1651', 'cliente1651@test.com', '10001651-0', '2025-06-01', '17:17:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1652, 'Cliente1652', 'cliente1652@test.com', '10001652-1', '2025-02-15', '09:52:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1653, 'Cliente1653', 'cliente1653@test.com', '10001653-6', '2025-05-15', '08:23:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1654, 'Cliente1654', 'cliente1654@test.com', '10001654-1', '2025-03-07', '11:01:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1655, 'Cliente1655', 'cliente1655@test.com', '10001655-8', '2025-06-15', '14:15:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1656, 'Cliente1656', 'cliente1656@test.com', '10001656-4', '2025-06-16', '11:05:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1657, 'Cliente1657', 'cliente1657@test.com', '10001657-0', '2025-06-08', '14:04:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1658, 'Cliente1658', 'cliente1658@test.com', '10001658-1', '2025-04-26', '19:56:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1659, 'Cliente1659', 'cliente1659@test.com', '10001659-8', '2025-07-02', '10:19:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1660, 'Cliente1660', 'cliente1660@test.com', '10001660-8', '2025-03-18', '10:29:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1661, 'Cliente1661', 'cliente1661@test.com', '10001661-8', '2025-04-13', '09:41:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1662, 'Cliente1662', 'cliente1662@test.com', '10001662-4', '2025-04-15', '09:04:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1663, 'Cliente1663', 'cliente1663@test.com', '10001663-7', '2025-02-14', '11:34:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1664, 'Cliente1664', 'cliente1664@test.com', '10001664-8', '2025-06-18', '11:42:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1665, 'Cliente1665', 'cliente1665@test.com', '10001665-4', '2025-02-16', '19:25:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1666, 'Cliente1666', 'cliente1666@test.com', '10001666-6', '2025-02-20', '09:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1667, 'Cliente1667', 'cliente1667@test.com', '10001667-2', '2025-05-12', '15:37:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1668, 'Cliente1668', 'cliente1668@test.com', '10001668-1', '2025-03-21', '18:11:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1669, 'Cliente1669', 'cliente1669@test.com', '10001669-0', '2025-01-27', '15:20:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1670, 'Cliente1670', 'cliente1670@test.com', '10001670-3', '2025-06-06', '08:32:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1671, 'Cliente1671', 'cliente1671@test.com', '10001671-8', '2025-02-19', '19:40:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1672, 'Cliente1672', 'cliente1672@test.com', '10001672-2', '2025-04-10', '11:07:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1673, 'Cliente1673', 'cliente1673@test.com', '10001673-8', '2025-03-02', '10:20:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1674, 'Cliente1674', 'cliente1674@test.com', '10001674-1', '2025-02-01', '16:54:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1675, 'Cliente1675', 'cliente1675@test.com', '10001675-1', '2025-04-02', '12:25:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1676, 'Cliente1676', 'cliente1676@test.com', '10001676-7', '2025-05-25', '17:29:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1677, 'Cliente1677', 'cliente1677@test.com', '10001677-6', '2025-06-03', '19:42:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1678, 'Cliente1678', 'cliente1678@test.com', '10001678-7', '2025-03-10', '08:48:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1679, 'Cliente1679', 'cliente1679@test.com', '10001679-4', '2025-05-05', '15:13:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1680, 'Cliente1680', 'cliente1680@test.com', '10001680-3', '2025-03-27', '17:01:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1681, 'Cliente1681', 'cliente1681@test.com', '10001681-5', '2025-05-19', '08:01:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1682, 'Cliente1682', 'cliente1682@test.com', '10001682-3', '2025-03-10', '19:14:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1683, 'Cliente1683', 'cliente1683@test.com', '10001683-2', '2025-04-10', '10:34:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1684, 'Cliente1684', 'cliente1684@test.com', '10001684-4', '2025-03-09', '14:31:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1685, 'Cliente1685', 'cliente1685@test.com', '10001685-0', '2025-02-26', '16:21:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1686, 'Cliente1686', 'cliente1686@test.com', '10001686-1', '2025-05-10', '12:07:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1687, 'Cliente1687', 'cliente1687@test.com', '10001687-5', '2025-06-18', '11:48:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1688, 'Cliente1688', 'cliente1688@test.com', '10001688-7', '2025-03-30', '18:37:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1689, 'Cliente1689', 'cliente1689@test.com', '10001689-3', '2025-06-14', '14:58:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1690, 'Cliente1690', 'cliente1690@test.com', '10001690-7', '2025-01-23', '16:02:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1691, 'Cliente1691', 'cliente1691@test.com', '10001691-5', '2025-06-08', '09:55:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1692, 'Cliente1692', 'cliente1692@test.com', '10001692-5', '2025-03-24', '13:28:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1693, 'Cliente1693', 'cliente1693@test.com', '10001693-5', '2025-03-01', '15:31:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1694, 'Cliente1694', 'cliente1694@test.com', '10001694-1', '2025-02-13', '18:37:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1695, 'Cliente1695', 'cliente1695@test.com', '10001695-5', '2025-06-18', '19:16:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1696, 'Cliente1696', 'cliente1696@test.com', '10001696-2', '2025-03-17', '11:25:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1697, 'Cliente1697', 'cliente1697@test.com', '10001697-0', '2025-06-20', '14:43:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1698, 'Cliente1698', 'cliente1698@test.com', '10001698-4', '2025-02-08', '15:20:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1699, 'Cliente1699', 'cliente1699@test.com', '10001699-4', '2025-03-31', '14:41:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1700, 'Cliente1700', 'cliente1700@test.com', '10001700-2', '2025-05-09', '14:32:00', 2, 30, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1701, 'Cliente1701', 'cliente1701@test.com', '10001701-6', '2025-03-11', '09:22:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1702, 'Cliente1702', 'cliente1702@test.com', '10001702-4', '2025-04-30', '08:24:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1703, 'Cliente1703', 'cliente1703@test.com', '10001703-2', '2025-05-21', '10:25:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1704, 'Cliente1704', 'cliente1704@test.com', '10001704-3', '2025-04-01', '16:12:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1705, 'Cliente1705', 'cliente1705@test.com', '10001705-6', '2025-06-15', '11:10:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1706, 'Cliente1706', 'cliente1706@test.com', '10001706-0', '2025-05-02', '16:32:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1707, 'Cliente1707', 'cliente1707@test.com', '10001707-7', '2025-03-22', '09:45:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1708, 'Cliente1708', 'cliente1708@test.com', '10001708-4', '2025-07-05', '10:11:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1709, 'Cliente1709', 'cliente1709@test.com', '10001709-7', '2025-02-11', '19:52:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1710, 'Cliente1710', 'cliente1710@test.com', '10001710-4', '2025-06-20', '15:33:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1711, 'Cliente1711', 'cliente1711@test.com', '10001711-0', '2025-06-08', '10:15:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1712, 'Cliente1712', 'cliente1712@test.com', '10001712-7', '2025-05-04', '19:06:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1713, 'Cliente1713', 'cliente1713@test.com', '10001713-7', '2025-02-12', '19:14:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1714, 'Cliente1714', 'cliente1714@test.com', '10001714-3', '2025-05-04', '08:17:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1715, 'Cliente1715', 'cliente1715@test.com', '10001715-2', '2025-02-03', '18:08:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1716, 'Cliente1716', 'cliente1716@test.com', '10001716-3', '2025-02-26', '17:45:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1717, 'Cliente1717', 'cliente1717@test.com', '10001717-7', '2025-03-12', '12:26:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1718, 'Cliente1718', 'cliente1718@test.com', '10001718-8', '2025-05-19', '08:34:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1719, 'Cliente1719', 'cliente1719@test.com', '10001719-7', '2025-04-16', '17:52:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1720, 'Cliente1720', 'cliente1720@test.com', '10001720-3', '2025-05-06', '16:21:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1721, 'Cliente1721', 'cliente1721@test.com', '10001721-6', '2025-06-08', '13:15:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1722, 'Cliente1722', 'cliente1722@test.com', '10001722-7', '2025-05-29', '14:47:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1723, 'Cliente1723', 'cliente1723@test.com', '10001723-0', '2025-02-12', '10:32:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1724, 'Cliente1724', 'cliente1724@test.com', '10001724-4', '2025-03-22', '11:46:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1725, 'Cliente1725', 'cliente1725@test.com', '10001725-6', '2025-02-05', '10:33:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1726, 'Cliente1726', 'cliente1726@test.com', '10001726-6', '2025-04-02', '08:34:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1727, 'Cliente1727', 'cliente1727@test.com', '10001727-1', '2025-05-02', '18:13:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1728, 'Cliente1728', 'cliente1728@test.com', '10001728-3', '2025-04-13', '16:44:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1729, 'Cliente1729', 'cliente1729@test.com', '10001729-5', '2025-05-10', '15:05:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1730, 'Cliente1730', 'cliente1730@test.com', '10001730-5', '2025-04-04', '15:38:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1731, 'Cliente1731', 'cliente1731@test.com', '10001731-8', '2025-06-04', '09:01:00', 1, 30, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1732, 'Cliente1732', 'cliente1732@test.com', '10001732-5', '2025-04-20', '08:58:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1733, 'Cliente1733', 'cliente1733@test.com', '10001733-5', '2025-02-12', '14:20:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1734, 'Cliente1734', 'cliente1734@test.com', '10001734-8', '2025-04-22', '17:27:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1735, 'Cliente1735', 'cliente1735@test.com', '10001735-4', '2025-03-13', '13:27:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1736, 'Cliente1736', 'cliente1736@test.com', '10001736-2', '2025-06-07', '18:14:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1737, 'Cliente1737', 'cliente1737@test.com', '10001737-2', '2025-03-04', '19:00:00', 6, 15, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1738, 'Cliente1738', 'cliente1738@test.com', '10001738-3', '2025-05-28', '16:20:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1739, 'Cliente1739', 'cliente1739@test.com', '10001739-0', '2025-04-27', '18:32:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1740, 'Cliente1740', 'cliente1740@test.com', '10001740-7', '2025-03-12', '08:44:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1741, 'Cliente1741', 'cliente1741@test.com', '10001741-2', '2025-02-25', '13:05:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1742, 'Cliente1742', 'cliente1742@test.com', '10001742-0', '2025-02-09', '14:43:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1743, 'Cliente1743', 'cliente1743@test.com', '10001743-5', '2025-04-09', '12:15:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1744, 'Cliente1744', 'cliente1744@test.com', '10001744-1', '2025-04-06', '12:27:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1745, 'Cliente1745', 'cliente1745@test.com', '10001745-6', '2025-02-05', '13:07:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1746, 'Cliente1746', 'cliente1746@test.com', '10001746-2', '2025-05-12', '08:56:00', 2, 60, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1747, 'Cliente1747', 'cliente1747@test.com', '10001747-0', '2025-02-21', '14:44:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1748, 'Cliente1748', 'cliente1748@test.com', '10001748-1', '2025-01-31', '17:18:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1749, 'Cliente1749', 'cliente1749@test.com', '10001749-1', '2025-01-27', '15:15:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1750, 'Cliente1750', 'cliente1750@test.com', '10001750-1', '2025-04-14', '10:53:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1751, 'Cliente1751', 'cliente1751@test.com', '10001751-1', '2025-06-01', '10:38:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1752, 'Cliente1752', 'cliente1752@test.com', '10001752-6', '2025-04-30', '09:14:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1753, 'Cliente1753', 'cliente1753@test.com', '10001753-5', '2025-06-27', '11:42:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1754, 'Cliente1754', 'cliente1754@test.com', '10001754-2', '2025-05-13', '11:33:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1755, 'Cliente1755', 'cliente1755@test.com', '10001755-6', '2025-04-10', '12:50:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1756, 'Cliente1756', 'cliente1756@test.com', '10001756-6', '2025-06-16', '17:28:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1757, 'Cliente1757', 'cliente1757@test.com', '10001757-1', '2025-05-29', '16:42:00', 6, 60, 9000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1758, 'Cliente1758', 'cliente1758@test.com', '10001758-1', '2025-04-04', '15:12:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1759, 'Cliente1759', 'cliente1759@test.com', '10001759-5', '2025-02-16', '17:44:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1760, 'Cliente1760', 'cliente1760@test.com', '10001760-6', '2025-02-25', '11:17:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1761, 'Cliente1761', 'cliente1761@test.com', '10001761-0', '2025-06-15', '14:53:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1762, 'Cliente1762', 'cliente1762@test.com', '10001762-1', '2025-05-24', '18:01:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1763, 'Cliente1763', 'cliente1763@test.com', '10001763-6', '2025-06-14', '16:24:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1764, 'Cliente1764', 'cliente1764@test.com', '10001764-5', '2025-03-11', '08:04:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1765, 'Cliente1765', 'cliente1765@test.com', '10001765-4', '2025-03-15', '17:55:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1766, 'Cliente1766', 'cliente1766@test.com', '10001766-6', '2025-02-18', '09:49:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1767, 'Cliente1767', 'cliente1767@test.com', '10001767-7', '2025-06-04', '08:54:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1768, 'Cliente1768', 'cliente1768@test.com', '10001768-8', '2025-01-27', '15:14:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1769, 'Cliente1769', 'cliente1769@test.com', '10001769-2', '2025-03-26', '18:01:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1770, 'Cliente1770', 'cliente1770@test.com', '10001770-1', '2025-04-09', '15:16:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1771, 'Cliente1771', 'cliente1771@test.com', '10001771-7', '2025-03-08', '18:32:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1772, 'Cliente1772', 'cliente1772@test.com', '10001772-4', '2025-05-12', '08:49:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1773, 'Cliente1773', 'cliente1773@test.com', '10001773-1', '2025-05-29', '19:58:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1774, 'Cliente1774', 'cliente1774@test.com', '10001774-8', '2025-04-29', '17:01:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1775, 'Cliente1775', 'cliente1775@test.com', '10001775-1', '2025-02-27', '09:24:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1776, 'Cliente1776', 'cliente1776@test.com', '10001776-5', '2025-03-20', '08:46:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1777, 'Cliente1777', 'cliente1777@test.com', '10001777-0', '2025-06-29', '11:58:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1778, 'Cliente1778', 'cliente1778@test.com', '10001778-1', '2025-07-05', '17:54:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1779, 'Cliente1779', 'cliente1779@test.com', '10001779-8', '2025-05-18', '15:44:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1780, 'Cliente1780', 'cliente1780@test.com', '10001780-8', '2025-06-01', '09:49:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1781, 'Cliente1781', 'cliente1781@test.com', '10001781-3', '2025-03-08', '17:11:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1782, 'Cliente1782', 'cliente1782@test.com', '10001782-3', '2025-02-08', '12:26:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1783, 'Cliente1783', 'cliente1783@test.com', '10001783-8', '2025-05-16', '10:15:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1784, 'Cliente1784', 'cliente1784@test.com', '10001784-4', '2025-01-24', '11:54:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1785, 'Cliente1785', 'cliente1785@test.com', '10001785-1', '2025-02-12', '18:56:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1786, 'Cliente1786', 'cliente1786@test.com', '10001786-0', '2025-04-12', '09:05:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1787, 'Cliente1787', 'cliente1787@test.com', '10001787-3', '2025-06-16', '15:27:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1788, 'Cliente1788', 'cliente1788@test.com', '10001788-5', '2025-05-28', '13:42:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1789, 'Cliente1789', 'cliente1789@test.com', '10001789-2', '2025-03-15', '09:34:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1790, 'Cliente1790', 'cliente1790@test.com', '10001790-8', '2025-05-07', '12:58:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1791, 'Cliente1791', 'cliente1791@test.com', '10001791-3', '2025-05-25', '12:02:00', 4, 15, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1792, 'Cliente1792', 'cliente1792@test.com', '10001792-5', '2025-06-03', '11:05:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1793, 'Cliente1793', 'cliente1793@test.com', '10001793-1', '2025-03-25', '13:09:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1794, 'Cliente1794', 'cliente1794@test.com', '10001794-0', '2025-06-05', '18:29:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1795, 'Cliente1795', 'cliente1795@test.com', '10001795-0', '2025-05-15', '18:20:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1796, 'Cliente1796', 'cliente1796@test.com', '10001796-5', '2025-02-02', '19:21:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1797, 'Cliente1797', 'cliente1797@test.com', '10001797-0', '2025-06-04', '11:26:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1798, 'Cliente1798', 'cliente1798@test.com', '10001798-4', '2025-01-21', '17:05:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1799, 'Cliente1799', 'cliente1799@test.com', '10001799-8', '2025-04-04', '09:43:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1800, 'Cliente1800', 'cliente1800@test.com', '10001800-4', '2025-04-20', '13:25:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1801, 'Cliente1801', 'cliente1801@test.com', '10001801-4', '2025-03-24', '16:02:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1802, 'Cliente1802', 'cliente1802@test.com', '10001802-5', '2025-03-20', '11:51:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1803, 'Cliente1803', 'cliente1803@test.com', '10001803-0', '2025-06-04', '11:07:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1804, 'Cliente1804', 'cliente1804@test.com', '10001804-2', '2025-01-25', '13:25:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1805, 'Cliente1805', 'cliente1805@test.com', '10001805-0', '2025-03-23', '11:35:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1806, 'Cliente1806', 'cliente1806@test.com', '10001806-5', '2025-01-31', '14:37:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1807, 'Cliente1807', 'cliente1807@test.com', '10001807-5', '2025-05-23', '14:30:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1808, 'Cliente1808', 'cliente1808@test.com', '10001808-1', '2025-06-28', '13:43:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1809, 'Cliente1809', 'cliente1809@test.com', '10001809-5', '2025-01-27', '13:18:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1810, 'Cliente1810', 'cliente1810@test.com', '10001810-0', '2025-05-20', '16:46:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1811, 'Cliente1811', 'cliente1811@test.com', '10001811-7', '2025-04-14', '08:06:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1812, 'Cliente1812', 'cliente1812@test.com', '10001812-5', '2025-01-30', '19:25:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1813, 'Cliente1813', 'cliente1813@test.com', '10001813-1', '2025-06-30', '12:55:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1814, 'Cliente1814', 'cliente1814@test.com', '10001814-1', '2025-06-06', '11:01:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1815, 'Cliente1815', 'cliente1815@test.com', '10001815-2', '2025-05-29', '17:33:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1816, 'Cliente1816', 'cliente1816@test.com', '10001816-6', '2025-06-17', '13:13:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1817, 'Cliente1817', 'cliente1817@test.com', '10001817-7', '2025-06-02', '13:21:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1818, 'Cliente1818', 'cliente1818@test.com', '10001818-7', '2025-02-04', '17:48:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1819, 'Cliente1819', 'cliente1819@test.com', '10001819-8', '2025-03-10', '17:29:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1820, 'Cliente1820', 'cliente1820@test.com', '10001820-6', '2025-01-21', '14:12:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1821, 'Cliente1821', 'cliente1821@test.com', '10001821-6', '2025-07-03', '12:08:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1822, 'Cliente1822', 'cliente1822@test.com', '10001822-0', '2025-01-21', '13:02:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1823, 'Cliente1823', 'cliente1823@test.com', '10001823-7', '2025-02-08', '09:29:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1824, 'Cliente1824', 'cliente1824@test.com', '10001824-8', '2025-06-09', '11:28:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1825, 'Cliente1825', 'cliente1825@test.com', '10001825-6', '2025-02-14', '10:48:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1826, 'Cliente1826', 'cliente1826@test.com', '10001826-6', '2025-04-24', '17:19:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1827, 'Cliente1827', 'cliente1827@test.com', '10001827-2', '2025-02-14', '19:50:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1828, 'Cliente1828', 'cliente1828@test.com', '10001828-1', '2025-06-17', '13:25:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1829, 'Cliente1829', 'cliente1829@test.com', '10001829-6', '2025-05-12', '12:34:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1830, 'Cliente1830', 'cliente1830@test.com', '10001830-0', '2025-05-27', '15:42:00', 3, 30, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1831, 'Cliente1831', 'cliente1831@test.com', '10001831-2', '2025-02-28', '13:24:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1832, 'Cliente1832', 'cliente1832@test.com', '10001832-7', '2025-02-08', '13:41:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1833, 'Cliente1833', 'cliente1833@test.com', '10001833-5', '2025-06-24', '15:50:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1834, 'Cliente1834', 'cliente1834@test.com', '10001834-7', '2025-06-03', '08:35:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1835, 'Cliente1835', 'cliente1835@test.com', '10001835-6', '2025-02-12', '14:06:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1836, 'Cliente1836', 'cliente1836@test.com', '10001836-6', '2025-03-10', '11:38:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1837, 'Cliente1837', 'cliente1837@test.com', '10001837-4', '2025-02-15', '14:20:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1838, 'Cliente1838', 'cliente1838@test.com', '10001838-5', '2025-03-21', '12:18:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1839, 'Cliente1839', 'cliente1839@test.com', '10001839-2', '2025-07-01', '17:03:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1840, 'Cliente1840', 'cliente1840@test.com', '10001840-3', '2025-05-11', '13:58:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1841, 'Cliente1841', 'cliente1841@test.com', '10001841-4', '2025-03-16', '18:22:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1842, 'Cliente1842', 'cliente1842@test.com', '10001842-7', '2025-05-19', '12:44:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1843, 'Cliente1843', 'cliente1843@test.com', '10001843-4', '2025-02-14', '10:31:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1844, 'Cliente1844', 'cliente1844@test.com', '10001844-7', '2025-06-05', '15:42:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1845, 'Cliente1845', 'cliente1845@test.com', '10001845-7', '2025-02-21', '15:07:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1846, 'Cliente1846', 'cliente1846@test.com', '10001846-4', '2025-03-06', '16:44:00', 6, 30, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1847, 'Cliente1847', 'cliente1847@test.com', '10001847-6', '2025-01-27', '16:15:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1848, 'Cliente1848', 'cliente1848@test.com', '10001848-2', '2025-06-29', '11:19:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1849, 'Cliente1849', 'cliente1849@test.com', '10001849-2', '2025-04-23', '11:54:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1850, 'Cliente1850', 'cliente1850@test.com', '10001850-2', '2025-06-16', '09:30:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1851, 'Cliente1851', 'cliente1851@test.com', '10001851-4', '2025-03-19', '19:53:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1852, 'Cliente1852', 'cliente1852@test.com', '10001852-2', '2025-04-13', '15:54:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1853, 'Cliente1853', 'cliente1853@test.com', '10001853-5', '2025-05-05', '13:06:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1854, 'Cliente1854', 'cliente1854@test.com', '10001854-6', '2025-04-24', '17:27:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1855, 'Cliente1855', 'cliente1855@test.com', '10001855-3', '2025-03-01', '15:06:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1856, 'Cliente1856', 'cliente1856@test.com', '10001856-7', '2025-01-20', '10:13:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1857, 'Cliente1857', 'cliente1857@test.com', '10001857-6', '2025-04-26', '18:44:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1858, 'Cliente1858', 'cliente1858@test.com', '10001858-8', '2025-06-19', '08:25:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1859, 'Cliente1859', 'cliente1859@test.com', '10001859-4', '2025-03-10', '14:03:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1860, 'Cliente1860', 'cliente1860@test.com', '10001860-6', '2025-07-06', '15:23:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1861, 'Cliente1861', 'cliente1861@test.com', '10001861-5', '2025-06-12', '19:58:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1862, 'Cliente1862', 'cliente1862@test.com', '10001862-1', '2025-06-20', '17:58:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1863, 'Cliente1863', 'cliente1863@test.com', '10001863-6', '2025-05-01', '16:00:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1864, 'Cliente1864', 'cliente1864@test.com', '10001864-6', '2025-02-07', '19:01:00', 7, 15, 2625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1865, 'Cliente1865', 'cliente1865@test.com', '10001865-3', '2025-06-06', '18:53:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1866, 'Cliente1866', 'cliente1866@test.com', '10001866-7', '2025-06-05', '19:56:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1867, 'Cliente1867', 'cliente1867@test.com', '10001867-7', '2025-04-07', '19:32:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1868, 'Cliente1868', 'cliente1868@test.com', '10001868-3', '2025-03-22', '08:48:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1869, 'Cliente1869', 'cliente1869@test.com', '10001869-2', '2025-06-09', '17:12:00', 1, 60, 1500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1870, 'Cliente1870', 'cliente1870@test.com', '10001870-5', '2025-01-24', '13:58:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1871, 'Cliente1871', 'cliente1871@test.com', '10001871-0', '2025-06-03', '12:50:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1872, 'Cliente1872', 'cliente1872@test.com', '10001872-0', '2025-03-22', '15:44:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1873, 'Cliente1873', 'cliente1873@test.com', '10001873-2', '2025-04-26', '15:22:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1874, 'Cliente1874', 'cliente1874@test.com', '10001874-5', '2025-06-22', '15:44:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1875, 'Cliente1875', 'cliente1875@test.com', '10001875-3', '2025-01-23', '13:18:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1876, 'Cliente1876', 'cliente1876@test.com', '10001876-3', '2025-06-13', '08:41:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1877, 'Cliente1877', 'cliente1877@test.com', '10001877-5', '2025-06-29', '10:45:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1878, 'Cliente1878', 'cliente1878@test.com', '10001878-6', '2025-04-08', '12:35:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1879, 'Cliente1879', 'cliente1879@test.com', '10001879-2', '2025-07-05', '16:10:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1880, 'Cliente1880', 'cliente1880@test.com', '10001880-7', '2025-06-03', '15:58:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1881, 'Cliente1881', 'cliente1881@test.com', '10001881-4', '2025-01-25', '09:16:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1882, 'Cliente1882', 'cliente1882@test.com', '10001882-5', '2025-02-17', '14:10:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1883, 'Cliente1883', 'cliente1883@test.com', '10001883-7', '2025-03-10', '11:39:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1884, 'Cliente1884', 'cliente1884@test.com', '10001884-0', '2025-07-06', '16:40:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1885, 'Cliente1885', 'cliente1885@test.com', '10001885-4', '2025-04-02', '18:51:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1886, 'Cliente1886', 'cliente1886@test.com', '10001886-2', '2025-04-03', '12:42:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1887, 'Cliente1887', 'cliente1887@test.com', '10001887-2', '2025-04-11', '19:29:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1888, 'Cliente1888', 'cliente1888@test.com', '10001888-1', '2025-07-02', '09:21:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1889, 'Cliente1889', 'cliente1889@test.com', '10001889-1', '2025-07-01', '18:50:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1890, 'Cliente1890', 'cliente1890@test.com', '10001890-5', '2025-01-29', '14:08:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1891, 'Cliente1891', 'cliente1891@test.com', '10001891-3', '2025-04-23', '18:04:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1892, 'Cliente1892', 'cliente1892@test.com', '10001892-6', '2025-05-03', '15:53:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1893, 'Cliente1893', 'cliente1893@test.com', '10001893-5', '2025-07-06', '11:15:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1894, 'Cliente1894', 'cliente1894@test.com', '10001894-6', '2025-03-30', '18:40:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1895, 'Cliente1895', 'cliente1895@test.com', '10001895-1', '2025-03-07', '18:46:00', 3, 15, 1125, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1896, 'Cliente1896', 'cliente1896@test.com', '10001896-3', '2025-06-18', '08:57:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1897, 'Cliente1897', 'cliente1897@test.com', '10001897-1', '2025-05-17', '10:22:00', 2, 45, 2250, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1898, 'Cliente1898', 'cliente1898@test.com', '10001898-4', '2025-03-27', '12:20:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1899, 'Cliente1899', 'cliente1899@test.com', '10001899-6', '2025-05-05', '11:22:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1900, 'Cliente1900', 'cliente1900@test.com', '10001900-2', '2025-03-26', '17:23:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1901, 'Cliente1901', 'cliente1901@test.com', '10001901-5', '2025-02-06', '08:37:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1902, 'Cliente1902', 'cliente1902@test.com', '10001902-4', '2025-03-02', '10:34:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1903, 'Cliente1903', 'cliente1903@test.com', '10001903-8', '2025-06-09', '12:05:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1904, 'Cliente1904', 'cliente1904@test.com', '10001904-4', '2025-03-13', '16:03:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1905, 'Cliente1905', 'cliente1905@test.com', '10001905-8', '2025-02-28', '14:51:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1906, 'Cliente1906', 'cliente1906@test.com', '10001906-5', '2025-06-08', '13:31:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1907, 'Cliente1907', 'cliente1907@test.com', '10001907-2', '2025-05-19', '12:41:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1908, 'Cliente1908', 'cliente1908@test.com', '10001908-5', '2025-04-27', '16:44:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1909, 'Cliente1909', 'cliente1909@test.com', '10001909-0', '2025-04-07', '12:04:00', 3, 45, 3375, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1910, 'Cliente1910', 'cliente1910@test.com', '10001910-1', '2025-03-15', '11:06:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1911, 'Cliente1911', 'cliente1911@test.com', '10001911-8', '2025-06-20', '14:41:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1912, 'Cliente1912', 'cliente1912@test.com', '10001912-8', '2025-04-03', '16:21:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1913, 'Cliente1913', 'cliente1913@test.com', '10001913-3', '2025-02-15', '14:14:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1914, 'Cliente1914', 'cliente1914@test.com', '10001914-4', '2025-03-15', '15:46:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1915, 'Cliente1915', 'cliente1915@test.com', '10001915-4', '2025-04-24', '12:42:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1916, 'Cliente1916', 'cliente1916@test.com', '10001916-8', '2025-02-09', '14:01:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1917, 'Cliente1917', 'cliente1917@test.com', '10001917-7', '2025-06-01', '15:01:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1918, 'Cliente1918', 'cliente1918@test.com', '10001918-3', '2025-02-15', '17:14:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1919, 'Cliente1919', 'cliente1919@test.com', '10001919-6', '2025-06-06', '15:23:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1920, 'Cliente1920', 'cliente1920@test.com', '10001920-2', '2025-04-03', '18:39:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1921, 'Cliente1921', 'cliente1921@test.com', '10001921-0', '2025-01-31', '15:29:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1922, 'Cliente1922', 'cliente1922@test.com', '10001922-1', '2025-06-15', '08:46:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1923, 'Cliente1923', 'cliente1923@test.com', '10001923-1', '2025-06-14', '17:35:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1924, 'Cliente1924', 'cliente1924@test.com', '10001924-4', '2025-04-04', '13:01:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1925, 'Cliente1925', 'cliente1925@test.com', '10001925-0', '2025-03-14', '16:41:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1926, 'Cliente1926', 'cliente1926@test.com', '10001926-0', '2025-05-21', '13:20:00', 5, 30, 3750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1927, 'Cliente1927', 'cliente1927@test.com', '10001927-1', '2025-02-07', '10:22:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1928, 'Cliente1928', 'cliente1928@test.com', '10001928-6', '2025-02-24', '16:40:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1929, 'Cliente1929', 'cliente1929@test.com', '10001929-8', '2025-02-19', '09:58:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1930, 'Cliente1930', 'cliente1930@test.com', '10001930-1', '2025-05-28', '11:42:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1931, 'Cliente1931', 'cliente1931@test.com', '10001931-1', '2025-06-04', '09:54:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1932, 'Cliente1932', 'cliente1932@test.com', '10001932-7', '2025-03-20', '17:06:00', 4, 60, 6000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1933, 'Cliente1933', 'cliente1933@test.com', '10001933-4', '2025-04-18', '17:53:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1934, 'Cliente1934', 'cliente1934@test.com', '10001934-5', '2025-05-04', '08:49:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1935, 'Cliente1935', 'cliente1935@test.com', '10001935-7', '2025-05-13', '14:07:00', 1, 15, 375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1936, 'Cliente1936', 'cliente1936@test.com', '10001936-7', '2025-05-05', '08:50:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1937, 'Cliente1937', 'cliente1937@test.com', '10001937-6', '2025-05-16', '08:37:00', 3, 15, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1938, 'Cliente1938', 'cliente1938@test.com', '10001938-6', '2025-06-16', '15:41:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1939, 'Cliente1939', 'cliente1939@test.com', '10001939-2', '2025-03-05', '11:10:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1940, 'Cliente1940', 'cliente1940@test.com', '10001940-2', '2025-04-20', '16:21:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1941, 'Cliente1941', 'cliente1941@test.com', '10001941-7', '2025-05-29', '18:51:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1942, 'Cliente1942', 'cliente1942@test.com', '10001942-3', '2025-03-19', '15:19:00', 7, 60, 10500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1943, 'Cliente1943', 'cliente1943@test.com', '10001943-1', '2025-05-14', '11:36:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1944, 'Cliente1944', 'cliente1944@test.com', '10001944-3', '2025-01-22', '11:50:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1945, 'Cliente1945', 'cliente1945@test.com', '10001945-7', '2025-06-01', '11:42:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1946, 'Cliente1946', 'cliente1946@test.com', '10001946-3', '2025-02-23', '08:20:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1947, 'Cliente1947', 'cliente1947@test.com', '10001947-6', '2025-06-24', '14:40:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1948, 'Cliente1948', 'cliente1948@test.com', '10001948-2', '2025-03-03', '19:21:00', 2, 15, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1949, 'Cliente1949', 'cliente1949@test.com', '10001949-7', '2025-03-08', '14:41:00', 4, 30, 3000, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1950, 'Cliente1950', 'cliente1950@test.com', '10001950-5', '2025-04-13', '13:27:00', 7, 45, 7875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1951, 'Cliente1951', 'cliente1951@test.com', '10001951-2', '2025-02-11', '17:57:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1952, 'Cliente1952', 'cliente1952@test.com', '10001952-2', '2025-02-05', '08:01:00', 6, 60, 9000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1953, 'Cliente1953', 'cliente1953@test.com', '10001953-0', '2025-04-05', '13:38:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1954, 'Cliente1954', 'cliente1954@test.com', '10001954-5', '2025-05-04', '18:27:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1955, 'Cliente1955', 'cliente1955@test.com', '10001955-7', '2025-06-10', '18:47:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1956, 'Cliente1956', 'cliente1956@test.com', '10001956-7', '2025-02-26', '14:41:00', 2, 15, 750, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1957, 'Cliente1957', 'cliente1957@test.com', '10001957-1', '2025-05-29', '17:27:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1958, 'Cliente1958', 'cliente1958@test.com', '10001958-0', '2025-06-23', '08:26:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1959, 'Cliente1959', 'cliente1959@test.com', '10001959-2', '2025-05-07', '10:55:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1960, 'Cliente1960', 'cliente1960@test.com', '10001960-7', '2025-03-02', '18:06:00', 4, 45, 4500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1961, 'Cliente1961', 'cliente1961@test.com', '10001961-7', '2025-03-03', '10:51:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1962, 'Cliente1962', 'cliente1962@test.com', '10001962-7', '2025-02-18', '09:43:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1963, 'Cliente1963', 'cliente1963@test.com', '10001963-4', '2025-01-22', '08:27:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1964, 'Cliente1964', 'cliente1964@test.com', '10001964-6', '2025-05-28', '13:19:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1965, 'Cliente1965', 'cliente1965@test.com', '10001965-1', '2025-04-17', '15:04:00', 7, 30, 5250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1966, 'Cliente1966', 'cliente1966@test.com', '10001966-5', '2025-06-17', '12:05:00', 5, 15, 1875, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1967, 'Cliente1967', 'cliente1967@test.com', '10001967-7', '2025-05-17', '18:15:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1968, 'Cliente1968', 'cliente1968@test.com', '10001968-6', '2025-06-12', '17:38:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1969, 'Cliente1969', 'cliente1969@test.com', '10001969-1', '2025-03-11', '17:01:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1970, 'Cliente1970', 'cliente1970@test.com', '10001970-2', '2025-06-24', '15:45:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1971, 'Cliente1971', 'cliente1971@test.com', '10001971-8', '2025-04-26', '16:26:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1972, 'Cliente1972', 'cliente1972@test.com', '10001972-3', '2025-03-02', '13:56:00', 7, 15, 2625, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1973, 'Cliente1973', 'cliente1973@test.com', '10001973-7', '2025-06-06', '09:29:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1974, 'Cliente1974', 'cliente1974@test.com', '10001974-7', '2025-04-19', '18:07:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1975, 'Cliente1975', 'cliente1975@test.com', '10001975-5', '2025-03-27', '13:19:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1976, 'Cliente1976', 'cliente1976@test.com', '10001976-2', '2025-05-09', '09:44:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1977, 'Cliente1977', 'cliente1977@test.com', '10001977-5', '2025-01-25', '15:32:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1978, 'Cliente1978', 'cliente1978@test.com', '10001978-3', '2025-05-08', '17:52:00', 5, 60, 7500, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1979, 'Cliente1979', 'cliente1979@test.com', '10001979-7', '2025-01-27', '17:57:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1980, 'Cliente1980', 'cliente1980@test.com', '10001980-8', '2025-01-30', '17:03:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1981, 'Cliente1981', 'cliente1981@test.com', '10001981-6', '2025-03-06', '15:42:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1982, 'Cliente1982', 'cliente1982@test.com', '10001982-3', '2025-06-28', '12:32:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1983, 'Cliente1983', 'cliente1983@test.com', '10001983-7', '2025-04-14', '11:32:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1984, 'Cliente1984', 'cliente1984@test.com', '10001984-2', '2025-03-21', '13:26:00', 6, 30, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1985, 'Cliente1985', 'cliente1985@test.com', '10001985-1', '2025-01-28', '18:22:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1986, 'Cliente1986', 'cliente1986@test.com', '10001986-6', '2025-06-07', '08:41:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1987, 'Cliente1987', 'cliente1987@test.com', '10001987-7', '2025-04-04', '12:39:00', 4, 15, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1988, 'Cliente1988', 'cliente1988@test.com', '10001988-3', '2025-02-02', '09:51:00', 6, 45, 6750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1989, 'Cliente1989', 'cliente1989@test.com', '10001989-4', '2025-02-04', '11:12:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1990, 'Cliente1990', 'cliente1990@test.com', '10001990-2', '2025-03-06', '12:53:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1991, 'Cliente1991', 'cliente1991@test.com', '10001991-1', '2025-06-06', '14:50:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1992, 'Cliente1992', 'cliente1992@test.com', '10001992-6', '2025-02-06', '13:37:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1993, 'Cliente1993', 'cliente1993@test.com', '10001993-4', '2025-06-06', '13:56:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1994, 'Cliente1994', 'cliente1994@test.com', '10001994-5', '2025-06-23', '19:04:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1995, 'Cliente1995', 'cliente1995@test.com', '10001995-6', '2025-05-14', '13:30:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1996, 'Cliente1996', 'cliente1996@test.com', '10001996-0', '2025-05-25', '19:31:00', 5, 15, 1875, 'CANCELLED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1997, 'Cliente1997', 'cliente1997@test.com', '10001997-5', '2025-06-18', '16:22:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1998, 'Cliente1998', 'cliente1998@test.com', '10001998-8', '2025-05-20', '17:49:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (1999, 'Cliente1999', 'cliente1999@test.com', '10001999-8', '2025-04-12', '16:50:00', 7, 60, 10500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2000, 'Cliente2000', 'cliente2000@test.com', '10002000-1', '2025-04-18', '09:53:00', 6, 15, 2250, 'CONFIRMED', NOW(), NOW());
-- ============================================================================================================
-- DATOS PARA DESCUENTOS POR FRECUENCIA
-- ============================================================================================================
INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (1, '10000001-3', 7, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (2, '10000002-1', 19, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (3, '10000003-1', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (4, '10000004-4', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (5, '10000005-6', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (6, '10000006-4', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (7, '10000007-8', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (8, '10000008-1', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (9, '10000009-5', 10, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (10, '10000010-8', 7, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (11, '10000011-1', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (12, '10000012-5', 12, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (13, '10000013-6', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (14, '10000014-0', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (15, '10000015-1', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (16, '10000016-7', 7, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (17, '10000017-4', 7, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (18, '10000018-5', 10, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (19, '10000019-4', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (20, '10000020-3', 19, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (21, '10000021-7', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (22, '10000022-5', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (23, '10000023-6', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (24, '10000024-1', 13, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (25, '10000025-8', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (26, '10000026-1', 16, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (27, '10000027-4', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (28, '10000028-8', 16, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (29, '10000029-5', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (30, '10000030-6', 16, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (31, '10000031-4', 9, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (32, '10000032-0', 10, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (33, '10000033-7', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (34, '10000034-1', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (35, '10000035-8', 9, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (36, '10000036-7', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (37, '10000037-2', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (38, '10000038-1', 9, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (39, '10000039-1', 12, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (40, '10000040-0', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (41, '10000041-4', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (42, '10000042-0', 16, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (43, '10000043-6', 19, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (44, '10000044-7', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (45, '10000045-2', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (46, '10000046-0', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (47, '10000047-8', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (48, '10000048-1', 9, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (49, '10000049-4', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (50, '10000050-8', 12, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (51, '10000051-1', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (52, '10000052-4', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (53, '10000053-4', 13, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (54, '10000054-1', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (55, '10000055-6', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (56, '10000056-3', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (57, '10000057-3', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (58, '10000058-3', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (59, '10000059-8', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (60, '10000060-7', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (61, '10000061-1', 10, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (62, '10000062-8', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (63, '10000063-4', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (64, '10000064-7', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (65, '10000065-4', 6, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (66, '10000066-3', 16, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (67, '10000067-4', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (68, '10000068-5', 10, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (69, '10000069-6', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (70, '10000070-8', 13, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (71, '10000071-5', 6, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (72, '10000072-4', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (73, '10000073-6', 18, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (74, '10000074-5', 9, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (75, '10000075-2', 12, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (76, '10000076-4', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (77, '10000077-4', 6, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (78, '10000078-3', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (79, '10000079-8', 11, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (80, '10000080-5', 16, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (81, '10000081-4', 11, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (82, '10000082-4', 11, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (83, '10000083-0', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (84, '10000084-1', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (85, '10000085-5', 9, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (86, '10000086-2', 7, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (87, '10000087-7', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (88, '10000088-5', 12, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (89, '10000089-0', 17, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (90, '10000090-5', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (91, '10000091-1', 19, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (92, '10000092-0', 14, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (93, '10000093-3', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (94, '10000094-3', 13, 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (95, '10000095-6', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (96, '10000096-5', 8, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (97, '10000097-6', 19, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (98, '10000098-7', 15, 15 10 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (99, '10000099-1', 5, 5, NOW());INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES (100, '10000100-7', 15, 15 10 5, NOW());
-- ============================================================================================================
-- DATOS PARA DESCUENTOS POR CANTIDAD DE PERSONAS
-- ============================================================================================================
INSERT INTO people_discount (id, min_people, max_people, discount_percentage, is_active, created_at)
VALUES (1, 5, 9, 10, true, NOW());INSERT INTO people_discount (id, min_people, max_people, discount_percentage, is_active, created_at)
VALUES (2, 10, 15, 15, true, NOW());INSERT INTO people_discount (id, min_people, max_people, discount_percentage, is_active, created_at)
VALUES (3, 16, 99, 20, true, NOW());
-- ============================================================================================================
-- DATOS ADICIONALES PARA RF7 (RACK SEMANAL) Y RF8 (REPORTES)
-- ============================================================================================================

-- Insertar reservas distribuidas por diferentes semanas para rack semanal
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2001, 'ClienteW0-D0', 'cliente.w0.d0@test.com', '20000000-3', '2025-07-07', '17:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2002, 'ClienteW0-D1', 'cliente.w0.d1@test.com', '20000001-3', '2025-07-08', '16:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2003, 'ClienteW0-D2', 'cliente.w0.d2@test.com', '20000002-3', '2025-07-09', '10:00:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2004, 'ClienteW0-D3', 'cliente.w0.d3@test.com', '20000003-2', '2025-07-10', '16:00:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2005, 'ClienteW0-D4', 'cliente.w0.d4@test.com', '20000004-5', '2025-07-11', '15:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2011, 'ClienteW1-D0', 'cliente.w1.d0@test.com', '20000010-4', '2025-06-30', '14:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2012, 'ClienteW1-D1', 'cliente.w1.d1@test.com', '20000011-1', '2025-07-01', '15:00:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2013, 'ClienteW1-D2', 'cliente.w1.d2@test.com', '20000012-5', '2025-07-02', '12:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2021, 'ClienteW2-D0', 'cliente.w2.d0@test.com', '20000020-6', '2025-06-23', '16:00:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2022, 'ClienteW2-D1', 'cliente.w2.d1@test.com', '20000021-3', '2025-06-24', '09:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2023, 'ClienteW2-D2', 'cliente.w2.d2@test.com', '20000022-0', '2025-06-25', '12:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2031, 'ClienteW3-D0', 'cliente.w3.d0@test.com', '20000030-6', '2025-06-16', '15:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2032, 'ClienteW3-D1', 'cliente.w3.d1@test.com', '20000031-0', '2025-06-17', '17:00:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2033, 'ClienteW3-D2', 'cliente.w3.d2@test.com', '20000032-4', '2025-06-18', '14:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2034, 'ClienteW3-D3', 'cliente.w3.d3@test.com', '20000033-1', '2025-06-19', '17:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2035, 'ClienteW3-D4', 'cliente.w3.d4@test.com', '20000034-2', '2025-06-20', '17:00:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2036, 'ClienteW3-D5', 'cliente.w3.d5@test.com', '20000035-6', '2025-06-21', '14:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2041, 'ClienteW4-D0', 'cliente.w4.d0@test.com', '20000040-6', '2025-06-09', '12:00:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2042, 'ClienteW4-D1', 'cliente.w4.d1@test.com', '20000041-5', '2025-06-10', '10:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2043, 'ClienteW4-D2', 'cliente.w4.d2@test.com', '20000042-4', '2025-06-11', '09:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2044, 'ClienteW4-D3', 'cliente.w4.d3@test.com', '20000043-8', '2025-06-12', '10:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2051, 'ClienteW5-D0', 'cliente.w5.d0@test.com', '20000050-6', '2025-06-02', '14:00:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2052, 'ClienteW5-D1', 'cliente.w5.d1@test.com', '20000051-5', '2025-06-03', '16:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2053, 'ClienteW5-D2', 'cliente.w5.d2@test.com', '20000052-4', '2025-06-04', '09:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2054, 'ClienteW5-D3', 'cliente.w5.d3@test.com', '20000053-8', '2025-06-05', '13:00:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2055, 'ClienteW5-D4', 'cliente.w5.d4@test.com', '20000054-5', '2025-06-06', '14:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2056, 'ClienteW5-D5', 'cliente.w5.d5@test.com', '20000055-8', '2025-06-07', '17:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2061, 'ClienteW6-D0', 'cliente.w6.d0@test.com', '20000060-1', '2025-05-26', '12:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2062, 'ClienteW6-D1', 'cliente.w6.d1@test.com', '20000061-1', '2025-05-27', '13:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2063, 'ClienteW6-D2', 'cliente.w6.d2@test.com', '20000062-1', '2025-05-28', '12:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2071, 'ClienteW7-D0', 'cliente.w7.d0@test.com', '20000070-3', '2025-05-19', '17:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2072, 'ClienteW7-D1', 'cliente.w7.d1@test.com', '20000071-8', '2025-05-20', '10:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2073, 'ClienteW7-D2', 'cliente.w7.d2@test.com', '20000072-7', '2025-05-21', '10:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2074, 'ClienteW7-D3', 'cliente.w7.d3@test.com', '20000073-1', '2025-05-22', '11:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2075, 'ClienteW7-D4', 'cliente.w7.d4@test.com', '20000074-3', '2025-05-23', '17:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2081, 'ClienteW8-D0', 'cliente.w8.d0@test.com', '20000080-6', '2025-05-12', '15:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2082, 'ClienteW8-D1', 'cliente.w8.d1@test.com', '20000081-7', '2025-05-13', '14:00:00', 1, 45, 1125, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2083, 'ClienteW8-D2', 'cliente.w8.d2@test.com', '20000082-6', '2025-05-14', '12:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2091, 'ClienteW9-D0', 'cliente.w9.d0@test.com', '20000090-2', '2025-05-05', '17:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2092, 'ClienteW9-D1', 'cliente.w9.d1@test.com', '20000091-7', '2025-05-06', '12:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2093, 'ClienteW9-D2', 'cliente.w9.d2@test.com', '20000092-4', '2025-05-07', '12:00:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2101, 'ClienteW10-D0', 'cliente.w10.d0@test.com', '20000100-5', '2025-04-28', '15:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2102, 'ClienteW10-D1', 'cliente.w10.d1@test.com', '20000101-2', '2025-04-29', '10:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2103, 'ClienteW10-D2', 'cliente.w10.d2@test.com', '20000102-4', '2025-04-30', '15:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2104, 'ClienteW10-D3', 'cliente.w10.d3@test.com', '20000103-0', '2025-05-01', '15:00:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2111, 'ClienteW11-D0', 'cliente.w11.d0@test.com', '20000110-2', '2025-04-21', '15:00:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2112, 'ClienteW11-D1', 'cliente.w11.d1@test.com', '20000111-4', '2025-04-22', '16:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2113, 'ClienteW11-D2', 'cliente.w11.d2@test.com', '20000112-5', '2025-04-23', '10:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2114, 'ClienteW11-D3', 'cliente.w11.d3@test.com', '20000113-8', '2025-04-24', '15:00:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2121, 'ClienteW12-D0', 'cliente.w12.d0@test.com', '20000120-6', '2025-04-14', '16:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2122, 'ClienteW12-D1', 'cliente.w12.d1@test.com', '20000121-4', '2025-04-15', '12:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2123, 'ClienteW12-D2', 'cliente.w12.d2@test.com', '20000122-6', '2025-04-16', '11:00:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2124, 'ClienteW12-D3', 'cliente.w12.d3@test.com', '20000123-5', '2025-04-17', '12:00:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2125, 'ClienteW12-D4', 'cliente.w12.d4@test.com', '20000124-8', '2025-04-18', '16:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2126, 'ClienteW12-D5', 'cliente.w12.d5@test.com', '20000125-0', '2025-04-19', '13:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2131, 'ClienteW13-D0', 'cliente.w13.d0@test.com', '20000130-5', '2025-04-07', '09:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2132, 'ClienteW13-D1', 'cliente.w13.d1@test.com', '20000131-8', '2025-04-08', '13:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2133, 'ClienteW13-D2', 'cliente.w13.d2@test.com', '20000132-1', '2025-04-09', '12:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2141, 'ClienteW14-D0', 'cliente.w14.d0@test.com', '20000140-7', '2025-03-31', '09:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2142, 'ClienteW14-D1', 'cliente.w14.d1@test.com', '20000141-8', '2025-04-01', '14:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2143, 'ClienteW14-D2', 'cliente.w14.d2@test.com', '20000142-2', '2025-04-02', '10:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2144, 'ClienteW14-D3', 'cliente.w14.d3@test.com', '20000143-7', '2025-04-03', '17:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2145, 'ClienteW14-D4', 'cliente.w14.d4@test.com', '20000144-2', '2025-04-04', '11:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2146, 'ClienteW14-D5', 'cliente.w14.d5@test.com', '20000145-4', '2025-04-05', '11:00:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2147, 'ClienteW14-D6', 'cliente.w14.d6@test.com', '20000146-4', '2025-04-06', '15:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2151, 'ClienteW15-D0', 'cliente.w15.d0@test.com', '20000150-4', '2025-03-24', '09:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2152, 'ClienteW15-D1', 'cliente.w15.d1@test.com', '20000151-4', '2025-03-25', '16:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2153, 'ClienteW15-D2', 'cliente.w15.d2@test.com', '20000152-3', '2025-03-26', '10:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2161, 'ClienteW16-D0', 'cliente.w16.d0@test.com', '20000160-5', '2025-03-17', '12:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2162, 'ClienteW16-D1', 'cliente.w16.d1@test.com', '20000161-4', '2025-03-18', '15:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2163, 'ClienteW16-D2', 'cliente.w16.d2@test.com', '20000162-2', '2025-03-19', '09:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2164, 'ClienteW16-D3', 'cliente.w16.d3@test.com', '20000163-2', '2025-03-20', '12:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2165, 'ClienteW16-D4', 'cliente.w16.d4@test.com', '20000164-2', '2025-03-21', '16:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2166, 'ClienteW16-D5', 'cliente.w16.d5@test.com', '20000165-4', '2025-03-22', '15:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2171, 'ClienteW17-D0', 'cliente.w17.d0@test.com', '20000170-7', '2025-03-10', '10:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2172, 'ClienteW17-D1', 'cliente.w17.d1@test.com', '20000171-4', '2025-03-11', '11:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2173, 'ClienteW17-D2', 'cliente.w17.d2@test.com', '20000172-2', '2025-03-12', '14:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2174, 'ClienteW17-D3', 'cliente.w17.d3@test.com', '20000173-8', '2025-03-13', '15:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2175, 'ClienteW17-D4', 'cliente.w17.d4@test.com', '20000174-8', '2025-03-14', '16:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2176, 'ClienteW17-D5', 'cliente.w17.d5@test.com', '20000175-3', '2025-03-15', '16:00:00', 4, 30, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2177, 'ClienteW17-D6', 'cliente.w17.d6@test.com', '20000176-3', '2025-03-16', '09:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2181, 'ClienteW18-D0', 'cliente.w18.d0@test.com', '20000180-6', '2025-03-03', '11:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2182, 'ClienteW18-D1', 'cliente.w18.d1@test.com', '20000181-5', '2025-03-04', '14:00:00', 4, 45, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2183, 'ClienteW18-D2', 'cliente.w18.d2@test.com', '20000182-4', '2025-03-05', '15:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2191, 'ClienteW19-D0', 'cliente.w19.d0@test.com', '20000190-8', '2025-02-24', '09:00:00', 1, 60, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2192, 'ClienteW19-D1', 'cliente.w19.d1@test.com', '20000191-0', '2025-02-25', '15:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2193, 'ClienteW19-D2', 'cliente.w19.d2@test.com', '20000192-3', '2025-02-26', '09:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2194, 'ClienteW19-D3', 'cliente.w19.d3@test.com', '20000193-1', '2025-02-27', '12:00:00', 3, 60, 4500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2201, 'ClienteW20-D0', 'cliente.w20.d0@test.com', '20000200-5', '2025-02-17', '10:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2202, 'ClienteW20-D1', 'cliente.w20.d1@test.com', '20000201-3', '2025-02-18', '10:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2203, 'ClienteW20-D2', 'cliente.w20.d2@test.com', '20000202-1', '2025-02-19', '16:00:00', 5, 45, 5625, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2204, 'ClienteW20-D3', 'cliente.w20.d3@test.com', '20000203-8', '2025-02-20', '16:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2205, 'ClienteW20-D4', 'cliente.w20.d4@test.com', '20000204-8', '2025-02-21', '13:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2211, 'ClienteW21-D0', 'cliente.w21.d0@test.com', '20000210-1', '2025-02-10', '15:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2212, 'ClienteW21-D1', 'cliente.w21.d1@test.com', '20000211-6', '2025-02-11', '14:00:00', 2, 60, 3000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2213, 'ClienteW21-D2', 'cliente.w21.d2@test.com', '20000212-7', '2025-02-12', '13:00:00', 1, 30, 750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2214, 'ClienteW21-D3', 'cliente.w21.d3@test.com', '20000213-8', '2025-02-13', '10:00:00', 5, 30, 3750, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2215, 'ClienteW21-D4', 'cliente.w21.d4@test.com', '20000214-7', '2025-02-14', '10:00:00', 3, 45, 3375, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2221, 'ClienteW22-D0', 'cliente.w22.d0@test.com', '20000220-2', '2025-02-03', '15:00:00', 2, 30, 1500, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2222, 'ClienteW22-D1', 'cliente.w22.d1@test.com', '20000221-1', '2025-02-04', '16:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2223, 'ClienteW22-D2', 'cliente.w22.d2@test.com', '20000222-5', '2025-02-05', '12:00:00', 3, 30, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2231, 'ClienteW23-D0', 'cliente.w23.d0@test.com', '20000230-4', '2025-01-27', '12:00:00', 2, 45, 2250, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2232, 'ClienteW23-D1', 'cliente.w23.d1@test.com', '20000231-0', '2025-01-28', '13:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2233, 'ClienteW23-D2', 'cliente.w23.d2@test.com', '20000232-6', '2025-01-29', '17:00:00', 4, 60, 6000, 'CONFIRMED', NOW(), NOW());
INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES (2234, 'ClienteW23-D3', 'cliente.w23.d3@test.com', '20000233-4', '2025-01-30', '15:00:00', 5, 60, 7500, 'CONFIRMED', NOW(), NOW());
-- ============================================================================================================
-- FINALIZACIÓN
-- ============================================================================================================

-- Actualizar estadísticas
ANALYZE TABLE reserves;
ANALYZE TABLE frequent_customer;
ANALYZE TABLE people_discount;

-- Confirmar datos insertados
SELECT 'RESERVAS' as tabla, COUNT(*) as registros FROM reserves
UNION ALL
SELECT 'CLIENTES_FRECUENTES' as tabla, COUNT(*) as registros FROM frequent_customer
UNION ALL
SELECT 'DESCUENTOS_PERSONAS' as tabla, COUNT(*) as registros FROM people_discount;

-- ============================================================================================================
-- SCRIPT COMPLETADO EXITOSAMENTE
-- ============================================================================================================
