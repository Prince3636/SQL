-- 1)
-- Show employees who earn more than the average salary.


select *
From employees
where salary >
(select AVg(salary)
from employees);


-- 2)
-- Show departments that have no employees.
select *
from department
where deptId  not in
(select DeptID
from employees );


-- 3)
-- Show employees who belong to the HR department.
select *
from employees
where deptId In
(select deptId
from department
where DeptName = 'HR');

-- 4)
-- Show employees who earn the highest salary.
select *
from employees
where salary =
(select Max(salary)
from employees);

-- 5)
-- Show employees who work in departments having at least 2 employees.
select *
from employees
where DeptID IN
(select DeptID
From employees
group by deptId
having count(*) >=2);