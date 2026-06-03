--  day-1


-- Show only the Name and Salary columns of all employees.
SELECT Name,Salary FROM employee;

-- Show all employees who belong to the IT department.
SELECT * FROM employee
where Department = 'IT';

-- Show all employees whose Salary is greater than 50000.
SELECT * FROM employee
where Salary > 50000;

-- Show all employees who live in Delhi and work in the IT department.
SELECT * FROM employee
where City = 'delhi' AND Department = 'IT';


-- Show all employees who are in the HR department or live in Mumbai.
SELECT * FROM employee
where department = 'HR' OR city = "Mumbai";

-- Show all employees sorted by Salary in descending order (highest salary first).

SELECT * FROM employee
ORDER BY Salary DESC;

-- Show only the unique departments from the Employee table.
SELECT DISTINCT department from employee;


-- Show all employees whose salary is between 45000 and 65000 (inclusive).
SELECT * FROM employee
WHERE salary >= 45000 AND salary <= 65000;

-- Show all employees whose Name starts with 'A'.
SELECT * FROM employee
where Name LIKE 'A%';

-- Show all employees whose City starts with 'D'.
SELECT * FROM employee
where City LIKE 'D%';

-- Show all employees whose Department is not 'IT'.
SELECT * FROM employee
where Department <> 'IT';

-- Show the top 3 highest-paid employees.
select * From employee
Order By salary DESC
LIMIT 3;

/* Show all employees who:
work in the IT department
and have a salary greater than 55000 */

SELECT * FROM employee
where department = 'IT'
AND salary > 55000;


-- Show all employees who live in either Delhi or Bangalore.

SELECT * FROM employee
where city = 'Delhi' OR city = 'Bangalore';


-- Show all employees whose Name ends with 'a'.

SELECT * FROM employee
where Name LIKE '%a';

-- Show all employees whose salary is not equal to 50000.
SELECT * FROM employee
where salary != 50000;

-- Show the employees' Name and Department only, sorted by Name in ascending order.
SELECT Name, Department FROM employee
ORDER BY Name Asc;


/*Show all employees whose:
Department is IT
OR Salary is greater than 65000*/


SELECT * FROM employee
WHERE department = 'IT'
OR Salary > 65000;

/*Show all employees whose:
Salary is between 40000 and 60000
AND City is Delhi*/

SELECT * FROM employee
where salary between 40000 AND 60000
AND city = 'delhi';



 