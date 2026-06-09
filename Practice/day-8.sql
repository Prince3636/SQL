-- Mixed Question 


-- 1)
/*Department
Total number of employees in that department*/

select department,count(*)as Employee_count
from employee
group by department;


-- 2)
/*Using the same table, show:
Department
Average Salary
Only for departments whose average salary is greater than 50000. */


select 
	department,
    AVG(salary) as avg_salary
from 
	employee
group by department
Having avg_salary > 50000;


-- 3)
-- Only departments whose average salary is greater than 50000.
use companydb;
select 
	e.empName,
    d.deptName
From 
	employees e
Inner join 	
	department d
on 
	e.deptId = d.deptId;


-- 4)
-- Write a query to show employees whose salary is greater than the average salary of the company.

select empName,salary
from 
	employees 
where salary >(
select AVG(salary) from employees);



-- 5)
-- Find the employee(s) with the second highest salary using:


with Second_highest as (
select 
	empName ,
    department,
    dense_rank() over (order by salary DESC) as rnk
from 
	employees_rank)
select *
from 
	Second_highest 
where rnk = 2;



-- 6)
-- Find duplicate employee names.
select * from test1;


select name,count(*)
from 
	test1
group by
	name
having 
	count(*) >1;


-- 7)
-- Find the highest salary using:

use companydb;

select Max(salary)
from employees;

with Highest as(
select 
	empname,
    salary,
    dense_rank() over (order by salary DESC) as rnk
from 
	employees)
select *
from
	Highest
where rnk = 1;


SELECT *
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);


