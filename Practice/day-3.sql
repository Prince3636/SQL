-- day_3
Use companydb;


-- Create table for department 
Create Table department(
	DeptID Int Primary Key,
    DeptName Varchar(50)
);
-- Insert values for department
Insert Into department Values
(1, 'IT'),
(2,'HR'),
(3,'Sales'),
(4,'Marketing'),
(5,'Finance');

-- Create table for employees
Create Table employees(
	EmpID Int Primary Key ,
    EmpName varchar(50),
    Salary Int,
	DeptID Int,
    Foreign Key (DeptID) references Department(DeptID)

);

-- Insert Values in employees table
Insert Into employees Values
(101,'Prince',50000,1),
(102,'Rahul',40000,2),
(103,'Amit',60000,1),
(104,'Neha',45000,3),
(105,'Riya',55000,2),
(106,'Karan',70000,1),
(107,'Pooja',48000,4),
(108,'Arjun',75000,1),
(109,'Sneha',65000,4),
(110,'Mohit',42000,2);

-- To watch the department data
select *
From department;

-- To watch the employees data
select * 
From employees;

-- To drop the employees table
Drop table employees;

-- To drop the department table
Drop table department;

/*Show:
Employee Name
Department Name
*/
-- 1st method
Select EmpName , DeptName
From Employees
Inner Join Department
ON Employees.DeptID = Department.Dept_ID;

-- 2nd Method
Select 
	e.EmpName,d.DeptName
From
	Employees e
Inner Join
	Department d
ON
	e.DeptID = d.DeptID;

/*
Show:
Employee Name
Salary
Department Name
*/

Select
	e.empName,e.salary,d.DeptName
From 
	Employees e
INNER JOIN 
	Department d
ON 
	d.DeptID = e.DeptID;


/*Show:
Employee ID
Employee Name
Department Name
*/

Select 
	e.EmpID,e.EmpName,d.DeptName
From
	Employees e
Inner JOIN 
	Department d
ON 
	e.DeptID = d.DeptID;


/*
Show all employees and their department names.
If an employee has no matching department, the employee should still appear in the result.
Which JOIN will you use?
*/

Select
	e.EmpID, e.EmpName,e.Salary,e.DeptID,d.DeptName
From 
	Employees e
Left JOIN 
	department d
ON  
	d.DeptID = e.DeptID;


/*
Show all departments and their employees.
Even if a department has no employees, it should still appear.
(Hint: The Finance department currently has no employees.)
Which JOIN will you use?
*/

Select 
	d.DeptID,d.DeptName,e.EmpName
From 
	Department d
Left JOIN
	Employees e
ON 
	d.DeptID = e.DeptID;
	

/*
Show:
Department Name
Employee Name
and return all departments, even if they have no employees.
*/



Select 
	e.EmpName,d.DeptName
From
	Employees e
Right JOIN 
	Department d
ON 
	e.DeptID = d.DeptID;
    
    
/*
Show:
Employee Name
Department Name
using a FULL JOIN.
*/


-- To get the full join we use UNION 
Select 
	e.EmpName,d.DeptName
From 
	Employees e
LEFT JOIN 
	Department d
ON 
	e.DeptID = d.DeptID
    
UNION

Select 
	e.EmpName,d.DeptName
From 
	Employees e
RIGHT JOIN 
	Department d
ON 
	e.DeptID = d.DeptID;
    

/*
Show only employees who belong to the IT department.
Display:
Employee Name
Department Name
Use a JOIN.
*/


Select 
	e.EmpName, d.DeptName
From
	Employees e
Inner JOIN
	Department d
ON 
	e.DeptID = d.DeptID
Where 
	d.DeptName = 'IT';


/*
Show all employees whose salary is greater than 50,000 along with their department names.
Display:
Employee Name
Salary
Department Name
Use a JOIN.
*/

Select 
	e.EmpName,e.Salary,d.DeptName
From
	Employees e
Inner JOIN
	Department d
ON
	d.DeptID = e.DeptID
Where 
	e.salary >50000;


/*
Show the number of employees in each department.
Display:
Department Name
Employee Count
*/

Select 
	d.DeptName,
	Count(e.EmpName) as Employee_Count
From
	Employees e
Inner JOIN
	Department d
ON
	e.DeptID = d.DeptID
Group BY 
	d.DeptName;
    
    
/*
Show all departments and the number of employees in each department.
This time, Finance should also appear with a count of 0.
*/


Select 
	d.deptName,
    d.DeptID,
    Count(e.EmpID) As Employee_Count
From
	Employees e
Right JOIN
	Department d
On
	e.DeptID = d.DeptID
Group By
	d.DeptID;



/*
Show:
Department Name
Average Salary
for each department.
*/

Select 
	d.DeptName,
    AVG(e.Salary) as AVG_Salary
From
	employees e
Right Join
	department d
ON
	e.DeptID = d.DeptID
Group By
	d.DeptID;

/* 
Show departments that have more than 2 employees.
Display:
Department Name
Employee Count
*/

Select 
	d.DeptName,
    Count(e.EmpName) as Emp_Count
From
	Employees e
Right JOIN
	Department d
ON
	d.DeptID = e.DeptID
Group BY
	d.DeptID,
    d.DeptName
Having
	Count(e.EmpName) > 2;
    


/*
Show:
Department Name
Total Salary
for each department.
Include Finance as well.
*/

Select
	d.DeptName,
    Sum(e.salary) as Total_Salary
From
	Employees e
Right Join
	Department d
ON
	e.DeptID = d.DeptID
Group By
	d.DeptID;


/*
Show departments whose total salary is greater than 100000.
Display:
Department Name
Total Salary
*/

Select 
	d.DeptName,
	Sum(e.Salary) AS Total_Salary
From
	Employees e
Inner Join
	Department d
ON
	d.DeptId = e.DeptId
Group By
	d.DeptId
Having 
	sum(e.Salary) > 100000 ;


/*
Show:
Employee Name
Salary
Department Name
but only for employees who belong to either:
IT
HR
*/

Select
	e.EmpName,
    e.Salary,
    d.DeptName
From
	Employees e
Right JOIN
	Department d
ON
	d.DeptId = e.DeptId
Where 
	d.DeptName In ('IT' ,'HR');

    
/*
Show:
Department Name
Employee Count
Only for departments having at least 2 employees.
*/

Select
	d.DeptName,
    Count(e.EmpName)
From
	Employees e
Right Join 
	Department d
ON
	d.DeptId = e.DeptId
Group by 
	d.DeptId ,
    d.DeptName
Having
	Count(e.EmpName)>=2;



/*
Show the highest paid employee along with their department name.
Display:
Employee Name
Salary
Department Name
*/

Select 
	e.EmpName,
    e.Salary,
    d.DeptName
From
	Employees e
Inner Join
	Department d
On
	d.DeptId = e.DeptId
order by
	e.salary Desc
Limit 1;


/*
Show:
Department Name
Highest Salary in that department
*/

Select 
    d.DeptName,
    Max(e.Salary)
From
	Employees e
Inner Join
	Department d
On
	d.DeptId = e.DeptId
Group by
	d.DeptName,
    d.DeptId;
    

/*
Show:
Department Name
Employee Count
Sort the result by Employee Count in descending order (highest count first).
*/ 


Select
	d.DeptName,
    Count(e.EmpName)
From
	employees e
Inner join
	department d
On
	d.DeptId = e.DeptId
group by 
	d.DeptId,
    d.DeptName
Order By
	Count(e.EmpName) Desc;
	