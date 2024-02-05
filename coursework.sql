-- Using MySQL

-- Uses the estate_agent_db database
USE estate_agent_db;

-- Drops the tables if they exist to avoid conflicts
DROP TABLE IF EXISTS forSale;
DROP TABLE IF EXISTS sold;
DROP TABLE IF EXISTS forRent;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS agency;

-- Table to store information about agencies
CREATE TABLE agency (
    Id INT PRIMARY KEY,-- Unique identifier for the agency
    Name VARCHAR(40),-- Name of the agency
    PhoneNumber VARCHAR(15)-- Contact phone number for the agency
);

-- Table to store information about offices associated with the agency
CREATE TABLE office (
    Id INT PRIMARY KEY,-- Unique identifier for the office
    AgencyId INT,
    Area VARCHAR(5),
    District VARCHAR(5),
    Sector VARCHAR(5),
    Unit VARCHAR(5),
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (AgencyId) REFERENCES agency(Id)-- Foreign key referencing agency table
);

-- Table to store information about the properties
CREATE TABLE property (
    Id INT PRIMARY KEY,-- Unique identifier for the property
    OfficeId INT,
    Area VARCHAR(5),
    District VARCHAR(5),
    Sector VARCHAR(5),
    Unit VARCHAR(5),
    City VARCHAR(30),
    Price DECIMAL(10, 2),
    Type VARCHAR(10),
    NumBedrooms INT,
    Description TEXT,
    FOREIGN KEY (OfficeId) REFERENCES office(Id)-- Foreign key referencing office table
);

-- Table to store information about customers
CREATE TABLE customer (
    Id INT PRIMARY KEY,-- Unique identifier for the customer
    Name VARCHAR(30),
    PhoneNumber VARCHAR(15)
);

-- Table to link the properties for sale with the offices
CREATE TABLE forSale (
    PropertyId INT,
    OfficeId INT,
    FOREIGN KEY (PropertyId) REFERENCES property(Id),-- Foreign key referencing property table
    FOREIGN KEY (OfficeId) REFERENCES office(Id)-- Foreign key referencing office table
);

-- Table to link properties for rent with the offices and customers
CREATE TABLE forRent (
    PropertyId INT,
    OfficeId INT,
    CustomerId INT,
    FOREIGN KEY (PropertyId) REFERENCES property(Id),-- Foreign key referencing property table
    FOREIGN KEY (OfficeId) REFERENCES office(Id),-- Foreign key referencing office table
    FOREIGN KEY (CustomerId) REFERENCES customer(Id)-- Foreign key referencing customer table
);

-- Table to store information about properties that have been sold
CREATE TABLE sold (
    PropertyId INT,
    OfficeId INT,
    CustomerId INT,
    FOREIGN KEY (PropertyId) REFERENCES property(Id),-- Foreign key referencing property table
    FOREIGN KEY (OfficeId) REFERENCES office(Id),-- Foreign key referencing office table
    FOREIGN KEY (CustomerId) REFERENCES customer(Id)-- Foreign key referencing customer table
);

-- Inserting data into tables

-- Inserting data into the 'agency' table
INSERT INTO agency (Id, Name, PhoneNumber) VALUES
(1, 'Agency 1', '123-456-7890'),
(2, 'Agency 2', '234-567-8901'),
(3, 'Agency 3', '345-678-9012'),
(4, 'Agency 4', '456-789-0123'),
(5, 'Agency 5', '567-890-1234'),
(6, 'Agency 6', '678-901-2345'),
(7, 'Agency 7', '789-012-3456'),
(8, 'Agency 8', '890-123-4567'),
(9, 'Agency 9', '901-234-5678'),
(10, 'Agency 10', '012-345-6789');

-- Inserting data into the 'office' table
INSERT INTO office (Id, AgencyId, Area, District, Sector, Unit, PhoneNumber) VALUES
(1, 1, 'E', '1', 'A', '101', '223-456-7890'),
(2, 1, 'W', '2', 'B', '202', '323-456-7891'),
(3, 2, 'S', '3', 'C', '303', '423-456-7892'),
(4, 3, 'N', '4', 'D', '404', '523-456-7893'),
(5, 4, 'S', '5', 'E', '505', '623-456-7894'),
(6, 5, 'N', '6', 'F', '606', '723-456-7895'),
(7, 6, 'E', '7', 'G', '707', '823-456-7896'),
(8, 7, 'W', '8', 'H', '808', '923-456-7897'),
(9, 8, 'S', '9', 'I', '909', '113-456-7898'),
(10, 9, 'W', '10', 'J', '999', '133-456-7899');

-- Inserting data into the 'property' table
INSERT INTO property (Id, Area, District, Sector, Unit, City, Price, Type, NumBedrooms, Description) VALUES
(1, 'N', '1', 'A', '100', 'Birmingham', 250000.00, 'house', 5, 'family home for five'),
(2, 'E', '2', 'B', '200', 'Manchester', 180000.00, 'flat', 2, 'Apartment in the city'),
(3, 'S', '3', 'C', '300', 'London', 300000.00, 'house', 3, 'Small family home'),
(4, 'W', '4', 'D', '100', 'London', 220000.00, 'flat', 1, 'Flat to live by yourself'),
(5, 'N', '5', 'E', '200', 'London', 280000.00, 'house', 4, 'family house'),
(6, 'E', '6', 'F', '200', 'Brighton', 850000.00, 'house', 3, 'House by the beach'),
(7, 'S', '7', 'G', '100', 'London', 380000.00, 'house', 2, 'luxury home'),
(8, 'W', '8', 'H', '300', 'Manchester', 500000.00, 'house', 4, 'House by the farm'),
(9, 'N', '9', 'I', '300', 'London', 680000.00, 'house', 6, 'lxury family mansion'),
(10, 'E', '10', 'J', '200', 'Birmingham', 250000.00, 'flat', 2, 'Convenient flat in the city');

-- Inserting data into the 'customer' table
INSERT INTO customer (Id, Name, PhoneNumber) VALUES
(1, 'Harry Kane', '777-888-9999'),
(2, 'Declan Rice', '111-222-3333'),
(3, 'Ariana Grande', '123-456-7890'),
(4, 'Serena Williams', '234-567-8901'),
(5, 'Bobby Brown', '345-678-9012'),
(6, 'Mo Salah', '456-789-0123'),
(7, 'Young Adz', '567-890-1234'),
(8, 'Van Dijk', '678-901-2345'),
(9, 'Justin Bieber', '789-012-3456'),
(10, 'Bobby Moore', '890-123-4567');

-- Inserting data into the 'forSale' table
INSERT INTO forSale (PropertyId, OfficeId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting data into the 'forRent' table
INSERT INTO forRent (PropertyId, OfficeId) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 2);

-- Inserting data into the 'sold' table
INSERT INTO sold (PropertyId, OfficeId, CustomerId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Query to get information about the customers renting properties that are higher than $300
SELECT c.Name AS CustomerName, p.*
FROM customer c
JOIN forRent fr ON c.Id = fr.CustomerId-- Joining 'customer' table with 'forRent' table
JOIN property p ON fr.PropertyId = p.Id-- Joining 'forRent' with 'property' table
WHERE p.Price > 300;-- Finds the properties that are more than $300

-- Query to get the information of the offices with their agency names
SELECT o.*, a.Name AS AgencyName
FROM office o
JOIN agency a ON o.AgencyId = a.Id;-- Joining 'office' table with 'agency' table based on AgencyId

-- Query to get details about the customers and properties available for rent
SELECT c.*, p.*
FROM property p
LEFT JOIN forRent fr ON p.Id = fr.PropertyId-- Joining 'property' table with 'forRent' table
LEFT JOIN customer c ON fr.CustomerId = c.Id;-- Joining 'forRent' with 'customer' table

-- Query to count the total number of properties per office under an agency
SELECT a.Name AS AgencyName, o.Id AS OfficeId, COUNT(p.Id) AS TotalProperties
FROM agency a
JOIN office o ON a.Id = o.AgencyId-- Joining 'agency' table with 'office' table
LEFT JOIN property p ON o.Id = p.OfficeId-- Joining 'office' with 'property' table
GROUP BY a.Name, o.Id;-- Groups the results by the agency name and office ID

-- Query to get customers who have rented more properties than the average number of properties rented by all other customers
SELECT c.Name, COUNT(fr.PropertyId) AS TotalPropertiesRented
FROM customer c
LEFT JOIN forRent fr ON c.Id = fr.CustomerId-- Joining 'customer' table with 'forRent' table
GROUP BY c.Id-- Grouping the result by customer ID
HAVING COUNT(fr.PropertyId) > (
    SELECT AVG(property_count) 
    FROM (SELECT COUNT(PropertyId) AS property_count FROM forRent GROUP BY CustomerId) AS temp-- calculates average number of properties rented
);

-- Query to find customers with more than 70% of their bookings being luxury properties
SELECT c.Name, 
    SUM(CASE WHEN p.Type = 'luxury' THEN 1 ELSE 0 END) AS LuxuryBookings,-- Counting luxury bookings per customer
    COUNT(fr.PropertyId) AS TotalBookings-- Counting total bookings per customer
FROM customer c
LEFT JOIN forRent fr ON c.Id = fr.CustomerId-- Joining 'customer' table with 'forRent' table
LEFT JOIN property p ON fr.PropertyId = p.Id-- Joining 'forRent' with 'property' table
GROUP BY c.Id-- Grouping the result by customer ID
HAVING SUM(CASE WHEN p.Type = 'luxury' THEN 1 ELSE 0 END) / COUNT(fr.PropertyId) > 0.7;-- Finds the customers with more than 70% luxury bookings