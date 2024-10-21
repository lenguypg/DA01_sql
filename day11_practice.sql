--ex1
select b.continent, 
floor(avg(a.population)) as avg_population
from city as a
join country as b
on a.CountryCode=b.Code 
group by b.continent;

--ex2
SELECT 
  ROUND(cast(COUNT(texts.email_id) as decimal)/COUNT(DISTINCT emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';  

--ex3
select age.age_bucket,
round(sum(case when activity_type='open' then time_spent else 0 end)/sum(time_spent)*100.0,2) as open_perc,
round(sum(case when activity_type='send' then time_spent else 0 end)/sum(time_spent)*100.0,2) as send_perc
from activities
join age_breakdown as age
on activities.user_id=age.user_id
where activities.activity_type in ('send', 'open') --tại sao phải có dòng where trong khi chỉ có 2 gtri send/open
group by age.age_bucket

--ex4
select a.customer_id
from customer_contracts as a
join products as b
on a.product_id=b.product_id
group by a.customer_id
having count (distinct b.product_category)=3 --làm sao để chọn đc product lớn nhất

--ex5
select e1.employee_id,e1.name,
count(e2.reports_to) as reports_count,
round(avg(e2.age),0) average_age
from employees as e1 
join employees e2 
on e2.reports_to=e1.employee_id
group by e1.employee_id,e1.name
order by e1.employee_id
  
--ex6
select p.product_name, 
sum(o.unit) as unit 
from Products as p 
join Orders as o 
on p.product_id=o.product_id 
where o.order_date>='2020-02-01' and o.order_date<='2020-02-29'
group by o.product_id having unit>=100; 

--ex7
SELECT p1.page_id
FROM pages as p1
left join page_likes as p2
on p1.page_id=p2.page_id
where p2.liked_date is null;
