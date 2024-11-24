DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;
USE CarDealership;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

INSERT INTO dealerships (name, address, phone)
VALUES
    ('AutoWorld', '123 Main St', '555-123-4567'),
    ('CarNation', '456 Elm St', '555-987-6543'),
    ('DriveAway Motors', '789 Oak St', '555-555-5555');

CREATE TABLE vehicles (
    vin VARCHAR(6) PRIMARY KEY,
    year INT,
    make VARCHAR(50),
    model VARCHAR(50),
    type VARCHAR(20),
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10, 2),
    sold BOOLEAN
);

INSERT INTO vehicles (vin, year, make, model, type, color, mileage, price, sold)
VALUES
    ('54123', 1993, 'Ford', 'Explorer', 'SUV', 'Red', 525123, 995.00, FALSE),
    ('38764', 2001, 'Ford', 'Ranger', 'Truck', 'Yellow', 172544, 1995.00, FALSE),
    ('49218', 2012, 'Honda', 'Civic', 'SUV', 'Grey', 103221, 6995.00, TRUE),
    ('50345', 2003, 'Toyota', 'Camry', 'Car', 'Blue', 120321, 2995.00, FALSE),
    ('61289', 2015, 'Ford', 'Escape', 'SUV', 'White', 98322, 12995.00, FALSE),
    ('73692', 2018, 'Chevrolet', 'Equinox', 'SUV', 'Black', 65321, 15995.00, TRUE),
    ('84519', 2010, 'Ford', 'F-150', 'Truck', 'Silver', 140234, 10995.00, FALSE),
    ('92357', 2007, 'Honda', 'Accord', 'Car', 'Red', 110432, 6995.00, FALSE),
    ('10459', 2019, 'Toyota', 'Tacoma', 'Truck', 'Grey', 43221, 23995.00, FALSE),
    ('11534', 2016, 'Ford', 'Mustang', 'Car', 'Yellow', 50234, 17995.00, TRUE),
    ('12847', 2021, 'Tesla', 'Model 3', 'Car', 'White', 12345, 34995.00, FALSE),
    ('13983', 2009, 'Jeep', 'Wrangler', 'SUV', 'Green', 97557, 14995.00, FALSE),
    ('15017', 2012, 'Honda', 'CR-V', 'SUV', 'Blue', 75000, 13995.00, TRUE),
    ('16178', 2005, 'Toyota', 'Sienna', 'Van', 'Grey', 130210, 8995.00, FALSE),
    ('17950', 2014, 'Chevrolet', 'Silverado', 'Truck', 'Black', 115395, 16995.00, TRUE),
    ('19872', 2008, 'Nissan', 'Altima', 'Car', 'Blue', 100987, 5995.00, FALSE),
    ('21134', 2020, 'Chevrolet', 'Camaro', 'Car', 'Red', 21016, 25995.00, FALSE),
    ('23089', 2017, 'Dodge', 'Grand Caravan', 'Van', 'Silver', 72876, 15995.00, FALSE),
    ('24673', 2013, 'Hyundai', 'Elantra', 'Car', 'Grey', 85364, 8995.00, FALSE),
    ('26784', 2011, 'Ford', 'Explorer', 'SUV', 'Red', 105234, 10995.00, TRUE),
    ('27946', 2018, 'Chrysler', 'Pacifica', 'Van', 'Black', 63783, 18995.00, FALSE);

CREATE TABLE inventory (
    dealership_id INT,
    vin VARCHAR(6),
    PRIMARY KEY (dealership_id, vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

INSERT INTO inventory (dealership_id, vin)
VALUES
    (1, '54123'),
    (1, '38764'),
    (1, '49218'),
    (2, '50345'),
    (2, '61289'),
    (2, '73692'),
    (2, '84519'),
    (3, '92357'),
    (3, '10459'),
    (3, '11534'),
    (3, '12847'),
    (3, '13983'),
    (1, '15017'),
    (2, '16178'),
    (3, '17950'),
    (1, '19872'),
    (2, '21134'),
    (2, '23089'),
    (3, '24673'),
    (1, '26784'),
    (3, '27946');

CREATE TABLE sales_contracts (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(6),
    customer_name VARCHAR(50),
    date_of_sale DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

INSERT INTO sales_contracts (vin, customer_name, date_of_sale, price)
VALUES
    ('49218', 'John Doe', '2024-01-15', 6995.00),
    ('73692', 'Jane Smith', '2024-03-10', 15995.00),
    ('11534', 'Samuel Green', '2024-05-20', 17995.00),
    ('15017', 'Alice Johnson', '2024-06-12', 13995.00),
    ('17950', 'Mark Davis', '2024-07-18', 16995.00),
    ('26784', 'Emily Brown', '2024-08-01', 10995.00);
    
CREATE TABLE lease_contracts (
    lease_id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(6),
    customer_name VARCHAR(50),
    lease_start_date DATE,
    lease_end_date DATE,
    monthly_payment DECIMAL(10, 2),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);
    
INSERT INTO lease_contracts (vin, customer_name, lease_start_date, lease_end_date, monthly_payment)
VALUES
    ('10459', 'Michael Scott', '2024-01-01', '2027-01-01', 399.99),
    ('12847', 'Dwight Schrute', '2024-02-15', '2027-02-15', 499.99),
    ('13983', 'Pam Beesly', '2024-03-01', '2026-03-01', 349.99),
    ('21134', 'Jim Halpert', '2024-04-01', '2027-04-01', 599.99),
    ('23089', 'Stanley Hudson', '2024-05-15', '2026-05-15', 299.99),
    ('27946', 'Ryan Howard', '2024-06-01', '2027-06-01', 399.99);