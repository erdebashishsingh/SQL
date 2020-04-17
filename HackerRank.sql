SELECT NAME||'('||SUBSTR(OCCUPATION,1,1)||')' NAME , OCCUPATION , COUNT(NAME) OVER ( PARTITION BY OCCUPATION ) CNT FROM OCCUPATIONS;
/** Pivot unpivot **/
with subquery as (
select  case when o.occupation = 'Doctor' then o.name else null end as doc,
        case when o.occupation = 'Professor' then o.name else null end prof,
        case when o.occupation = 'Singer' then o.name else null end singr,
        case when o.occupation = 'Actor' then o.name else null end actr
from Occupations o
) 
select d.doc, p.prof, s.singr, a.actr
from
(select row_number() over (order by x.doc asc) col, x.doc from subquery x) d,
(select row_number() over (order by x.prof asc) col, x.prof from subquery x) p,
(select row_number() over (order by x.singr asc) col, x.singr from subquery x) s,
(select row_number() over (order by x.actr asc) col, x.actr from subquery x) a
where d.col = p.col
and p.col = s.col
and s.col = a.col
and not (d.doc is null and p.prof is null and s.singr is null and a.actr is null)
;