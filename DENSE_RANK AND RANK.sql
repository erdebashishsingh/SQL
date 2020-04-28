/* RANK AND DENSE RANK 
https://www.techonthenet.com/oracle/functions/dense_rank.php 


The Oracle/PLSQL DENSE_RANK function returns the rank of a row in a group of rows. It is very similar to the RANK function. However, the RANK function can cause non-consecutive rankings if the tested values are the same. Whereas, the DENSE_RANK function will always result in consecutive rankings.

The DENSE_RANK function can be used two ways - as an Aggregate function or as an Analytic function.
*/

--DENSE_RANK Function Syntax #1 - Used as an Aggregate Function

--DENSE_RANK( expression1, ... expression_n ) WITHIN GROUP ( ORDER BY expression1, ... expression_n )

SELECT DENSE_RANK(45,876) WITHIN GROUP(ORDER BY HEIGHT , WEIGHT) DENSE_RNK , HEIGHT, WEIGHT FROM CHILDSTAT GROUP BY  HEIGHT, WEIGHT;
SELECT DENSE_RANK(197,5000)  WITHIN GROUP (ORDER BY BONUS, SALARY) DN_RNK  FROM EMPLOYEES;

--DENSE_RANK Function Syntax #2 - Used as an Analytic Function
/* 
As an Analytic function, the DENSE_RANK function returns the rank of each row of a query with respective to the other rows.

The syntax for the DENSE_RANK function when used as an Analytic function is:

DENSE_RANK() OVER ( [ query_partition_clause] ORDER BY clause )

*/
SELECT NAME, SALARY,ID ,DEPARTMENT,
DENSE_RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) "DENSE_RANK"
FROM EMPLOYEES WHERE DEPARTMENT = 'Marketing' ;

/*
NAME	SALARY	ID	DEPARTMENT	DENSE_RANK
Vince	6800	  8	  Marketing	  1
Elice	6800	 14	  Marketing	  1
Will	6500	  4	  Marketing	  2 -- rank is not skipped even though one of the rank is repeated
Jane	5400	  9 	Marketing	  3  

UPDATE EMPLOYEES SET DEPARTMENT = 'Marketing' , SALARY = 6800 WHERE ID = 8;
COMMIT; */

SELECT NAME, SALARY,ID ,DEPARTMENT,
RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) "DENSE_RANK"
FROM EMPLOYEES WHERE DEPARTMENT = 'Marketing' ;
/*
NAME	SALARY	ID	DEPARTMENT	DENSE_RANK
Vince	6800	  8	  Marketing	   1
Elice	6800	  14	Marketing    1
Will	6500	  4	  Marketing	   3 -- Rank becomes 3 unlike in dense_rank where it returns 2
Jane	5400	  9	  Marketing	   4

*/