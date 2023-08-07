
/*
In the following workbook is a simple project where we will be doing sql queries on a dataset that we are creating with columns
customer_id,first_name,last_name,credit_rating,salary,job_title,years_since_joining,age,outstanding_debt,bank_rating,gender.
After creating the columns i have listed above we will be perfoming queries on the dataset .The queries include
SELECT
FROM
BETWEEN
AND
WHERE
GROUP BY
ORDER BY
HAVING
UPDATE,SET
ARITHMETIC FUNCTIONS SUCH AS COUNT,AVG
CASE STATEMENTS USE CASES
CREATING CTE -A Common Table Expression (CTE) is a temporary result set in a SQL query that allows you to define a subquery and reference it within the main query, providing improved readability and reusability.
CREATING TEMPORARY TABLES  -A temporary table is a database table that is created and exists only for the duration of a database session. It is used to store and manipulate temporary data within a specific session and is automatically dropped 
when the session ends. Temporary tables are useful for holding intermediate results or performing complex operations that require temporary storage.
CREATING STORED PROCEDURES  -A temporary table is a database table that is created and exists only for the duration of a database session. It is used to store and manipulate temporary data within a specific session and is automatically
 dropped when the session ends. Temporary tables are useful for holding intermediate results or performing complex operations that require temporary storage.
CREATING SUBQUERIES   -A subquery, also known as an inner query or nested query, is a query nested within another SQL query. It is enclosed within parentheses and used inside the WHERE, HAVING, or FROM clauses of the main query
. The subquery is executed first and its result is used by the outer query to perform further operations or filtering, allowing for complex and flexible data retrieval and manipulation.

ALL THE TYPE OF UNIONS JOINS ,OUTERJOINS,INNER JOINS LEFT AND RIGHT JOINS WE HAVE COVERD IN ANOTHER PROJECT THUS WE WONT BE COVERING HERE


This is part one of analysisng our data where  we are using sql the other part we will be using POWERBI  to visualize everything from the above data . We can use these queries to pracise since they are easy to read and user friendly.









*/

-- Create the table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    credit_rating INT,
    salary DECIMAL(10, 2),
    job_title VARCHAR(100),
    years_since_joining INT,
    age INT,
    outstanding_debt VARCHAR(3),
    bank_rating INT,
    gender VARCHAR(10)
);

INSERT INTO Customers (customer_id, first_name, last_name, credit_rating, salary, job_title, years_since_joining, age, outstanding_debt, bank_rating, gender)
VALUES
    (1, 'John', 'Doe', 750, 50000.00, 'Software Engineer', 5, 30, 'Yes', 8, 'Male'),
    (2, 'Jane', 'Smith', 800, 60000.00, 'Marketing Manager', 8, 35, 'No', 9, 'Female'),
    (3, 'Michael', 'Johnson', 680, 45000.00, 'Accountant', 2, 28, 'Yes', 7, 'Male'),
    (4, 'Emily', 'Williams', 720, 55000.00, 'HR Specialist', 6, 29, 'No', 8, 'Female'),
    (5, 'David', 'Brown', 820, 70000.00, 'Senior Developer', 10, 38, 'No', 9, 'Male'),
    (6, 'Sarah', 'Anderson', 790, 62000.00, 'Sales Manager', 7, 32, 'No', 8, 'Female'),
    (7, 'Robert', 'Lee', 680, 48000.00, 'Customer Support', 4, 27, 'Yes', 7, 'Male'),
    (8, 'Jessica', 'Miller', 770, 58000.00, 'Financial Analyst', 5, 31, 'No', 8, 'Female'),
    (9, 'William', 'Wilson', 720, 52000.00, 'Software Engineer', 3, 26, 'Yes', 7, 'Male'),
    (10, 'Megan', 'Taylor', 750, 55000.00, 'Marketing Specialist', 5, 29, 'No', 8, 'Female'),
    (11, 'Christopher', 'Martinez', 690, 48000.00, 'Sales Representative', 3, 25, 'Yes', 7, 'Male'),
    (12, 'Amanda', 'Davis', 780, 60000.00, 'Product Manager', 6, 32, 'No', 9, 'Female'),
    (13, 'Daniel', 'Moore', 730, 54000.00, 'Account Manager', 4, 28, 'Yes', 7, 'Male'),
    (14, 'Ashley', 'Jackson', 770, 59000.00, 'UX Designer', 5, 30, 'No', 8, 'Female'),
    (15, 'Joseph', 'Harris', 710, 50000.00, 'IT Technician', 3, 27, 'Yes', 7, 'Male'),
    (16, 'Melissa', 'Clark', 810, 65000.00, 'Senior Marketing Manager', 9, 36, 'No', 9, 'Female'),
    (17, 'Andrew', 'Thompson', 700, 52000.00, 'Data Analyst', 4, 28, 'No', 8, 'Male'),
    (18, 'Stephanie', 'Lewis', 760, 58000.00, 'HR Generalist', 6, 31, 'No', 8, 'Female'),
    (19, 'Kevin', 'Lee', 680, 49000.00, 'Customer Service Specialist', 3, 26, 'Yes', 7, 'Male'),
    (20, 'Nicole', 'Robinson', 790, 61000.00, 'Marketing Coordinator', 7, 33, 'No', 8, 'Female'),
    (21, 'Steven', 'Walker', 730, 54000.00, 'Accountant', 5, 29, 'No', 7, 'Male'),
    (22, 'Heather', 'Green', 740, 57000.00, 'Financial Advisor', 6, 32, 'No', 8, 'Female'),
    (23, 'Brian', 'Hall', 690, 48000.00, 'Software Engineer', 4, 28, 'Yes', 7, 'Male'),
    (24, 'Rachel', 'Perez', 760, 59000.00, 'Sales Manager', 7, 32, 'No', 8, 'Female'),
    (25, 'Timothy', 'Gonzalez', 700, 51000.00, 'Customer Support', 3, 26, 'Yes', 7, 'Male'),
    (26, 'Kimberly', 'Turner', 780, 60000.00, 'Business Analyst', 6, 31, 'No', 9, 'Female'),
    (27, 'Jason', 'Scott', 710, 52000.00, 'Software Developer', 5, 29, 'Yes', 8, 'Male'),
    (28, 'Laura', 'Baker', 740, 58000.00, 'Product Manager', 6, 31, 'No', 8, 'Female'),
    (29, 'Ryan', 'Adams', 720, 53000.00, 'UX Designer', 5, 28, 'No', 7, 'Male'),
    (30, 'Lauren', 'Morris', 750, 56000.00, 'Marketing Specialist', 6, 30, 'No', 8, 'Female'),
    (31, 'Eric', 'Rivera', 700, 50000.00, 'Sales Representative', 4, 27, 'Yes', 7, 'Male'),
    (32, 'Samantha', 'Ward', 780, 60000.00, 'Marketing Manager', 7, 32, 'No', 9, 'Female'),
    (33, 'Mark', 'Nelson', 730, 55000.00, 'Data Analyst', 5, 29, 'No', 8, 'Male'),
    (34, 'Kelly', 'Butler', 750, 57000.00, 'HR Generalist', 6, 31, 'No', 8, 'Female'),
    (35, 'Joshua', 'Evans', 690, 49000.00, 'Customer Service Specialist', 4, 28, 'Yes', 7, 'Male'),
    (36, 'Mary', 'Hill', 790, 61000.00, 'Marketing Coordinator', 7, 33, 'No', 8, 'Female'),
    (37, 'David', 'Bell', 720, 54000.00, 'Accountant', 5, 28, 'No', 7, 'Male'),
    (38, 'Lisa', 'Anderson', 770, 59000.00, 'Financial Advisor', 6, 31, 'No', 8, 'Female'),
    (39, 'Matthew', 'Parker', 710, 51000.00, 'Software Engineer', 4, 27, 'Yes', 7, 'Male'),
    (40, 'Michelle', 'Cook', 780, 59000.00, 'Sales Manager', 7, 32, 'No', 8, 'Female'),
    (41, 'Brandon', 'Bailey', 700, 52000.00, 'Customer Support', 3, 26, 'Yes', 7, 'Male'),
    (42, 'Angela', 'Murphy', 750, 60000.00, 'Business Analyst', 6, 30, 'No', 9, 'Female'),
    (43, 'Justin', 'Richardson', 720, 53000.00, 'Software Developer', 5, 28, 'No', 8, 'Male'),
    (44, 'Ashley', 'Ross', 760, 58000.00, 'Product Manager', 6, 31, 'No', 8, 'Female'),
    (45, 'Kyle', 'Perry', 710, 51000.00, 'UX Designer', 4, 27, 'Yes', 7, 'Male'),
    (46, 'Rebecca', 'Long', 780, 60000.00, 'Marketing Specialist', 7, 32, 'No', 8, 'Female'),
    (47, 'Scott', 'Foster', 730, 55000.00, 'Data Analyst', 5, 29, 'No', 8, 'Male'),
    (48, 'Anna', 'Ward', 770, 58000.00, 'HR Generalist', 6, 31, 'No', 8, 'Female'),
    (49, 'Patrick', 'Howard', 690, 49000.00, 'Customer Service Specialist', 3, 26, 'Yes', 7, 'Male'),
    (50, 'Amy', 'Morgan', 790, 61000.00, 'Marketing Coordinator', 7, 33, 'No', 8, 'Female'),
        (51, 'Adam', 'Cooper', 710, 53000.00, 'Accountant', 5, 29, 'No', 8, 'Male'),
    (52, 'Christina', 'Reed', 760, 59000.00, 'Financial Analyst', 6, 31, 'No', 8, 'Female'),
    (53, 'Jeremy', 'Nguyen', 700, 52000.00, 'Software Engineer', 4, 28, 'Yes', 7, 'Male'),
    (54, 'Katherine', 'Chen', 780, 61000.00, 'Marketing Manager', 7, 32, 'No', 9, 'Female'),
    (55, 'Aaron', 'Wright', 730, 55000.00, 'Data Analyst', 5, 29, 'No', 8, 'Male'),
    (56, 'Vanessa', 'Scott', 750, 57000.00, 'HR Generalist', 6, 31, 'No', 8, 'Female'),
    (57, 'Ethan', 'King', 690, 49000.00, 'Customer Support', 3, 26, 'Yes', 7, 'Male'),
    (58, 'Monica', 'Nguyen', 790, 62000.00, 'Sales Manager', 7, 33, 'No', 8, 'Female'),
    (59, 'Peter', 'Barnes', 720, 54000.00, 'Business Analyst', 5, 28, 'No', 7, 'Male'),
    (60, 'Hannah', 'Allen', 770, 60000.00, 'Product Manager', 6, 32, 'No', 8, 'Female'),
    (61, 'Jordan', 'Lee', 710, 52000.00, 'UX Designer', 4, 27, 'Yes', 7, 'Male'),
    (62, 'Christine', 'Ward', 780, 59000.00, 'Marketing Specialist', 7, 32, 'No', 8, 'Female'),
    (63, 'Evan', 'Lopez', 730, 55000.00, 'Data Scientist', 5, 29, 'No', 8, 'Male'),
    (64, 'Natalie', 'Murray', 750, 57000.00, 'Financial Advisor', 6, 31, 'No', 8, 'Female'),
    (65, 'Austin', 'Hughes', 690, 49000.00, 'Customer Service Specialist', 3, 26, 'Yes', 7, 'Male'),
    (66, 'Kelsey', 'Wright', 790, 62000.00, 'Marketing Coordinator', 7, 33, 'No', 8, 'Female'),
    (67, 'Alex', 'Gomez', 720, 54000.00, 'Software Engineer', 5, 28, 'No', 7, 'Male'),
    (68, 'Nicole', 'Stewart', 760, 59000.00, 'Sales Representative', 6, 31, 'No', 8, 'Female'),
    (69, 'Tyler', 'Kelly', 710, 52000.00, 'Customer Support', 4, 27, 'Yes', 7, 'Male'),
    (70, 'Vanessa', 'Rivera', 780, 60000.00, 'Business Analyst', 7, 32, 'No', 9, 'Female'),
    (71, 'Cameron', 'Rossi', 730, 55000.00, 'Software Developer', 5, 29, 'No', 8, 'Male'),
    (72, 'Brittany', 'Phillips', 750, 57000.00, 'Product Manager', 6, 31, 'No', 8, 'Female'),
    (73, 'Jared', 'Murphy', 690, 49000.00, 'UX Designer', 3, 26, 'Yes', 7, 'Male'),
    (74, 'Morgan', 'Peterson', 790, 62000.00, 'Marketing Specialist', 7, 33, 'No', 8, 'Female'),
    (75, 'Alex', 'Foster', 720, 54000.00, 'Accountant', 5, 28, 'No', 7, 'Male'),
    (76, 'Courtney', 'Bennett', 770, 60000.00, 'Financial Analyst', 6, 32, 'No', 8, 'Female'),
    (77, 'Sean', 'Kim', 710, 52000.00, 'Software Engineer', 4, 27, 'Yes', 7, 'Male'),
    (78, 'Julia', 'Martin', 780, 59000.00, 'Marketing Manager', 7, 32, 'No', 8, 'Female'),
    (79, 'Justin', 'Nguyen', 730, 55000.00, 'Data Analyst', 5, 29, 'No', 8, 'Male'),
    (80, 'Paige', 'Cooper', 750, 57000.00, 'HR Generalist', 6, 31, 'No', 8, 'Female'),
    (81, 'Benjamin', 'Allen', 690, 49000.00, 'Customer Support', 3, 26, 'Yes', 7, 'Male'),
    (82, 'Sara', 'Ward', 790, 62000.00, 'Sales Manager', 7, 33, 'No', 8, 'Female'),
    (83, 'Bryan', 'Baker', 720, 54000.00, 'Business Analyst', 5, 28, 'No', 7, 'Male'),
    (84, 'Maria', 'Gray', 760, 59000.00, 'Product Manager', 6, 31, 'No', 8, 'Female'),
    (85, 'Jonathan', 'James', 710, 52000.00, 'UX Designer', 4, 27, 'Yes', 7, 'Male'),
    (86, 'Melanie', 'Lee', 780, 60000.00, 'Marketing Specialist', 7, 32, 'No', 8, 'Female'),
    (87, 'Kyle', 'Smith', 730, 55000.00, 'Data Scientist', 5, 29, 'No', 8, 'Male'),
    (88, 'Laura', 'Wright', 750, 57000.00, 'Financial Advisor', 6, 31, 'No', 8, 'Female'),
    (89, 'Scott', 'Evans', 690, 49000.00, 'Customer Service Specialist', 3, 26, 'Yes', 7, 'Male'),
    (90, 'Kayla', 'Morgan', 790, 62000.00, 'Marketing Coordinator', 7, 33, 'No', 8, 'Female'),
    (91, 'Eric', 'Rodriguez', 720, 54000.00, 'Software Engineer', 5, 28, 'No', 7, 'Male'),
    (92, 'Ashley', 'Lee', 760, 59000.00, 'Sales Representative', 6, 31, 'No', 8, 'Female'),
    (93, 'Kevin', 'Gonzalez', 710, 52000.00, 'Customer Support', 4, 27, 'Yes', 7, 'Male'),
    (94, 'Stephanie', 'Hernandez', 780, 60000.00, 'Business Analyst', 7, 32, 'No', 9, 'Female'),
    (95, 'Daniel', 'Thompson', 730, 55000.00, 'Software Developer', 5, 29, 'No', 8, 'Male'),
    (96, 'Rachel', 'Roberts', 750, 57000.00, 'Product Manager', 6, 31, 'No', 8, 'Female'),
    (97, 'Joseph', 'Carter', 690, 49000.00, 'UX Designer', 3, 26, 'Yes', 7, 'Male'),
    (98, 'Emily', 'Harris', 790, 62000.00, 'Marketing Specialist', 7, 33, 'No', 8, 'Female'),
    (99, 'Andrew', 'Baker', 720, 54000.00, 'Accountant', 5, 28, 'No', 7, 'Male'),
    (100, 'Olivia', 'Turner', 760, 59000.00, 'Financial Analyst', 6, 31, 'No', 8, 'Female');

    

   
select* from   customers;

-- WHERE SATEMENT
SELECT *
FROM Customers
WHERE age > 20 AND salary >= 20000 AND  gender ='Female';

select DISTINCT(gender)  from customers;


-- GROUP BY STATEMENT
select gender,COUNT(gender)
from customers
group by gender;

select job_title ,COUNT(job_title) as number
from customers
where age>30
group by job_title
order by number DESC;

-- CASE STATEMENTS 
SELECT first_name, last_name, age,
       CASE
           WHEN age > 30 THEN 'OLD'
           WHEN age BETWEEN 27 AND 30 THEN 'YOUNG'
           ELSE 'BABY'
       END AS age_group
FROM Customers
ORDER BY age;


-- HAVING CALUSE

SELECT  job_title,COUNT(job_title)
from customers
group by job_title
having  COUNT(job_title) >1;

-- HAVING WHILE COMBINING WITH THE OTHER COMMANDS

SELECT job_title, AVG(salary) AS average_salary
FROM Customers
GROUP BY job_title
HAVING AVG(salary) > 60000
ORDER BY AVG(salary);


-- Run the update statement
UPDATE customers
SET customer_id = 99.0
WHERE first_name = 'Andrew';

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;


-- PARTITION BY STATEMNTS

select first_name,gender,AVG(salary),job_title,
COUNT(job_title)OVER(PARTITION BY job_title)  as total_roles  from customers;

SELECT first_name, gender, AVG(salary) AS average_salary, job_title, COUNT(job_title) OVER (PARTITION BY job_title) AS total_roles
FROM customers
GROUP BY first_name, gender, job_title;



-- CREATING A CTE (COMMON TABLE EXPRESSION)
WITH CTE_customer as (
SELECT first_name, gender, AVG(salary) AS average_salary, job_title, COUNT(job_title) OVER (PARTITION BY job_title) AS total_roles
FROM customers
GROUP BY first_name, gender, job_title
)
  select * from CTE_customer;
  
  
 -- CREATING A TEMPORARY TABLE
DROP TABLE IF EXISTS temp_data3;
CREATE TEMPORARY TABLE temp_data3 (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    credit_rating INT,
    salary DECIMAL(10, 2),
    job_title VARCHAR(100),
    years_since_joining INT,
    age INT,
    outstanding_debt VARCHAR(3),
    bank_rating INT,
    gender VARCHAR(10)
);

INSERT INTO temp_data3 (customer_id, first_name, last_name, credit_rating, salary, job_title, years_since_joining, age, outstanding_debt, bank_rating, gender)
SELECT customer_id, first_name, last_name, credit_rating, salary, job_title, years_since_joining, age, outstanding_debt, bank_rating, gender
FROM customers;
select * from temp_data3

  
  
-- CREATING A PROCEDURE
CREATE PROCEDURE TEST
AS 
select *
from customers


DELIMITER //

CREATE PROCEDURE GetCustomerData()
BEGIN
    SELECT customer_id, first_name, last_name, credit_rating, salary, job_title, years_since_joining, age, outstanding_debt, bank_rating, gender
    FROM customers;
END //

DELIMITER ;



-- CREATING A  SUBQUERY

SELECT customer_id, salary, (SELECT AVG(salary) FROM customers) AS avgsalary
FROM customers;

SELECT customer_id, job_title, salary
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE age > 30
);



