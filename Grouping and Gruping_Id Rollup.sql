/** website : 
https://codingsight.com/understanding-grouping-and-grouping_id-functions-in-sql-server/
*/
-- Grouping Returns/tells if the row is a total/subtotal - it returns 1 if the row is a total/subtotal

CREATE TABLE employeeS
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    department VARCHAR(50) NOT NULL
 );


 INSERT INTO employeeS
VALUES
(1, 'David', 'Male', 5000, 'Sales');
 INSERT INTO employees 
VALUES
(2, 'Jim', 'Female', 6000, 'HR');
 INSERT INTO employees 
VALUES
(3, 'Kate', 'Female', 7500, 'IT');
 INSERT INTO employees 
VALUES
(4, 'Will', 'Male', 6500, 'Marketing');
 INSERT INTO employees 
VALUES
(5, 'Shane', 'Female', 5500, 'Finance');
 INSERT INTO employees 
VALUES
(6, 'Shed', 'Male', 8000, 'Sales')
;
 INSERT INTO employees 
VALUES
(7, 'Vik', 'Male', 7200, 'HR');
 INSERT INTO employees 
VALUES
(8, 'Vince', 'Female', 6600, 'IT');
 INSERT INTO employees 
VALUES
(9, 'Jane', 'Female', 5400, 'Marketing');
 INSERT INTO employees 
VALUES
(10, 'Laura', 'Female', 6300, 'Finance');
 INSERT INTO employees 
VALUES
(11, 'Mac', 'Male', 5700, 'Sales');
 INSERT INTO employees 
VALUES
(12, 'Pat', 'Male', 7000, 'HR');
 INSERT INTO employees 
VALUES
(13, 'Julie', 'Female', 7100, 'IT');
 INSERT INTO employees 
VALUES
(14, 'Elice', 'Female', 6800,'Marketing');
 INSERT INTO employees 
VALUES
(15, 'Wayne', 'Male', 5000, 'Finance');

/* Code start */

SELECT  
department AS Department, 
gender AS Gender, 
sum(salary) as Salary_Sum,
GROUPING(department) as GP_Department,
GROUPING(gender) as GP_Gender
FROM employees
GROUP BY ROLLUP (department, gender);




SELECT  
	CASE WHEN GROUPING(department) = 1 THEN 'All Departments' ELSE NVL(department, 'Unknown') END as Department,
	CASE WHEN GROUPING(gender) = 1 THEN 'All Genders' ELSE NVL(gender, 'Unknown') END as Gender,
	sum(salary) as Salary_Sum
FROM employees
GROUP BY ROLLUP (department, gender);

/* GROUPING_ID Function

The GROUPING_ID function concatenates the output of the GROUPING functions applied to all the columns specified in the GROUP BY clause. It then performs binary to decimal conversion before returning the final output.
*/

SELECT  
department AS Department, 
gender AS Gender, 
sum(salary) as Salary_Sum,
GROUPING(department),
GROUPING(gender),
CAST(GROUPING(department) AS VARCHAR(1)) ||
CAST(GROUPING(gender) AS VARCHAR (1))  as Grouping,
GROUPING_ID(department, gender) as Grouping_Id -- It is the sum of grouping for all columns selected
FROM employees
GROUP BY ROLLUP (department, gender);