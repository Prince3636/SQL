use companydb;

-- create rank table 
create table Employees_Rank(
	EmpID INT,
    EmpName varchar(50),
    department varchar(50),
    salary int
);


-- insert data in rank table 
INSERT INTO Employees_Rank VALUES
(101,'Prince','IT',50000),
(102,'Rahul','HR',40000),
(103,'Amit','IT',60000),
(104,'Neha','Sales',45000),
(105,'Riya','HR',55000),
(106,'Karan','IT',70000),
(107,'Pooja','Marketing',48000),
(108,'Arjun','IT',70000),
(109,'Sneha','Marketing',65000),
(110,'Mohit','HR',40000);


-- 1)
/*Show:
EmpName
Salary
Row Number based on salary (highest salary first)*/


Select 
	EmpName ,
    salary,
    row_number() over(order by salary DESC) as Row_Num
From employees_rank;


-- 2)
/*Show:
EmpName
Salary
Rank based on salary*/


select 	
	empName,
    salary,
    rank() over(order by salary DESC) as Rank_number
from 
	employees_Rank;


-- 3)
/*Show:
EmpName
Salary
Dense Rank based on salary (highest salary first)
*/


select 
	empName,
    salary,
    dense_rank() over (order by salary DESC) as 'DENSE_RANK'
from 
	employees_rank;




-- 4)
-- Find the employee(s) with the 2nd highest salary using:
select *
from 
(select 
	EmpName, 
        Salary,
    dense_rank() over (order by salary DESC) as rnk
from 
	employees_rank) as temp
    where rnk = 2;




-- 5)
-- Find the employee(s) with the 3rd highest salary using:
select 
	*
from
(select 
	empName,
    salary,
    dense_rank() over (order by salary DESC) as rnk
from 
	employees_rank) as temp
    where rnk = 3;
    
-- 6)
/*Show:
EmpName
Department
Salary
Rank within each department */


select 
	empName,
    department,
    salary,
    Rank() over(partition by Department order by salary DESC) as Partition_by_department
from
	employees_rank;
    
	
-- 7)
-- Find the highest paid employee in each department.

select *
from
(select 
	empname,
    department,
    salary,
    Rank() over (partition by Department order by salary DESC) as Rnk
from 
	employees_rank)as partition_table
where 
	rnk = 1;


-- 8)
-- Find the second highest paid employee in each department.

select *
from
(select 
	empName,
    salary,
    department,
    Rank() over (partition by department order by salary DESC) as rnk
from
	employees_rank) as rank_table
where rnk = 2;


-- 9)
-- Find the second highest paid employee in each department using
select *
from
(select
	empName,
    salary,
    department,
    dense_rank() over (partition by department order by salary DESC) as rnk
from 
	employees_rank) as rank_table
where rnk = 2;


-- 10)
-- Find the 3rd highest paid employee in each department using
select *
from
	(select 
		empName,
        salary,
        department,
        dense_rank() over (partition by department order by salary DESC) as rnk
	from 
		employees_rank) as Rank_table
where 
	rnk = 3;
























