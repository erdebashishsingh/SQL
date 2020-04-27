SELECT A.FIRSTNAME ,
  A.GENDER ,
  A.WEIGHT ,
  A.HEIGHT,
  SUM(WEIGHT) OVER(ORDER BY HEIGHT  RANGE BETWEEN 10 PRECEDING AND 5 FOLLOWING) AS SUM_10_5 /*
  The Range refers to the column mentioned in the order by . In this case it sums up the weight of all whose height are between -10 and +5 of the current row's height
  */
  FROM CHILDSTAT A   ;
/* output  
FIRSTNAME	GENDER	  WEIGHT	  HEIGHT	  SUM_10_5
ROSEMARY   	F	        123	      35	      123
BUDDY	      M	        189	      45	      462
ALBERT	    M	        150	      45	      462
LAUREN	    F	        876     	54	      1215
FARQUAR	    M	        198	      76	      365
TOMMY	      M	        167	      78	      365
SIMON	      M	        256	      87	      423

*/