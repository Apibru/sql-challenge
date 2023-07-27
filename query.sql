---List the employee number, last name, first name, sex, and salary of each employee.--
SELECT emp.emp_no, first_name, last_name, sex, sal.salary 
FROM Employees AS emp
LEFT JOIN salaries AS sal
ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

---List the first name, last name, and hire date for the employees who were hired in 1986--
SELECT first_name,last_name, hire_date FROM Employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

---List the manager of each department along with their department number, department name, employee number, last name, and first na
SELECT d.department_no, d.department_name, m.emp_no, e.last_name
FROM Departments d
JOIN Dept_Managers m ON d.department_no = m.dept_no
JOIN Employees e ON m.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, d.department_no, d.department_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.department_no;

---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name,last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

---List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.first_name,e.last_name, d.department_name
FROM Employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dept_no = d.department_no
WHERE d.department_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name,e.last_name, d.department_name
FROM Employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.department_no
WHERE d.department_name IN ('Sales', 'Development');

---List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;