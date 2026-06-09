-- CET = common expression table 

-- 1) subquery for 2nd highest salary 
select *
from
(select 
	empName,
    salary,
    department,
    dense_rank() over (partition by department order by salary DESC)as rnk
from
	employees_rank) as Rank_table
where rnk = 2;

-- 1) coverted subquery to CET 

With second_Highest_salary as (
select *
from
(select 
	empName,
    salary,
    department,
    dense_rank() over (partition by department order by salary)as rnk
from
	employees_rank) as Rank_table
where rnk = 2)
select *
from second_Highest_salary;


-- 2) subquery for 2nd highest salary 
select *
from
(select 
	empName,
    salary,
    department,
    dense_rank() over (partition by department order by salary)as rnk
from
	employees_rank) as Rank_table
where rnk = 2;

-- 2) coverted subquery to CET 
With second_Highest_salary as (
select *
from
(select 
	empName,
    salary,
    department,
    dense_rank() over (partition by department order by salary)as rnk
from
	employees_rank) as Rank_table
where rnk = 2)
select *
from second_Highest_salary;



-- 3) converted into CET 
-- Find the employee(s) with the highest salary using a CTE and DENSE_RANK().
with Highest_Salary as
(select 
	*
from
(select 
	empName,
    salary,
    dense_rank() over (order by salary DESC) as rnk
from 
	employees_rank) as Rank_table
where rnk = 1)
select *
From Highest_Salary;


-- 4)
/* Find the employee(s) with the 3rd highest salary using:
CTE
DENSE_RANK()*/

with salary_rank as
(select 
	empName,
    salary,
    dense_rank() over (order by salary DESC) as rnk
from employees_rank)
select *
from salary_rank
where rnk = 3;

-- 5)
/*Find the highest paid employee in each department using:
CTE
RANK()
PARTITION BY Department*/
with Rank_deparment as
(select 
	empName,
    salary,
    department,
    Rank() over (partition by department order by salary Desc) as rnk
from 
	employees_rank)
select *
from Rank_deparment
where rnk = 1;


-- 6)
/*Find the second highest paid employee in each department using:
CTE
DENSE_RANK()
PARTITION BY Department*/

with Rank_deparment as
(select 
	empName,
    salary,
    department,
    dense_rank() over (partition by department order by salary Desc) as rnk
from 
	employees_rank)
select *
from Rank_deparment
where rnk = 2;




-- 7)
-- Create a CTE that contains only IT employees, then display all IT employees.
with IT as
(select *
from 
	employees_rank
where department = 'IT')
select *
from IT;

-- 8
/*Create two CTEs:
First CTE
IT employees only.
Second CTE
From those IT employees, keep only employees whose salary is greater than 55000.
Finally display the result.
Write only the SQL query. */

WITH IT_Employees AS (
    SELECT *
    FROM employees_rank
    WHERE department = 'IT'
),
High_Salary_IT AS (
    SELECT *
    FROM IT_Employees        
    WHERE salary > 55000
)
SELECT * FROM High_Salary_IT;




