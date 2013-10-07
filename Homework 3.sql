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

select c.name, c.city
from customers c
where c.city in(
	select city
	from (
		select c.name, c.city, count(p.city)
		from products p, customers c
		where c.city = p.city
		group by c.name, c.city, p.city
		order by count(p.city) asc
		limit 1) sub1)

-- 10

select c.name, c.city
from customers c
where c.city in(
	select city
	from (
		select c.name, c.city, count(p.city)
		from products p, customers c
		where c.city = p.city
		group by c.name, c.city, p.city
		order by count(p.city) desc
		limit 1) sub1)

-- 11

select c.name, c.city
from customers c
where c.city in(
	select city
	from (
		select c.name, c.city, count(p.city)
		from products p, customers c
		where c.city = p.city
		group by c.name, c.city, p.city
		order by count(p.city) desc
		) sub1)

-- 12

select p.name as "Product Name" 
from products p
group by p.name
having avg(priceUSD) > (select avg(priceUSD)
			from products)
order by p.name asc


-- 13

select c.name, o.pid, o.dollars
from customers c, orders o
where c.cid = o.cid
order by dollars asc


-- 14

select c.name, coalesce( sum(o.dollars), 0 )
from customers c left outer join orders o on c.cid = o.cid
group by c.name, c.cid
order by c.name asc


-- 15

select distinct c.name, p.name, a.name
from customers c,
     products p,
     orders o,
     agents a
where a.city = 'New York'
  AND c.cid = o.cid
  AND o.aid = a.aid
  AND o.pid = p.pid

-- 16

select o.dollars, (o.qty * p.priceUSD * (1-c.discount/100)) as "Calculated Price"
from orders o, 
     products p, 
     customers c
where c.cid = o.cid
  AND p.pid = o.pid

-- 17

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1027, 'jan', 'c001', 'a01', 'p01', 1000, 550.00);













