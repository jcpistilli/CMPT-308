-- Homework 1
-- September 16, 2013
-- Jonathan Pistilli


-- 1

select *
from customers;

-- 2

select name, city
from agents
where name = 'Smith';

-- 3
select pid, name, quantity
from products
where priceUSD > 1.25;

-- 4
select ordno, aid
from orders;

-- 5 
select name, city
from customers
where city != 'Dallas';

-- 6
select name
from agents
where city = 'New York' OR city = 'Newark' ;

-- 7
select *
from products
where priceUSD <= 1.00 
AND city != 'New York' 
AND city != 'Newark';

-- 8
select *
from orders
where mon = 'jan' 
OR mon = 'mar';

-- 9
select *
from orders
where mon = 'feb' 
AND dollars < 100;

-- 10
select *
from orders
where cid = 'C005';





















