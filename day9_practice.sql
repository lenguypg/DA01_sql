--ex1
SELECT 
sum(case
when device_type='laptop' then 1 else 0 end) as laptop_view,
sum(case
when device_type in ('phone','tablet') then 1 else 0 end) as mobile_views
FROM viewership;

--ex2
select x,y,z,
case
when x+y>z and x+z>y and y+z>x then 'Yes' else 'No'
end as triangle
from triangle;

--ex3
SELECT 
round((sum(case when call_category= 'n/a' or NULL then 1 else 0 end)/count(*))*100,1) 
as uncategorised_call_pct
FROM callers;

--ex4
select name
from customer
where referee_id is null or referee_id<>'2';

--ex5
select 
case
when pclass = 1 then 'first_class'
when pclass = 2 then 'second_classs'
else 'third_class' end as category,
sum(case
when survived=1 then 1 else 0 end) as suvivors,
sum(case
when survived=0 then 1 else 0 end) as non_survivors
from titanic
group by pclass
