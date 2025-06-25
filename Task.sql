-- Create Table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    manager_id INT DEFAULT NULL
);

-- Insert Statements
INSERT INTO employees (id, name, email, salary, department, manager_id)
VALUES 
(1, 'Alice Johnson', 'alice@example.com', 70000.00, 'HR', NULL),
(2, 'Bob Smith', 'bob@example.com', 80000.00, 'IT', 1),
(3, 'Charlie Brown', 'charlie@example.com', NULL, 'Finance', NULL),
(4, 'Diana Prince', 'diana@example.com', 90000.00, 'IT', 2),
(5, 'Evan Wright', NULL, 60000.00, 'Marketing', NULL);

-- Update salary for an employee
UPDATE employees
SET salary = 75000.00
WHERE id = 3;

-- Update multiple rows: Change department name
UPDATE employees
SET department = 'Technology'
WHERE department = 'IT';

-- Delete a specific employee
DELETE FROM employees
WHERE id = 5;

-- Insert using default (manager_id will be NULL automatically)
INSERT INTO employees (id, name, email, salary, department)
VALUES (6, 'Farah Lee', 'farah@example.com', 67000.00, 'Finance');

-- Insert values using SELECT (Copying data)
CREATE TABLE temp_employees AS
SELECT * FROM employees WHERE department = 'Finance';

-- Insert into employees using SELECT from temp_employees
INSERT INTO employees (id, name, email, salary, department, manager_id)
SELECT id + 10, name, email, salary, department, manager_id FROM temp_employees;

-- Demonstrate IS NULL usage: Give bonus to those without manager
UPDATE employees
SET salary = salary + 1000
WHERE manager_id IS NULL;

-- Optional: Rollback demo (only works in environments that support transactions)
-- START TRANSACTION;
-- DELETE FROM employees WHERE department = 'Finance';
-- ROLLBACK;
