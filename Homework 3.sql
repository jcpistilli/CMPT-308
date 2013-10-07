-- Homework 3
-- October 7, 2013
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

select a.city
from agents a inner join orders o on a.aid = o.aid
	      inner join customers c on o.cid = c.cid
where c.cid = 'c002'


-- 3
-- This first one gets the pids in order and I'm not sure
select pid
from products
where pid in
	(select pid
	 from orders
	 where aid in
		(select aid
		 from agents
		 where aid in
			(select aid
			 from orders
			 where cid in
				(select cid
				 from customers
				 where city = 'Kyoto'))))

-- OR --

select distinct pid
from orders
where aid in
	(select aid
	 from orders o,
	 	  customers c
	 where o.cid = c.cid
	 and c.city = 'Kyoto')

-- 4

select distinct o2.pid
from orders o1 inner join customers c on o1.cid = c.cid
	       inner join orders o2 on o2.aid = o1.aid
where c.city = 'Kyoto'
order by o2.pid asc

-- 5

select name
from customers
where cid not in
	(select cid
	 from orders)

-- 6

select name
from customers c left outer join orders o
	on c.cid = o.cid
where o.ordno is null

-- 7

select customers.name, agents.name
from customers, agents
where cid in
	(select cid
	 from orders
	 where aid in
		(select aid
		 from agents
		 where agents.city = customers.city))
AND
      aid in
	(select aid
	 from orders
	 where cid in
		(select cid
		 from customers
		 where customers.city = agents.city))


-- 8

select c.name as "Customer Name", a.name as "Agent Name", c.city as "City"
from customers c, agents a
where cid in
	(select cid
	 from orders
	 where aid in
		(select aid
		 from agents
		 where a.city = c.city))
order by c.city asc

-- 9




































