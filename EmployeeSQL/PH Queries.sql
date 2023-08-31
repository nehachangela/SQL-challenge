-- 1--- employees name sex and salary
--- join employees and salary
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2-- All employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY "hire_date" ASC;

-- 3 --- Department mangers 
--- list Department numbers, dept name, emp numb, last name, firsst name
SELECT dm.dept_no, 
	d.dept_name,  
	e.emp_no, 
	e.last_name, 
	e.first_name
FROM dept_manager as dm
INNER JOIN departments as d ON 
dm.dept_no = d.dept_no
INNER JOIN employees as e ON
dm.emp_no =  e.emp_no;

-- 4 --- Department names for each employees 
--- list Department numbers, emp numb, last name, first name, dept name
SELECT de.dept_no,  
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name 
FROM dept_emp as de
INNER JOIN departments as d ON 
de.dept_no = d.dept_no
INNER JOIN employees as e ON
de.emp_no =  e.emp_no;

-- 5-- Employees first name Hercules and  last name starting with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' And last_name LIKE 'B%';

-- 6 --- employees in Sales department
--- list emp numb, last name, first name, dept name
SELECT e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name 
FROM dept_emp as de
INNER JOIN departments as d ON 
de.dept_no = d.dept_no
INNER JOIN employees as e ON
de.emp_no =  e.emp_no
WHERE dept_name = 'Sales';

-- 7 --- employees in Sales and Development department
--- list emp numb, last name, first name, dept name
SELECT e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name 
FROM dept_emp as de
INNER JOIN departments as d ON 
de.dept_no = d.dept_no
INNER JOIN employees as e ON
de.emp_no =  e.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8-- Select count of employees last names in descending order
SELECT last_name, COUNT(last_name) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;
