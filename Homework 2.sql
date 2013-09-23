-- Homework 2
-- September 23, 2013
-- Jonathan Pistilli

-- 1

select city
from agents
where aid in
	(select aid
	 from orders
	 where cid = 
		(select cid
		 from customers
		 where cid = 'c002'));

-- 2

select pid
from products
where pid in
	(select pid
	 from orders
	 where aid =
		(select aid
		 from agents
		 where city = 'Tokyo'))

-- 3

select cid, name
from customers
where cid in
	(select cid
	 from orders
	 where aid != 'a03')

-- 4

select cid, name
from customers
where cid in
        (select cid
        from orders
        where pid in
                (select pid
                from products
                where pid = 'p01'))
  and cid in
        (select cid
        from orders
        where pid in
                (select pid
                from products
                where pid = 'p07'))
        
-- 5

select pid
from products
where pid in
	(select pid
	 from orders
	 where aid = 'a03')

-- 6

select name, discount
from customers
where cid in
	(select cid
	 from orders
	 where aid in
		(select aid
		 from agents
		 where city = 'Dallas' 
		    or city = 'Duluth'))

-- 7

select *
from customers
where discount in
	(select discount
	 from customers
	 where city = 'Dallas'
	    or city = 'Kyoto')







