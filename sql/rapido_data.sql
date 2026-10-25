USE rapido_db;

INSERT INTO users (full_name, phone_number, email, created_at) VALUES
('Arjun Mehta',   '9876500001', 'arjun.mehta@gmail.com',   '2026-01-12 09:15:00'),
('Priya Sharma',  '9876500002', 'priya.sharma@gmail.com',  '2026-02-03 11:40:00'),
('Rohan Das',     '9876500003', 'rohan.das@gmail.com',     '2026-02-18 16:05:00'),
('Ananya Iyer',   '9876500004', 'ananya.iyer@gmail.com',   '2026-03-05 08:22:00'),
('Vikram Singh',  '9876500005', 'vikram.singh@gmail.com',  '2026-03-21 19:10:00'),
('Sneha Reddy',   '9876500006', 'sneha.reddy@gmail.com',   '2026-04-09 13:33:00'),
('Karan Patel',   '9876500007', 'karan.patel@gmail.com',   '2026-05-01 10:00:00'),
('Meera Nair',    '9876500008', 'meera.nair@gmail.com',    '2026-05-16 17:45:00');

INSERT INTO vehicles (vehicle_type, registration_number, model, capacity) VALUES
('Bike', 'KA01AB1234', 'Honda Activa',  1),
('Bike', 'KA02CD5678', 'TVS Ntorq',     1),
('Auto', 'KA03EF9012', 'Bajaj RE',      3),
('Cab',  'KA04GH3456', 'Suzuki Dzire',  4),
('Cab',  'KA05IJ7890', 'Hyundai Aura',  4),
('Bike', 'KA06KL1122', 'Ather 450X',    1);

INSERT INTO captains (full_name, phone_number, vehicle_id, rating) VALUES
('Ravi Kumar',   '9988000001', 1, 4.70),
('Sunil Rao',    '9988000002', 2, 4.50),
('Imran Khan',   '9988000003', 3, 4.20),
('Deepak Joshi', '9988000004', 4, 4.80),
('Lakshmi Bai',  '9988000005', 5, 4.60),
('Manoj Gowda',  '9988000006', 6, 4.30);

INSERT INTO zones (zone_name, city) VALUES
('Koramangala', 'Bengaluru'),
('Indiranagar', 'Bengaluru'),
('Whitefield',  'Bengaluru'),
('HSR Layout',  'Bengaluru'),
('MG Road',     'Bengaluru');

INSERT INTO captain_zones (captain_id, zone_id) VALUES
(1, 1), (1, 2),
(2, 2), (2, 4),
(3, 1), (3, 5),
(4, 3), (4, 1),
(5, 5), (5, 2),
(6, 4), (6, 3);

INSERT INTO rides (user_id, captain_id, pickup_location, drop_location, fare, status, requested_at) VALUES
(1, 1, 'Koramangala', 'HSR Layout',   85.00,  'Completed', '2026-06-02 08:10:00'),
(2, 2, 'Indiranagar', 'MG Road',     120.00,  'Completed', '2026-06-03 09:25:00'),
(3, 4, 'Whitefield',  'Koramangala', 340.00,  'Completed', '2026-06-04 18:40:00'),
(1, 3, 'HSR Layout',  'MG Road',      95.00,  'Completed', '2026-06-08 21:05:00'),
(4, 5, 'MG Road',     'Indiranagar', 150.00,  'Completed', '2026-06-10 12:15:00'),
(5, 6, 'Whitefield',  'HSR Layout',  280.00,  'Completed', '2026-07-01 07:50:00'),
(6, 1, 'Koramangala', 'Indiranagar',  70.00,  'Ongoing',   '2026-09-12 19:20:00'),
(2, 4, 'MG Road',     'Whitefield',  360.00,  'Requested', '2026-09-15 08:00:00'),
(7, 2, 'HSR Layout',  'Koramangala',  90.00,  'Cancelled', '2026-07-18 14:30:00'),
(8, 5, 'Indiranagar', 'Whitefield',  310.00,  'Completed', '2026-07-22 16:45:00'),
(3, 6, 'HSR Layout',  'Whitefield',  250.00,  'Completed', '2026-08-05 11:10:00'),
(4, 1, 'Koramangala', 'MG Road',     100.00,  'Completed', '2026-08-11 20:05:00'),
(5, 3, 'MG Road',     'Koramangala',  80.00,  'Completed', '2026-08-19 09:35:00'),
(6, 2, 'Indiranagar', 'HSR Layout',   75.00,  'Completed', '2026-08-28 13:55:00'),
(8, 4, 'Whitefield',  'MG Road',     330.00,  'Ongoing',   '2026-09-20 17:10:00');

INSERT INTO payments (ride_id, amount, payment_method, payment_status, payment_time) VALUES
(1,  85.00, 'UPI',    'Success', '2026-06-02 08:28:00'),
(2, 120.00, 'UPI',    'Success', '2026-06-03 09:48:00'),
(3, 340.00, 'Card',   'Success', '2026-06-04 19:22:00'),
(4,  95.00, 'Cash',   'Success', '2026-06-08 21:22:00'),
(5, 150.00, 'UPI',    'Success', '2026-06-10 12:36:00'),
(6, 280.00, 'Wallet', 'Success', '2026-07-01 08:21:00'),
(10, 310.00, 'Card',  'Success', '2026-07-22 17:20:00'),
(11, 250.00, 'UPI',   'Success', '2026-08-05 11:48:00'),
(12, 100.00, 'Cash',  'Success', '2026-08-11 20:24:00'),
(13,  80.00, 'UPI',   'Failed',  '2026-08-19 09:50:00'),
(14,  75.00, 'UPI',   'Success', '2026-08-28 14:12:00');
