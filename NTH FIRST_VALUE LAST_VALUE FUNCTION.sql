/* 
https://www.techonthenet.com/oracle/functions/nth_value.php 
https://www.techonthenet.com/oracle/functions/nth_value_ddl.php

*/

SELECT DISTINCT dept_id, NTH_VALUE(salary,2)
 OVER (PARTITION BY dept_id ORDER BY salary DESC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "SECOND HIGHEST"
FROM employees_1
WHERE dept_id in (10,20)
ORDER BY dept_id;


SELECT DISTINCT DEPARTMENT , NTH_VALUE(SALARY,2) OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "2ND HIGHEST" FROM STAFF WHERE DEPARTMENT IN ('Automotive','Baby','Beauty','Books') ORDER BY 1;
/* DEPARTMENT	4TH HIGHEST
Automotive	144724
Baby	148573
Beauty	143853
Books	146701
 RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING -- THIS SAYS INCLUDE ALL ROWS PRECEDING AND FOLLOWING */
 
SELECT DISTINCT DEPARTMENT , NTH_VALUE(SALARY,2) OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS "2ND HIGHEST" FROM STAFF WHERE DEPARTMENT IN ('Automotive','Baby','Beauty','Books') ORDER BY 1;

/* WITHOUT RANGE OPERATOR THE NULLS ARE COMING AS  --always use range clause to get correct result

windowing_clause	                                              Description
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW	              Last row in the window changes as the current row changes (default)
RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING	              First row in the window changes as the current row changes
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING	      All rows are included in the window, regardless of the current row

*/
