SELECT DEPARTMENT , LAST_NAME , SALARY ,NTILE(5) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) LAG FROM STAFF;
SELECT * FROM DIM_CAL order by 1;
SELECT * FROM STAFF;
SELECT COUNT( START_DATE) OVER(ORDER BY YEAR) CNT ,YEAR,SALARY,LAST_NAME,DEPARTMENT FROM STAFF ST , DIM_CAL CAL WHERE CAL.CALENDAR_DATE = ST.START_DATE;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT FIRST_DAY(SYSDATE) FROM DUAL;
select
   last_day(add_months(sysdate,-1))
from dual;
select trunc(last_day(sysdate)-1, 'mm') from dual;

SELECT (SYSDATE -START_DATE)/365 as datediff,sysdate ,start_date  FROM STAFF;

SELECT DEPARTMENT , LAST_NAME , SALARY ,LAG(SALARY) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) LG FROM STAFF;
SELECT SUBSTR(LAST_NAME,1,1) FROM STAFF;

select Y,X from Functions where X>Y intersect select X,Y from Functions where X<Y group by X,Y union select X,Y from Functions group by X,Y having count(*)>1;