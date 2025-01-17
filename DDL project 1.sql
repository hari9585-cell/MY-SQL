CREATE DATABASE SCHOOL;
Use School;
-- CREATING TABLES
Create table Students (
Roll_No Int auto_increment primary key,
Firstname varchar(50) not null,
Secondname Varchar(30),
Marks Int,
Grade Char(1)
);

INSERT INTO STUDENTS (Roll_No,Firstname, Secondname, Marks, Grade)
VALUES 
    (001, 'Karthik','Unni', 85, 'A'),
    (002, 'Jose','Thomas', 78, 'B'),
    (003, 'Sheeba','Kurian', 66, 'C');
    
    desc Students;
    
    ALTER TABLE STUDENTS ADD Contact VARCHAR(15);
    
    Alter Table Students Drop Grade;

Rename table Students to CLASSTEN;

Truncate table classten;

desc classten;

drop table classten;


    
