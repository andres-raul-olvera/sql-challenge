--1. List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
-- from employees: employee number (emp_no), last name (last_name), first name (first_name), gender
-- from salaries: employee number (emp_no), salary
select s.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on s.emp_no = e.emp_no
order by s.emp_no;

--2. List employees who were hired in 1986
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select  d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
from employees as e 
inner join dept_manager as m
on e.emp_no = m.emp_no
inner join departments as d
on m.dept_no = d.dept_no


-- 4. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no


-- 5. List all employees whose first name is "Hercules" 
--and last names begin with "B.
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name

-- 6.List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select distinct on (emp_no) *
into current_dept_emp
from dept_emp
order by emp_no;

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join current_dept_emp as cde
on e.emp_no = cde.emp_no
inner join departments as d
on cde.dept_no = d.dept_no
where lower(d.dept_name) = 'sales';

-- 7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join current_dept_emp as cde
on e.emp_no = cde.emp_no
inner join departments as d
on cde.dept_no = d.dept_no
where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;