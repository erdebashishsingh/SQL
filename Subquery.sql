SELECT * FROM STAFF WHERE (DEPARTMENT, ID) IN (SELECT DEPARTMENT,ID FROM STAFF WHERE DEPARTMENT = 'Tools');
SELECT * FROM STAFF WHERE (DEPARTMENT, ID) IN (SELECT * FROM STAFF WHERE DEPARTMENT = 'Tools');
/* ORA-00913: too many values
00913. 00000 -  "too many values"
*Cause:    
*Action:
Error at Line: 2 Column: 48 */
