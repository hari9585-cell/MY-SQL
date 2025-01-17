Create Database Employee;
Use Employee;
Create table Managers (
Manager_ID Int auto_increment primary key,
First_Name VARCHAR(50) not null,
Last_name VARCHAR(50),
DOB DATE, 
Age INT CHECK (Age > 18),
Last_update timestamp default current_timestamp,
Gender CHAR(1),
Department VARCHAR(50),
Salary DECIMAL(10, 2) NOT NULL 
);

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1985-05-15', 39, 'M', 'IT', 30000),
(2, 'Aaliya', 'Khan', '1990-09-20', 34, 'F', 'HR', 25000),
(3, 'Mike', 'Smith', '1978-03-10', 46, 'M', 'Finance', 40000),
(4, 'Sara', 'Lee', '1992-07-15', 32, 'F', 'IT', 28000),
(5, 'Raj', 'Sharma', '1980-11-30', 44, 'M', 'Marketing', 35000),
(6, 'Lina', 'Brown', '1988-04-05', 36, 'F', 'IT', 27000),
(7, 'Paul', 'Walker', '1983-01-22', 41, 'M', 'Finance', 45000),
(8, 'Priya', 'Singh', '1991-06-18', 33, 'F', 'HR', 20000),
(9, 'Ravi', 'Kumar', '1985-12-25', 39, 'M', 'IT', 32000),
(10, 'Sophia', 'Williams', '1989-08-14', 35, 'F', 'Marketing', 29000);

SELECT First_name, Last_Name, DOB, department FROM Managers;

SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

SELECT * FROM Managers WHERE First_name <> 'Aaliya';

Select * from Managers Where department = 'IT' and Salary> 25000;

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;


