Create database JOB;
Use JOB;


CREATE TABLE Worker ( Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'Anand', 'Krishnan', 50000, '2023-01-15', 'IT'),
(2, 'Meera', 'Mohan', 60000, '2022-07-10', 'HR'),
(3, 'Ravi', 'Pillai', 70000, '2020-05-23', 'Finance'),
(4, 'Nithya', 'Menon', 45000, '2021-12-01', 'IT'),
(5, 'Manoj', 'Nair', 80000, '2019-03-15', 'Finance');


DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

Select*from Worker;

DELIMITER //

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN SELECT Salary INTO p_Salary FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL GetSalary(1, @salary); SELECT @salary AS Salary;

DELIMITER //

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL UpdateDepartment(1, 'HR');

CALL UpdateDepartment(3, 'Marketing');


DELIMITER //

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL GetWorkerCount('IT', @workerCount);SELECT @workerCount AS WorkerCount;


DELIMITER //

CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(15, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;


CALL GetAverageSalary('IT', @avgSalary);
SELECT @avgSalary AS AvgSalary;











