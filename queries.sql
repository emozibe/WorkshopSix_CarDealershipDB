-- Query 1: Get all dealerships
SELECT * FROM dealerships;

-- Query 2: Find all vehicles for a specific dealership
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
WHERE i.dealership_id = 1; -- Replace 1 with the desired dealership_id

-- Query 3: Find a car by VIN
SELECT *
FROM vehicles
WHERE vin = '12345'; -- Replace '49218' with the desired VIN

-- Query 4: Find the dealership where a certain car is located, by VIN
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.vin = '12345'; -- Replace '49218' with the desired VIN

-- Query 5: Find all dealerships that have a certain car type (e.g., Red Ford Mustang)
SELECT DISTINCT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.make = 'Ford' AND v.model = 'Mustang' AND v.color = 'Red'; -- Replace with desired make, model, and color

-- Query 6: Get all sales information for a specific dealer for a specific date range
SELECT sc.*
FROM sales_contracts sc
JOIN inventory i ON sc.vin = i.vin
WHERE i.dealership_id = 1 -- Replace 1 with the desired dealership_id
  AND sc.date_of_sale BETWEEN '2024-01-01' AND '2024-12-31'; -- Replace date range