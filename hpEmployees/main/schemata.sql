-- employees table

create table employees (
	emp_no VARCHAR(35) PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(35) not null,
	birth_date DATE NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	gender VARCHAR(5),
	hire_date DATE
);
-- select * from employees;

-- departments
create table departments (
	dept_no VARCHAR(35) primary key NOT NULL,
	dept_name VARCHAR(35) NOT NULL
);

-- titles
create table titles (
	title_id VARCHAR(35) primary key NOT NULL,
	title VARCHAR(35) NOT NULL
);
select * from titles;

-- departmentemployee

create table departmentemployee (
	__id serial primary key NOT NULL,
	emp_no VARCHAR(35) NOT NULL,
	dept_no VARCHAR(35) NOT NULL
);
ALTER TABLE departmentemployee 
	ADD CONSTRAINT depempno
	FOREIGN KEY (emp_no) 
   REFERENCES employees(emp_no);
ALTER TABLE departmentemployee 
	ADD CONSTRAINT depempno
	FOREIGN KEY (dept_no) 
   REFERENCES employees(emp_no);   

-- select * from departmentemployee;

-- salaries
create table salaries (
	__id serial primary key not null,
	emp_no VARCHAR(35) NOT NULL,
	salary numeric NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

-- departmentmanager
create table departmentmanager (
	__id serial primary key not null,
	dept_no VARCHAR(35) NOT NULL,
	emp_no VARCHAR(35) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

select * from departmentmanager;