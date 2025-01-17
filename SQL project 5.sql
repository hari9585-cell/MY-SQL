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

SELECT LEFT(Country_name, 3) AS First_Three_Chars FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count FROM Persons;

SELECT MAX(Population) AS Max_Population FROM Country;

SELECT MIN(Population) AS Min_Population FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (11, 'Ethan', NULL, 2700, 4.1, 2, 'Canada'), (12, 'Olivia', NULL, 2200, 3.9, 4, 'India');


SELECT COUNT(Lname) AS Count_Non_Null_Lname FROM Persons;

SELECT COUNT(*) AS Total_Rows FROM Persons;

SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name HAVING SUM(Population) > 50000;

SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating FROM Persons GROUP BY Country_name HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;
