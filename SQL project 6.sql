Create database Population;
Use Population;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50) not null,
    Population INT,
    Area INT );

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
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

INSERT INTO Persons (Id, Fname, Lname, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 4.5, 1, 'USA'),
(2, 'Aaliya', 'Smith', 4.2, 2, 'Canada'),
(3, 'Rahul', 'Kumar', 4.8, 4, 'India'),
(4, 'Emma', 'Brown', 3.9, 5, 'Australia'),
(5, 'Liam', 'Wilson', 4.7, 3, 'UK'),
(6, 'Mia', 'Taylor', 3.8, NULL, NULL),
(7, 'David', 'Jones', 4.9, 1, 'USA'),
(8, 'Sophia', 'Miller', 4.6, 6, 'Germany'),
(9, 'James', 'Garcia', 3.5, 7, 'France'),
(10, 'Isabella', 'Davis', 4.0, 8, 'China');

SELECT P.Id AS Person_Id, P.Fname, P.Lname, P.Rating, C.Country_name, C.Population FROM Persons P INNER JOIN Country C ON P.Country_Id = C.Id;

SELECT P.Id AS Person_Id, P.Fname, P.Lname, P.Rating, C.Country_name, C.Population FROM Persons P LEFT JOIN Country C ON P.Country_Id = C.Id;

SELECT P.Id AS Person_Id, P.Fname, P.Lname, P.Rating, C.Country_name, C.Population FROM Persons P RIGHT JOIN Country C ON P.Country_Id = C.Id;

SELECT DISTINCT Country_name FROM Country UNION SELECT DISTINCT Country_name FROM Persons;

SELECT Country_name FROM Country UNION ALL SELECT Country_name FROM Persons;

SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating, Country_name FROM Persons;
