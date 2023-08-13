SELECT *
FROM departments

SELECT *
FROM dept_emp

1-- List the employee number, last name, first name, sex,
-- and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, s.salary
FROM employees as e
join salaries as s
on e.emp_no =s.emp_no

2-- #List the first name, last name, and hire date 
-- for the employees who were hired in 1986.
SELECT e.last_name, e.first_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

3-- List the manager of each department along with their 
-- department number, department name, employee number, 
-- last name, and first name.
SELECT e.first_name,e.last_name,dm.dept_no,
dep.dept_name,dm.emp_no
FROM dept_manager dm
right join employees e 
on e.emp_no=dm.emp_no
join departments dep
on dm.dept_no=dep.dept_no;

4-- List the department number for each employee along 
-- with that employee’s employee number, last name, 
-- first name, and department name.
SELECT e.first_name,e.last_name,dep.dept_no,
dep.dept_name,e.emp_no
FROM employees e
join dept_emp de
on e.emp_no=de.emp_no
join departments dep
on de.dept_no=dep.dept_no;

5-- List first name, last name, and sex of each employee whose first name 
-- is Hercules and whose last name begins with the letter B (2 points)
SELECT e.first_name,e.last_name,e.sex
FROM employees e
WHERE first_name='Hercules' and last_name like 'B%'

6-- List each employee in the Sales department, including their employee number,
-- last name, and first name (2 points)
SELECT e.first_name,e.last_name,dep.dept_name,e.emp_no
FROM employees e
left join dept_emp de
on e.emp_no=de.emp_no
join departments dep
on de.dept_no=dep.dept_no
WHERE dept_name='Sales';

7-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name (4 points)
SELECT e.first_name,e.last_name,dep.dept_name,e.emp_no
FROM employees e
left join dept_emp de
on e.emp_no=de.emp_no
join departments dep
on de.dept_no=dep.dept_no
WHERE dept_name='Sales' or dept_name='Development';


8-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name) (4 points)
SELECT last_name,COUNT(*) AS last_name_count
FROM employees
Group by last_name
Order by Last_name desc
