--ex1
select name from CITY 
where CountryCode='USA'and population>120000;

--ex2
select * from city where countrycode='JPN';

--ex3
select city, state from station;

--ex4
select city from station where city like 'A%' or city like 'E%' or city like 'I%' or city like 'U%' or city like 'O%';

--ex5

--ex6

--ex7
select name from employee 
order by name

--ex8
select name from employee
where salary>2000 
and months<10
order by employee_id

--ex9
select product_id from products
where low_fats ='Y' and recyclable ='Y'

--ex10
select name from customer 
where referee_id <> 2 or referee_id is null;

--ex11
select name, population, area from world
where area >= 3000000 or population >= 25000000
order by population

--ex12
select distinct author_id as id from views
where author_id = viewer_id
order by author_id 

--ex13
SELECT part, assembly_step FROM parts_assembly
where finish_date is NULL

--ex14
 select * from lyft_drivers 
  where yearly_salary < 30000 or yearly_salary >= 70000;

--ex15


