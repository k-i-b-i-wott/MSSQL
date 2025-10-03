CREATE DATABASE CarRentalDb;

CREATE SCHEMA cars;


CREATE TABLE cars.car(
car_id INT IDENTITY(1,1) PRIMARY KEY,
car_model VARCHAR(30) NOT NULL,
manufucturer VARCHAR(30) NOT NULL,
year INT NOT NULL,
color VARCHAR(20) NOT NULL,
rental_rate MONEY NOT NULL,
availability VARCHAR(50) NOT NULL,

);

INSERT INTO cars.car (car_model, manufucturer, year, color, rental_rate, availability)
VALUES
('Camry', 'Toyota', 2023, 'White', 45.00, 'Available'),
('Civic', 'Honda', 2022, 'Black', 40.00, 'Available'),
('Model 3', 'Tesla', 2024, 'Red', 75.00, 'Rented'),
('Accord', 'Honda', 2023, 'Blue', 42.00, 'Available'),
('F-150', 'Ford', 2022, 'Silver', 65.00, 'Available'),
('X5', 'BMW', 2024, 'Black', 85.00, 'Available'),
('Corolla', 'Toyota', 2023, 'Gray', 38.00, 'Maintenance'),
('Mustang', 'Ford', 2024, 'Yellow', 70.00, 'Available'),
('CX-5', 'Mazda', 2023, 'White', 48.00, 'Rented'),
('Altima', 'Nissan', 2022, 'Blue', 35.00, 'Available');

SELECT * FROM cars.car;

CREATE TABLE cars.insurance(
insurance_id INT IDENTITY(1,1) PRIMARY KEY,
car_id INT NOT NULL,
insurance_provider VARCHAR(50) NOT NULL,
policy_number VARCHAR(30) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
);

INSERT INTO cars.insurance (car_id, insurance_provider, policy_number, start_date, end_date)
VALUES
(1, 'Geico', 'GEC-001-2024', '2024-01-01', '2024-12-31'),
(2, 'State Farm', 'STF-002-2024', '2024-02-01', '2024-11-30'),
(3, 'Allstate', 'ALL-003-2024', '2024-03-15', '2025-03-14'),
(4, 'Progressive', 'PRO-004-2024', '2024-01-20', '2024-12-19'),
(5, 'Liberty Mutual', 'LBM-005-2024', '2024-04-01', '2025-03-31'),
(6, 'Nationwide', 'NTW-006-2024', '2024-05-10', '2025-05-09'),
(7, 'Farmers', 'FRM-007-2024', '2024-06-01', '2024-11-30'),
(8, 'USAA', 'USA-008-2024', '2024-02-15', '2025-02-14'),
(9, 'Travelers', 'TRV-009-2024', '2024-03-01', '2024-08-31'),
(10, 'American Family', 'AMF-010-2024', '2024-07-01', '2025-06-30');

SELECT * FROM cars.insurance;