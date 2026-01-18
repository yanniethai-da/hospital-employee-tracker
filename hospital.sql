-- ============================================
-- hospital.sql
-- Realistic badge-swipe data for testing
-- Project: Hospital Employee IN/OUT Tracker 
-- ============================================
SET SQL_SAFE_UPDATES = 0;
DELETE FROM hospital;
SET SQL_SAFE_UPDATES = 1;

CREATE TABLE IF NOT EXISTS hospital ( emp_id int
, action varchar(10)
, time datetime);

-- Employee 1: normal in/out cycle
INSERT INTO hospital VALUES (1, 'in',  '2019-12-22 08:55:00');
INSERT INTO hospital VALUES (1, 'out', '2019-12-22 12:00:00');
INSERT INTO hospital VALUES (1, 'in',  '2019-12-22 13:00:00');
INSERT INTO hospital VALUES (1, 'out', '2019-12-22 17:00:00');

-- Employee 2: missing OUT (still inside)
INSERT INTO hospital VALUES (2, 'in',  '2019-12-22 09:10:00');
INSERT INTO hospital VALUES (2, 'out', '2019-12-22 12:00:00');
INSERT INTO hospital VALUES (2, 'in',  '2019-12-22 14:00:00');

-- Employee 3: OUT before IN (messy logs)
INSERT INTO hospital VALUES (3, 'out', '2019-12-22 08:00:00');
INSERT INTO hospital VALUES (3, 'in',  '2019-12-22 08:30:00');
INSERT INTO hospital VALUES (3, 'out', '2019-12-22 09:00:00');
INSERT INTO hospital VALUES (3, 'in',  '2019-12-22 09:15:00');

-- Employee 4: only IN (still inside)
INSERT INTO hospital VALUES (4, 'in',  '2019-12-22 10:00:00');

-- Employee 5: OUT only (never inside)
INSERT INTO hospital VALUES (5, 'out', '2019-12-22 09:40:00');

-- Employee 6: multiple INs without OUTs (badge errors)
INSERT INTO hospital VALUES (6, 'in',  '2019-12-22 07:00:00');
INSERT INTO hospital VALUES (6, 'in',  '2019-12-22 07:05:00');
INSERT INTO hospital VALUES (6, 'out', '2019-12-22 12:00:00');
INSERT INTO hospital VALUES (6, 'in',  '2019-12-22 13:00:00');

-- Employee 7: overnight shift
INSERT INTO hospital VALUES (7, 'in',  '2019-12-21 22:00:00');
INSERT INTO hospital VALUES (7, 'out', '2019-12-22 06:00:00');

-- Employee 8: enters and leaves multiple times
INSERT INTO hospital VALUES (8, 'in',  '2019-12-22 09:00:00');
INSERT INTO hospital VALUES (8, 'out', '2019-12-22 09:30:00');
INSERT INTO hospital VALUES (8, 'in',  '2019-12-22 10:00:00');
INSERT INTO hospital VALUES (8, 'out', '2019-12-22 10:15:00');


