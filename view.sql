
-- 🔹 1. Create Tables
-- departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 🔹 2. Insert Sample Data

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO employees (employee_id, first_name, last_name, salary, department_id) VALUES
(101, 'Aditi', 'Sharma', 75000, 3),
(102, 'Rohan', 'Mehta', 45000, 1),
(103, 'Priya', 'Singh', 90000, 2),
(104, 'Arjun', 'Patel', 60000, 4),
(105, 'Sneha', 'Kapoor', 30000, 1),
(106, 'Vikas', 'Nair', 85000, 3);

-- 🔹 3. SQL View Commands

-- 1. Create View – High Salary Employees
CREATE VIEW high_salary_employees AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > 60000;

-- Query the view to see results
SELECT * FROM high_salary_employees;

-- 2. View with Join – Employees and Departments
CREATE VIEW employee_department AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Query the view to see results
SELECT * FROM employee_department;

-- 3. Select from a View with Filter
SELECT * FROM high_salary_employees WHERE salary > 80000;

-- 4. Update View (Replace Existing)
CREATE OR REPLACE VIEW high_salary_employees AS
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 50000;

-- Query the updated view
SELECT * FROM high_salary_employees;

-- 5. Drop a View
DROP VIEW high_salary_employees;

-- Additional: Verify view is dropped (this will cause an error if view doesn't exist)
-- SELECT * FROM high_salary_employees;
