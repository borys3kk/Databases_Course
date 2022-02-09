/*
Æwiczenie 1
--1
Dla ka¿dego zamówienia podaj ³¹czn¹ liczbê zamówionych jednostek
oraz nazwê klienta.
use Northwind;
select od.OrderID, sum(od.quantity) as 'Quantity', o.CustomerID
	from [Order Details] od
	inner join Orders o
	on o.OrderID = od.OrderID
	inner join Customers c
	on c.CustomerID = o.CustomerID
	where od.orderid is not null
	group by od.OrderID, o.CustomerID
	order by o.CustomerID;
--2
Zmodyfikuj poprzedni przyk³ad, aby pokazaæ tylko takie zamówienia,
dla których ³¹czna liczbê zamówionych jednostek jest wiêksza ni¿
250.
use Northwind;
select od.OrderID, sum(od.quantity) as 'Quantity', o.CustomerID
	from [Order Details] od
	inner join Orders o
	on o.OrderID = od.OrderID
	full join Customers c
	on c.CustomerID = o.CustomerID
	where od.orderid is not null
	group by od.OrderID, o.CustomerID
	having sum(od.quantity) > 250
	order by o.CustomerID;
--3
Dla ka¿dego zamówienia podaj ³¹czn¹ wartoœæ tego zamówienia oraz
nazwê klienta.
use Northwind;
select od.OrderID, sum(od.Quantity) as 'Quantity' , sum(od.quantity*od.unitprice*(1-od.discount)) as 'Value' , c.CompanyName 
	from [Order Details] od
	inner join Orders o
	on o.OrderID = od.OrderID
	full join Customers c
	on c.CustomerID = o.CustomerID
	group by od.orderid, c.CompanyName;
*/

/*
Zmodyfikuj poprzedni przyk³ad, aby pokazaæ tylko takie zamówienia,
dla których ³¹czna liczba jednostek jest wiêksza ni¿ 250.
use Northwind;
select od.OrderID, sum(od.Quantity) as 'Quantity' , sum(od.quantity*od.unitprice*(1-od.discount)) as 'Value' , c.CompanyName 
	from [Order Details] od
	inner join Orders o
	on o.OrderID = od.OrderID
	full join Customers c
	on c.CustomerID = o.CustomerID
	group by od.orderid, c.CompanyName
	having sum(Quantity) > 250;
*/

/*
Zmodyfikuj poprzedni przyk³ad tak ¿eby dodaæ jeszcze imiê i
nazwisko pracownika obs³uguj¹cego zamówienie
use Northwind;
select od.OrderID, sum(od.Quantity) as 'Quantity' ,
	sum(od.quantity*od.unitprice*(1-od.discount)) as 'Value',
	c.CompanyName, e.FirstName, e.LastName
	from [Order Details] od
	inner join Orders o
	on o.OrderID = od.OrderID
	inner join Customers c
	on c.CustomerID = o.CustomerID
	inner join Employees e
	on e.EmployeeID = o.EmployeeID
	group by od.orderid, c.CompanyName,e.FirstName,e.LastName
	having sum(Quantity) > 250;
*/

/*
Dla ka¿dej kategorii produktu (nazwa), podaj ³¹czn¹ liczbê
zamówionych przez klientów jednostek towarów.
use Northwind;
select c.CategoryName, sum(od.quantity) from [Order Details] od
	inner join Products p
	on p.ProductID = od.ProductID
	inner join Categories c
	on c.CategoryID = p.CategoryID
	group by c.CategoryName, c.CategoryID
*/

/*
Dla ka¿dej kategorii produktu (nazwa), podaj ³¹czn¹ wartoœæ
zamówieñ
use Northwind;
select c.CategoryName, sum(od.quantity * od.UnitPrice * (1-od.discount)) as 'value' from [Order Details] od
	inner join Products p
	on p.ProductID = od.ProductID
	inner join Categories c
	on c.CategoryID = p.CategoryID
	group by c.CategoryName, c.CategoryID
*/

/*
Posortuj wyniki w zapytaniu z punktu 2 wg
	a)³¹cznej wartoœci zamówieñ
use Northwind;
select c.CategoryName, sum(od.quantity * od.UnitPrice * (1-od.discount)) as 'value' from [Order Details] od
	inner join Products p
	on p.ProductID = od.ProductID
	inner join Categories c
	on c.CategoryID = p.CategoryID
	group by c.CategoryName, c.CategoryID
	order by sum(od.quantity * od.UnitPrice * (1-od.discount))
*/

/*
Posortuj wyniki w zapytaniu z punktu 2 wg
	b) ³¹cznej liczby zamówionych przez klientów jednostek towarów.
use Northwind;
select c.CategoryName, sum(od.quantity * od.UnitPrice * (1-od.discount)) as 'value' from [Order Details] od
	inner join Products p
	on p.ProductID = od.ProductID
	inner join Categories c
	on c.CategoryID = p.CategoryID
	group by c.CategoryName, c.CategoryID
	order by sum(od.quantity)
*/

/*
Dla ka¿dego przewoŸnika (nazwa) podaj liczbê zamówieñ które przewieŸli w 1997r
use Northwind;
select s.CompanyName as ' Shipping Company', count(o.orderid)
	from Orders o
	inner join Shippers s
	on s.ShipperID = o.ShipVia
	where year(o.ShippedDate) = 1997
	group by s.CompanyName, o.ShipVia
*/

/*
Który z przewoŸników by³ najaktywniejszy (przewióz³ najwiêksz¹
liczbê zamówieñ) w 1997r, podaj nazwê tego przewoŸnika
use Northwind;
select top 1 s.CompanyName as ' Shipping Company', count(o.orderid)
	from Orders o
	inner join Shippers s
	on s.ShipperID = o.ShipVia
	where year(o.ShippedDate) = 1997
	group by s.CompanyName, o.ShipVia
	order by count(o.orderid) desc
*/

/*
Który z pracowników obs³u¿y³ najwiêksz¹ liczbê zamówieñ w 1997r,
podaj imiê i nazwisko takiego pracownika
use Northwind;
select top 1 e.FirstName, e.LastName from Orders o
	inner join Employees e
	on e.EmployeeID = o.EmployeeID
	group by e.FirstName, e.LastName,o.EmployeeID
	order by count(*) desc
*/