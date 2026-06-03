CREATE DATABASE companyDB;

USE companyDB;

CREATE TABLE employee(
	Id INT PRIMARY KEY,
    Name VARCHAR(20),
    Department VARCHAR(20),
    Salary INT,
    City VARCHAR(20)
);

INSERT INTO employee value
(1,"Prince","IT",50000,"Delhi"),
(2,"Rahul","HR",60000,"Mumbai"),
(3,"Amit","IT",45000,"Delhi"),
(4,"Neha","Sales",55000,"Pune"),
(5,"Riya","HR",70000,"Delhi"),
(6,"Karan","IT",35000,"Bangalore"),
(7,"Anjli","Sales",48000,"Mumbai"),
(8,"Vikas","Marketing",65000,"Pune"),
(9,"Sneha","IT",42000,"Delhi"),
(10,"Mohit","HR",40000,"Bangalore"),
(11, 'Arjun', 'IT', 75000, 'Delhi'),
(12, 'Pooja', 'HR', 52000, 'Mumbai'),
(13, 'Rohit', 'Marketing', 58000, 'Delhi'),
(14, 'Simran', 'Sales', 47000, 'Pune'),
(15, 'Deepak', 'IT', 68000, 'Bangalore');

-- remove only table data 
TRUNCATE TABLE Employee;

-- Show all employee records from the Employee table.
SELECT * FROM employee;
