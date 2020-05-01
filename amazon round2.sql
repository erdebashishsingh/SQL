/* my solution 

*SQL Question: Airline*

Table1: FLIGHTS
ORIGIN     Destination DURATION (hrs)       DATE_TIME                   PASSENGERS
SEA        JFK         6                    12/18/2019 10:15             180
LAS        ORD         4                    12/18/2019 11:00             120
ORD        SEA         5                    12/19/2019 12:15             75
JFK        SEA         6                    12/20/2019 18:15             150


*Give me most popular and Least Popular destination by each month in 2019*
Output:
Month                 Destination     
December 2019         SEA             
December 2019         ORD             


WITH RESULT AS (SELECT TO_CHAR(DATE_TIME,'MM')||TO_CHAR(DATE_TIME,'YYYY') AS "MONTH" ,
RANK() OVER(PARTITION BY TO_CHAR(DATE_TIME,'MM')||TO_CHAR(DATE_TIME,'YYYY') BY ORDER BY PASSENGERS DESC) RNK, DESTINATION   
 FROM FLIGHTS   ) 
 SELECT MONTH , DESTINATION FROM RESULT WHERE (RNK,MONTH) IN (SELECT MAX(RNK),MONTH  FROM RESULTS GROUP BY MONTH UNION  
 SELECT MIN(RNK) ,MONTH FROM RESULTS GROUP BY MONTH);
 
 
 SELECT 
 
 Amazon.com retail $10,000,000 weekly revenue We have a 15% drop in revenue compared to the previous week, what all possible reason could cause this.
 
 
VisitorLog : 
Date          VisitorId
01-Jan-2011     V1 
01-Jan-2011     V2 
01-Jan-2011     V3 
02-Jan-2011     V2 
03-Jan-2011     V2 
03-Jan-2011     V4 
03-Jan-2011     V5

   Date     Total_Visitors VisitorGain VisitorLoss  
01-Jan-2011      3              3            0            3 
02-Jan-2011      1              0            2            0 
03-Jan-2011      3              2            0            2

SELECT DATE, LAG(DATE ,1) OVER(ORDER BY DATE) AS PREV_VISIT , VISITORID FROM VISITORLOG;

V1 DATE PREV_DATE 

(SELECT MIN(DATE) , VISITORID FROM VISITORLOG GROUP BY VisitorId  )


 */
 
/* result */

with res as (SELECT COUNT(VISITORID) cnt , DT   FROM VISITORLOG GROUP BY DT) 
 select dt ,cnt,cnt- lag(cnt,1) over (order by dt) as lg , lead(cnt,1) over (order by dt)- cnt ld from res;
 
 select * from FLIGHTS;
 with res as (select sum(passengers) sm, destination , to_char(date_time,'mm') dt from flights group by DESTINATION ,to_char(date_time,'mm'))
 select rank() over(partition by dt order by sm desc) rnk , dt , destination from res
 union 
 select rank() over(partition by dt order by sm asc) rnk , dt , destination from res;