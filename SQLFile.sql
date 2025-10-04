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

CREATE TABLE cars.Insurance (
    insurance_id INT IDENTITY(1,1) PRIMARY KEY,
    car_id INT,
    insurance_provider VARCHAR(50),
    policy_number VARCHAR(30),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (car_id) REFERENCES cars.Car(car_id)
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

SELECT * FROM cars.Insurance;

DROP TABLE cars.Insurance;


CREATE TABLE cars.maintainance(
maintainace_id INT IDENTITY(1,1) PRIMARY KEY,
car_id INT NOT NULL,
maintainance_date DATE NOT NULL,
description VARCHAR(MAX) NOT NULL,
cost MONEY NOT NULL

);

--rename table name

EXEC sp_rename 'cars.maintainance', 'maintenance';

INSERT INTO cars.maintenance (car_id, maintainance_date, description, cost)
VALUES
(1, '2024-03-15', 'Regular oil change and filter replacement', 85.00),
(2, '2024-02-20', 'Brake pad replacement and rotor resurfacing', 320.00),
(3, '2024-04-10', 'Tire rotation and battery check', 65.00),
(4, '2024-01-25', 'Engine tune-up and spark plug replacement', 180.00),
(5, '2024-05-05', 'Transmission fluid flush and replacement', 250.00),
(6, '2024-03-30', 'Air conditioning system service and recharge', 150.00),
(7, '2024-02-10', 'Wheel alignment and suspension check', 120.00),
(8, '2024-04-22', 'Complete detailing and interior cleaning', 200.00),
(9, '2024-01-15', 'Fuel system cleaning and injector service', 95.00),
(10, '2024-05-12', 'Coolant flush and radiator service', 110.00);

SELECT * FROM cars.maintenance;


CREATE TABLE cars.Customer (
    customer_id INT  PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(MAX),
    phone_number VARCHAR(13),
    address VARCHAR(20)
);

INSERT INTO cars.Customer (customer_id, firstName, lastName, email, phone_number, address) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '0712345678', 'Nairobi'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '0723456789', 'Mombasa'),
(3, 'Alice', 'Brown', 'alice.brown@email.com', '0734567890', 'Kisumu'),
(4, 'Bob', 'Johnson', 'bob.j@email.com', '0745678901', 'Nakuru'),
(5, 'Charlie', 'Lee', 'charlie.lee@email.com', '0756789012', 'Eldoret');

SELECT * FROM  cars.Customer;
DROP TABLE cars.Customer;

CREATE TABLE cars.Location (
    location_id INT  PRIMARY KEY,
    car_id INT,
    location_name VARCHAR(50),
    address VARCHAR(30),
    contact_number VARCHAR(13),
    FOREIGN KEY (car_id) REFERENCES cars.car(car_id)
);

INSERT INTO cars.Location (location_id, car_id, location_name, address, contact_number) VALUES
(1, 1, 'Nairobi Branch', 'Moi Avenue', '0711000001'),
(2, 2, 'Mombasa Branch', 'Nkrumah Rd', '0711000002'),
(3, 3, 'Kisumu Branch', 'Oginga Odinga St', '0711000003'),
(4, 4, 'Nakuru Branch', 'Kenyatta Ave', '0711000004'),
(5, 5, 'Eldoret Branch', 'Uganda Rd', '0711000005');

SELECT * FROM cars.Location;

CREATE TABLE cars.Reservation (
    reservation_id INT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    reservation_date DATE,
    pickup_date DATE,
    return_date DATE,
    FOREIGN KEY (car_id) REFERENCES cars.Car(car_id),
    FOREIGN KEY (customer_id) REFERENCES cars.Customer(customer_id)
);

INSERT INTO cars.Reservation (reservation_id, car_id, customer_id, reservation_date, pickup_date, return_date) VALUES
(1, 1, 1, '2024-01-10', '2024-01-12', '2024-01-15'),
(2, 2, 2, '2024-02-05', '2024-02-06', '2024-02-10'),
(3, 3, 3, '2024-03-01', '2024-03-03', '2024-03-07'),
(4, 4, 4, '2024-04-08', '2024-04-10', '2024-04-14'),
(5, 5, 5, '2024-05-12', '2024-05-13', '2024-05-17');


CREATE TABLE cars.Booking (
    booking_id INT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    rental_start_date DATETIME,
    rental_end_date DATETIME,
    total_money MONEY,
    FOREIGN KEY (car_id) REFERENCES cars.Car(car_id),
    FOREIGN KEY (customer_id) REFERENCES cars.Customer(customer_id)
);

INSERT INTO cars.Booking (booking_id, car_id, customer_id, rental_start_date, rental_end_date, total_money) VALUES
(1, 1, 1, '2024-01-12 09:00:00', '2024-01-15 18:00:00', 120.00),
(2, 2, 2, '2024-02-06 10:00:00', '2024-02-10 16:00:00', 180.00),
(3, 3, 3, '2024-03-03 08:00:00', '2024-03-07 20:00:00', 400.00),
(4, 4, 4, '2024-04-10 09:00:00', '2024-04-14 18:00:00', 200.00),
(5, 5, 5, '2024-05-13 07:00:00', '2024-05-17 22:00:00', 168.00);

SELECT * FROM cars.Booking;
CREATE TABLE cars.Payment (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    amount MONEY,
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES cars.Booking(booking_id)
);


INSERT INTO cars.Payment (payment_id, booking_id, payment_date, amount, payment_method) VALUES
(1, 1, '2024-01-15', 120.00, 'Credit Card'),
(2, 2, '2024-02-10', 180.00, 'Cash'),
(3, 3, '2024-03-07', 400.00, 'Mobile Money'),
(4, 4, '2024-04-14', 200.00, 'Credit Card'),
(5, 5, '2024-05-17', 168.00, 'Cash');

SELECT * FROM cars.Payment;
