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

-- Queries

ALTER TABLE Persons ADD DOB DATE;

UPDATE Persons
SET DOB = '1990-05-15'
WHERE Id = 1;

UPDATE Persons
SET DOB = '1985-07-22'
WHERE Id = 2;

UPDATE Persons
SET DOB = '1992-03-10'
WHERE Id = 3;

UPDATE Persons
SET DOB = '1988-09-30'
WHERE Id = 4;

UPDATE Persons
SET DOB = '1995-01-05'
WHERE Id = 5;

Update persons
SET DOB ='1996-03-02'
Where ID = 6;

Update persons
SET DOB ='1996-01-01'
Where ID = 7;

Update persons
SET DOB ='1998-04-22'
Where ID = 8;

Update persons
SET DOB ='1981-05-22'
Where ID = 9;

Update persons
SET DOB ='1996-10-12'
Where ID = 10;

DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(DOB) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(DOB, '%m%d'));
    RETURN age;
END //

DELIMITER ;

Select * from Persons;
SELECT Id, Fname, Lname, DOB,CalculateAge(DOB) AS Age FROM Persons;

SELECT Id, Country_name, CHAR_LENGTH(Country_name) AS NameLength FROM Country;

SELECT Id, Country_name, LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

SELECT Id, Country_name, UPPER(Country_name) AS UpperCaseName, LOWER(Country_name) AS LowerCaseName FROM Country;
