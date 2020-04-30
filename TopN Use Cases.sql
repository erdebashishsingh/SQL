select rank() over (order by salary desc) , salary ,department from staff fetch first 1 rows only;

select * from (select rank() over (partition by department order by salary desc) rnk , salary ,department from staff) where rnk = 1  ;



select * from (select rank() over (order by salary desc) rnk , salary ,department from staff) where rnk = 1  ;
select rank() over (order by salary desc) rnk , salary ,department from staff;