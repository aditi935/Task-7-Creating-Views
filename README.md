# 📘 Task 7: Creating Views in SQL  

## 🎯 Objective  
Learn how to create and use **views** in SQL for abstraction, security, and reusability of complex queries.  

## 🛠 Tools  
- DB Browser for SQLite  
- MySQL Workbench  

## 📦 Deliverables  
- View definitions  
- Usage examples  

---

## 📂 Database Setup  

### 🔹 1. Create Tables  

We create two tables:  

#### `departments` table  
Stores information about different departments.  

| Column Name      | Data Type      | Description                 |
|------------------|---------------|-----------------------------|
| department_id    | INT (PK)      | Unique ID for department    |
| department_name  | VARCHAR(100)  | Name of the department      |

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

#### `employees` table  
Stores details of employees and their salaries, linked to departments.  

| Column Name      | Data Type      | Description                         |
|------------------|---------------|-------------------------------------|
| employee_id      | INT (PK)      | Unique ID for employee              |
| first_name       | VARCHAR(50)   | Employee’s first name               |
| last_name        | VARCHAR(50)   | Employee’s last name                |
| salary           | DECIMAL(10,2) | Employee’s salary                   |
| department_id    | INT (FK)      | Department ID (linked to department)|

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

---

### 🔹 2. Insert Sample Data  

```sql
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
```

---

## 🔹 3. SQL View Commands  

### 1. Create View – High Salary Employees  
We create a view to show employees earning more than `60000`.  

```sql
CREATE VIEW high_salary_employees AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > 60000;
```

**Output:**  

| employee_id | first_name | last_name | salary |
|-------------|------------|-----------|--------|
| 101         | Aditi      | Sharma    | 75000  |
| 103         | Priya      | Singh     | 90000  |
| 106         | Vikas      | Nair      | 85000  |

---

### 2. View with Join – Employees and Departments  
This view combines employees with their department names.  

```sql
CREATE VIEW employee_department AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

**Output:**  

| employee_id | first_name | last_name | department_name |
|-------------|------------|-----------|-----------------|
| 101         | Aditi      | Sharma    | IT              |
| 102         | Rohan      | Mehta     | HR              |
| 103         | Priya      | Singh     | Finance         |
| 104         | Arjun      | Patel     | Marketing       |
| 105         | Sneha      | Kapoor    | HR              |
| 106         | Vikas      | Nair      | IT              |

---

### 3. Select from a View  
We can query the view like a table.  

```sql
SELECT * FROM high_salary_employees WHERE salary > 80000;
```

**Output:**  

| employee_id | first_name | last_name | salary |
|-------------|------------|-----------|--------|
| 103         | Priya      | Singh     | 90000  |
| 106         | Vikas      | Nair      | 85000  |

---

### 4. Update View (Replace Existing)  
We modify the view to include employees with salary above `50000` and also show `department_id`.  

```sql
CREATE OR REPLACE VIEW high_salary_employees AS
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 50000;
```

**Output:**  

| employee_id | first_name | last_name | salary | department_id |
|-------------|------------|-----------|--------|---------------|
| 101         | Aditi      | Sharma    | 75000  | 3             |
| 103         | Priya      | Singh     | 90000  | 2             |
| 104         | Arjun      | Patel     | 60000  | 4             |
| 106         | Vikas      | Nair      | 85000  | 3             |

---

### 5. Drop a View  
To delete a view:  

```sql
DROP VIEW high_salary_employees;
```

👉 The view `high_salary_employees` is now removed.  

---

## ✅ Outcome  
By completing this task, we:  
- Learned to **create, query, update, and drop views**.  
- Understood how views provide **abstraction, reusability, and security**.  
- Practiced **complex SQL logic** with reusable queries.  

---
