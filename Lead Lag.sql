/* LEAD FUNCTION
https://www.techonthenet.com/oracle/functions/lead.php
*/
/* LAG FUNCTION
https://www.techonthenet.com/oracle/functions/lag.php
*/
SELECT ID,
  DEPARTMENT ,
  SALARY,
  LEAD(SALARY,1) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) LD
FROM STAFF;
SELECT ID,
  CALENDAR_DATE,
  LEAD(C.CALENDAR_DATE,1) OVER(ORDER BY C.CALENDAR_DATE) "LEAD_DT" ,
  LAG(C.CALENDAR_DATE,1) OVER(ORDER BY C.CALENDAR_DATE) "LAG_DT" ,
  SALARY
FROM DIM_CAL C ,
  STAFF S
WHERE S.START_DATE = C.CALENDAR_DATE
ORDER BY 2 ASC;