--ex1
with job_count_cte as 
(select company_id, title, description, 
count (job_id) as job_count
from job_listings
group by company_id, title, description)

select count(distinct company_id) as duplicate_companies
from job_count_cte 
where job_count>1;

--ex2
with ranking_cte as (
select category, product,
sum(spend) as total_spend,
rank () over (partition by category
order by sum(spend) desc) as ranking
from product_spend
where extract(year from transaction_date)='2022'
group by category, product)

select category, product, total_spend
from ranking_cte
where ranking <=2;

--ex3
with call_count_cte as (
select policy_holder_id, 
count (case_id) as call_count
from callers
group by policy_holder_id
having count (case_id)>=3)

select 
count (policy_holder_id) as policy_holder_count
from call_count_cte 

--ex4
SELECT p1.page_id
FROM pages as p1
left join page_likes as p2
on p1.page_id=p2.page_id
where p2.liked_date is null
order by p1.page_id;

--ex5
select 
extract(month from curr_month.event_date) as mth,
count(distinct curr_month.user_id) as monthly_active_users
from user_actions as curr_month
where exists (
select last_month.user_id from user_actions as last_month
where last_month.user_id=curr_month.user_id
and extract(month from last_month.event_date=extract(month from curr_month.event_date-interval '1 month'))
and extract(month from curr_month.event_date)=7
and extract(year from curr_month.event_date)=2022
group by extract(month from curr_month.event_date);

--ex6
select 
left(trans_date,7) as month,
country,
count(id) as trans_count,
sum(state='approved') as approved_count,
sum(amount) as trans_total_amount,
sum(state='approved')*amount as approved_total_amount
from transactions
group by month, country;

--ex7
select product_id, year as first_year, quantity, price
from sales
where(product_id, year) in (select  product_id, min(year) from sales group by product_id);

--ex8
select customer_id 
from Customer 
group by customer_id
having count(distinct product_key) = (select count(product_key) from product);

--ex9
select e1.employee_id
from employees as e1
left join employees as e2
on e1.manager_id = e2.employee_id
where e1.salary < 30000 
and e2.employee_id is null 
and e1.manager_id is not null
order by employee_id;

--ex10
with job_count_cte as 
(select company_id, title, description, 
count (job_id) as job_count
from job_listings
group by company_id, title, description)

select count(distinct company_id) as duplicate_companies
from job_count_cte 
where job_count>1

--ex11
(select name as results
from MovieRating join Users using(user_id)
group by name
order by count(*) desc, name
limit 1)

union all

(select title as results
from MovieRating join Movies using(movie_id)
where extract(year_month from created_at) = 202002
group by title
order by avg(rating) desc, title
limit 1);

--ex12
select id, count(*) as num 
from 
(select requester_id as id from requestaccepted
union all
select accepter_id as id 
from requestaccepted) request
group by id
order by count(*) desc
limit 1
