--ex1
select name
from students
where marks>75
order by right(name,3), id;

--ex2
select user_id,
concat(upper(left(name,1)), lower(right(name,length(name)-1))) as name
from users
order by user_id

--ex3
select manufacturer,
concat('$', round(sum(total_sales)/1000000,0), ' ', 'million') as sum_of_sales
from pharmacy_sales
group by manufacturer
order by (sum(total_sales)) desc, manufacturer;

--ex4
select product_id,
extract(month from submit_date) as mth,
round(avg(stars),2) as avg_stars
from reviews
group by mth, product_id
order by mth, product_id;

--ex5: why where sent_date between ('08/01/2022 00:00:00', '09/01/2022 00:00:00') wrong?
select sender_id,
count(message_id) as message_count
from messages
where extract(month from sent_date)=8
and extract(year from sent_date)=2022
group by sender_id
order by message_count desc
limit 2;

--ex6
select tweet_id 
from tweets
where length(content)>15;

--ex7
select 
count(employee_id) as number_employee
from employees
where extract(month from joining_date) between 1 and 7
and extract(year from joining_date)=2022;

--ex8
select
position('a' in first_name) as position
from worker
where first_name='Amitah';

--ex9
select
substring(title,length(winery)+2,4)
from wigemag_p2
where country='Macedonia';
