Create database Teacherfile;
Use teacherfile;

CREATE TABLE teachers (
    id INT PRIMARY KEY, 
    name CHAR(50),
    subject CHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary)
VALUES
(1, 'Devi Kumari', 'Mathematics', 5, 50000),
(2, 'Julie Mathew', 'English', 8, 45000),
(3, 'Mark Taylor', 'Physics', 12, 60000),
(4, 'Emmima Rani', 'Biology', 3, 40000),
(5, 'Devassy Sudhakaran', 'Chemistry', 15, 75000),
(6, 'Sarah Sasi', 'History', 6, 55000),
(7, 'James Lukosee', 'Geography', 4, 47000),
(8, 'Anana Sumi', 'Computer Science', 10, 65000);

-- Query1 
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;




CREATE TABLE teacher_log (
    teacher_id INT,
    action CHAR(50),
    timestamp DATETIME
);
DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END //

DELIMITER ;



DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END //

DELIMITER ;



DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END //

DELIMITER ;

SELECT * FROM teacher_log;


SELECT * FROM teachers;





