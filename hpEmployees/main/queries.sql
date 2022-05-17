-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select salaries.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
inner join salaries
on salaries.emp_no = employees.emp_no
order by salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select departmentmanager.dept_no, departments.dept_name, departmentmanager.emp_no, employees.last_name, employees.first_name
from departmentmanager 
inner join departments 
on departmentmanager.dept_no= departments.dept_no
inner join employees 
on departmentmanager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
left join departmentmanager as dm
on e.emp_no = dm.emp_no
inner join departments as d
on dm.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join departmentemployee as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where lower(d.dept_name) = 'sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join departmentemployee as de on e.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no
where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name) as freqcount 
from employees 
group by last_name
order by freqcount desc;


