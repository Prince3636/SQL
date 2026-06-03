-- day 2 

-- Find the total number of employees in the Employee table.
select count(name)
from   employee;

select count(*)
from   employee;

--  Find the total salary of all employees.
Select Sum(salary)
From employee; 


-- Find the average salary of all employees.
Select AVG(salary)
From employee; 

-- Find the highest salary in the Employee table.
Select MAX(salary)
From employee; 

-- Find the lowest salary in the Employee table.
Select MIN(salary)
From employee; 

-- Show the number of employees in each department.
Select Count(name),department
from employee
group by (department);


--  Show the average salary for each department.
Select department,AVG(salary)
From employee
Group By (department); 

-- Show the highest salary in each department.
Select  department,Max(salary)
From employee
Group By (department);

-- Show only those departments that have more than 3 employees.
Select department ,count(*)
From employee
Group BY (department)
Having count(*) > 3;

-- Show departments whose average salary is greater than 50,000.
Select department ,Avg(salary)
from employee 
Group By department
Having Avg(salary)>50000;

-- Find the total salary paid by each department.
Select department,Sum(salary)
From employee
Group By department;

-- Show departments whose total salary is greater than 150000.
Select department,sum(salary)
From employee
Group By department
Having sum(salary)>150000;

-- Find the number of employees in each city.
Select city,Count(name)
From employee
Group By city;

-- Show only those cities that have more than 3 employees.
Select city,Count(name)
From employee
Group By city
Having Count(name)>3;


/* Show the department and the highest salary in that department, but only for departments where the highest salary is greater than 60,000.*/
Select department,Max(salary)
From employee
Group By department
Having Max(salary)>60000;


-- Show the city and the average salary of employees in that city.
Select city,Avg(salary)
From employee
Group By city;

-- Show only those cities whose average salary is greater than 50,000.
Select city ,Avg(salary)
From employee
group BY city
Having Avg(salary) > 50000;

-- Show the department and the minimum salary in each department.
Select department , MIN(salary)
From employee
Group BY department;

-- Show only those departments whose minimum salary is greater than 40,000.
Select department ,Min(salary)
From employee
Group By department
Having Min(salary)> 40000;

-- Show the city and the total salary paid in that city, but only for cities where the total salary is greater than 150000.
Select city ,Sum(salary)
From employee
Group By city
Having sum(salary) > 150000;