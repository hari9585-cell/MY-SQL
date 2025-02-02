CREATE DATABASE library;
USE library;

-- Create tables
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
-- Insert raw sample datas

INSERT INTO Branch VALUES 
(1, 101, 'Main Street, Ernakulam', '9876543210'),
(2, 102, 'MG Road, Kochi', '9876543222');

INSERT INTO Employee VALUES 
(101, 'Rajesh Kumar', 'Manager', 70000, 1),
(102, 'Anjali Nair', 'Librarian', 40000, 2),
(103, 'Suresh Menon', 'Assistant Librarian', 30000, 1);

INSERT INTO Books VALUES 
('B001', 'SQL Fundamentals', 'Programming', 30, 'Yes', 'John Doe', 'OReilly'),
('B002', 'History of India', 'History', 40, 'Yes', 'Ramachandran', 'Penguin'),
('B003', 'Python for Data Science', 'Technology', 50, 'No', 'Emily Davis', 'Packt');

INSERT INTO Customer VALUES 
(201, 'Arun Kumar', 'Kochi', '2021-12-10'),
(202, 'Sneha Ramesh', 'Thrissur', '2023-05-20'),
(203, 'Vikram Singh', 'Kottayam', '2022-03-15');

INSERT INTO IssueStatus VALUES 
(301, 202, 'SQL Fundamentals', '2023-06-05', 'B001'),
(302, 203, 'History of India', '2023-06-15', 'B002');

INSERT INTO ReturnStatus VALUES (401, 202, 'SQL Fundamentals', '2023-06-10', 'B001');

-- Applying SQL Queries:

-- Retrieve the book title, category, and rental price of all available books

SELECT Book_title, Category, Rental_Price FROM Books  WHERE Status = 'Yes';

-- List the employee names and their respective salaries in descending order of salary:

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books :

SELECT Books.Book_title, Customer.Customer_name  FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

--  Display the total count of books in each category:

SELECT Category, COUNT(*) AS Total_Books  FROM Books  GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000:

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet:

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch:

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

-- Display the names of customers who have issued books in the month of June 2023 :

SELECT DISTINCT Customer_name  FROM IssueStatus 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieve book_title from books table containing 'history':

SELECT Book_title FROM Books  WHERE Book_title LIKE '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:

SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- Retrieve the names of employees who manage branches and their respective branch addresses:

SELECT Employee.Emp_name, Branch.Branch_address  FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

-- Display the names of customers who have issued books with a rental price higher than Rs. 25:

SELECT DISTINCT Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id WHERE Books.Rental_Price > 25;






