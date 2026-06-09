-- Practice subQuery
use companydb;

Select *
from department;

select *
from employees;


-- 1)
/*
Show the employee(s) who have the highest salary in the company.
Use a subquery with MAX(Salary).
*/


select
	*
From
	Employees
where salary = (
Select
	Max(salary)
from
	employees);


-- 2)
/*
Show the employee(s) who have the lowest salary in the company.
Use a subquery with MIN(Salary).
*/

select
	*
from
	employees
where salary =(Select	
					Min(salary)
				from
					employees);

-- 3)
/*
Show all employees whose salary is greater than the average salary of the company.
Use a subquery with AVG(Salary).
*/

Select
	*
From
	employees
where salary >
			(Select 
				Avg(salary)
			From
				employees);
-- 4)
/*
Show all employees who belong to the IT department.
*/


-- method 1 to fetch the data using join
Select 
    e.EmpName,
    d.DeptName
From
	employees e
inner Join 
	department d
On
	d.DeptId = e.DeptId
where 
	deptName = 'IT';

-- method 2 

Select
	*
From
	Employees
where DeptID =(Select 
	deptId
from
	Department
where deptName = 'IT');
	
	
-- 5)
/*
Show all employees who belong to either:
IT
HR
*/


Select
	*
From
	employees
where DeptId IN (
				Select
						DeptId
				From
					   Department
				where deptName IN('IT' , 'HR'));
    

-- 6)
/*
Show all employees who do not belong to the HR department.
*/

Select
	*
From
	Employees
Where
	DeptID NOT IN (Select 
					DeptId
			 From
					department
			  where deptName = 'HR');


-- 7)
/*
Show the employee(s) who earn the second highest salary in the company.
*/

Select 
	max(salary)
From
	Employees
where salary <(
				Select 
					Max(salary)
				From
					employees);


-- 8)
/* Show all employees whose salary is less than the average salary of the company.*/

Select 
	*
From
	employees
where salary <(
				Select 
					AVG(salary)
				From
					employees);



-- 9)
/* Show the department name(s) that have at least one employee.*/
Select
	DeptName
from
	department
where 
	deptId IN 
			(Select
				deptId
			From
				employees
			);


-- 10)
-- Show the department name(s) that have no employees.

select
	DeptName
From
	department
where deptId NOT IN 
					(Select 
							DeptID
					From
							employees);

-- 11)
-- Show employees who work in the department Marketing.


select
	EmpName
from
	Employees
where DeptId IN
				(Select
						DeptId
				From
						department
				where	
						deptName = 'Marketing');


-- 12)
-- Show all employees whose salary is greater than the salary of Rahul.

Select
		*
From
		employees
Where 
		salary >
				(Select	
						salary
				 from
						employees
				 where 
						empName = 'Rahul');


-- 13)
-- Show all employees whose salary is less than the salary of Arjun.
Select
	*
from
	employees
where salary <(
				select
					salary
				from
					employees
				where
					empName = 'Arjun');
                    
-- 14
-- Show the employee(s) who work in the department with DeptID = 1.

Select 
	*
From
	employees
where deptId =
				(select 
						DeptId
				From
						department
				Where 
						DeptId = 1);
	

-- 15)
-- Show all employees whose salary is equal to the second highest salary in the company.

select	
	Max(salary)
From
	employees
where salary <=
(select	
	Max(salary)
From
	employees
where salary < (
						select 
							Max(salary)
						From
							employees));


-- 16)
-- Show all employees whose salary is greater than the average salary of the company and who belong to the IT department.
select 
	*
From 
	employees
where 
	salary>(
			select 
				AVG(salary)
			From
				employees) AND deptID = (select 
									deptID
								From 
									Department
								where DeptName = 'IT');



-- 17)
-- Show all departments that have at least one employee whose salary is greater than 65000.

select 
	*
From 
	department
where deptId IN (select deptId
From employees
where salary > 65000);


-- 18)
-- Show all employees who work in departments that have at least one employee earning more than 65000.

select *
from employees
where deptID IN(
Select  deptID 
From employees
where salary >65000);


-- 19)
-- Show employees whose salary is greater than the salary of Amit.
select *
from employees
where salary >
(select salary 
from employees
where EmpName ='Amit');


-- 20)
-- Show employees who belong to departments that currently have at least 2 employees.
select *
from employees
where deptId IN
(select 
	DeptID
from employees
Group By DeptId
having count(*) >= 2);












