--1

use Northwind;
select c.CategoryName, p1.ProductName, UnitPrice,
	(select avg(unitprice) from Products p 
	where p1.categoryid = p.categoryid
	group by CategoryID ) as avg_price_category
	,p1.UnitPrice - (select avg(unitprice) from Products p) as 'difference between unitprice and all_products_avg price'
	from products p1
	inner join Categories c
	on c.CategoryID = p1.CategoryID

--2

use Northwind;
select year(o.orderdate), datepart(q,o.orderdate) as 'Quarter' , sum(od.unitprice * od.quantity * (1-od.discount)) as 'Total Price'
	,sum(od.quantity) as 'Total quantity'
	from Orders o
	inner join [Order Details] od
	on od.OrderID = o.orderid
	group by rollup (year(o.orderdate),datepart(q,o.orderdate))

--3

use Northwind;
select o.OrderID, c.CompanyName, s.CompanyName, o.Freight
	from Orders o
	inner join Customers c
	on c.CustomerID = o.CustomerID
	inner join Shippers s
	on s.ShipperID = o.ShipVia
	where o.freight > 0.6 * 
	(select avg(o1.freight) 
	from Orders o1
	where month(OrderDate) in (3,4,5))
	order by s.CompanyName