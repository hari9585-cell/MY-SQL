Create database World;
Use World;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);


INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 68000000, 243610),
(4, 'India', 1393409038, 3287263),
(5, 'Australia', 25687041, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'China', 1444216107, 9596961),
(9, 'Japan', 126300000, 377975),
(10, 'Brazil', 213000000, 8515767);


INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 2000, 4.5, 1, 'USA'),
(2, 'Emma', 'Smith', 3000, 4.2, 2, 'Canada'),
(3, 'Rahul', 'Kumar', 4000, 4.8, 4, 'India'),
(4, 'Sophia', 'Brown', 2500, 3.9, 5, 'Australia'),
(5, 'Liam', 'Wilson', 1500, 4.7, 3, 'UK'),
(6, 'Mia', 'Taylor', 1800, 3.8, 6, 'Germany'),
(7, 'David', 'Jones', 3000, 4.9, 1, 'USA'),
(8, 'Isabella', 'Miller', 1200, 4.6, 6, 'Germany'),
(9, 'James', 'Garcia', 2100, 3.5, 7, 'France'),
(10, 'Ava', 'Davis', 2400, 4.0, 8, 'China');

-- query Find the number of persons in each country.

SELECT Country_name AS Country, COUNT(*) AS Number_of_Persons FROM Persons GROUP BY Country_name;

-- Query to find number of persons in each country sorted from high to low. 

SELECT Country_name AS Country, COUNT(*) AS Number_of_Persons FROM Persons GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

-- Query to find out an average rating for Persons in respective countries if the average is greater than 3.0

SELECT Country_name AS Country, AVG(Rating) AS Average_Rating
FROM Persons GROUP BY Country_name HAVING AVG(Rating) > 3.0;

-- Query find the countries with the same rating as the USA (using subqueries).

SELECT Country_name FROM Persons GROUP BY Country_name HAVING AVG(Rating) = (
    SELECT AVG(Rating) FROM Persons WHERE Country_name = 'USA');
    
-- Query to Select all countries whose population is greater than the average population of all nations.

SELECT Country_name FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);



-- Creating new data base with name Prdouct and table for further queries.

CREATE DATABASE Product;
USE Product;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('Hari', 'sankar', 'harisankar@example.com', '1234567890', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
('Emma', 'Smith', 'emma.smith@example.com', '9876543210', '456 Elm St', 'San Francisco', 'California', '94102', 'USA'),
('Varey', 'ookan', 'ookan356@example.com', '4561237890', '789 Oak St', 'New York', 'New York', '10001', 'USA'),
('Sophia', 'Taylor', 'sophia.taylor@example.com', '7896541230', '321 Pine St', 'Austin', 'Texas', '73301', 'USA'),
('Ava', 'Wilson', 'ava.wilson@example.com', '6541239870', '654 Maple St', 'Seattle', 'Washington', '98101', 'USA'),
('Mia', 'Davis', 'mia.davis@example.com', '3219876540', '987 Birch St', 'Chicago', 'Illinois', '60601', 'USA'),
('Noah', 'Garcia', 'noah.garcia@example.com', '1472583690', '159 Spruce St', 'Houston', 'Texas', '77001', 'USA'),
('Isabella', 'Martinez', 'isabella.martinez@example.com', '9638527410', '753 Cedar St', 'Miami', 'Florida', '33101', 'USA'),
('James', 'Lopez', 'james.lopez@example.com', '8527419630', '357 Aspen St', 'San Diego', 'California', '92101', 'USA'),
('Aiden', 'Clark', 'aiden.clark@example.com', '9517534862', '951 Redwood St', 'Phoenix', 'Arizona', '85001', 'USA');

-- Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.

CREATE VIEW customer_info AS SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;
Select * from customer_info;

-- Create a view named US_Customers that displays customers located in the US. 

CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'USA';

SELECT * FROM US_Customers;

-- Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

-- Update phone numbers of customers who live in California for Customer_details view.

UPDATE Customer SET Phone_no = '1111111111' WHERE State = 'California';

Select * from Customer;

-- Count the number of customers in each state and show only states with more than 5 customers.

SELECT State, COUNT(*) AS Number_of_Customers FROM Customer GROUP BY State HAVING COUNT(*) > 5;

-- Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.

SELECT State, COUNT(*) AS Number_of_Customers FROM Customer_details GROUP BY State;

-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

SELECT * FROM Customer_details ORDER BY State ASC;










