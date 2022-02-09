use Northwind
/* Æwiczenie
--1
select count(*) from Products where UnitPrice < 10 or UnitPrice > 20
--2
select max(unitprice) from Products where UnitPrice < 20
--3
select max(unitprice), min(unitprice), avg(unitprice) from Products where QuantityPerUnit like '%bottle%'
--4
select * from Products where UnitPrice > (select avg(UnitPrice) from Products)
--5
select sum(unitprice * quantity * (1-discount)) from [Order Details] where OrderID = 10250
*/

/* Przyk³ad
 Napisz polecenie, które zwraca informacje o zamówieniach
	- zapytanie ma grupowaæ i wyœwietlaæ identyfikator ka¿dego produktu, a
	  nastêpnie obliczaæ ogóln¹ zamówion¹ iloœæ
	- ogólna iloœæ jest sumowana funkcj¹ agreguj¹c¹ SUM i wyœwietlana jako jedna
	  wartoœæ dla ka¿dego produktu.
select ProductID, sum(quantity) as total_quantity from [Order Details] group by ProductID
*/

/* Æwiczenia
--1
select max(unitprice) from [Order Details] group by OrderID
--2 
select MAX(unitprice), min(unitprice) from [Order Details] group by OrderID
--3
select shipvia, count(*) from Orders group by ShipVia
--4
select top 1 shipvia, count(OrderID) as ile from Orders group by ShipVia order by ile desc
*/

/* Przyk³ad 
Wyœwietl listê identyfikatorów produktów i iloœæ dla tych produktów, których zamówiono ponad 1200 jednostek
select ProductID, sum(quantity) 
as total_quantity from [Order Details]
group by ProductID having sum(Quantity) > 1200;
*/

/* Æwiczenia 1
--1 
select OrderID from [Order Details] group by orderid having count(ProductID) > 5
--2 
select customerid, count(*) from Orders where shippeddate like '%1998%' group by CustomerID having count(*) > 8 order by sum(freight) desc
*/

/* Æwiczenia dodatkowe
--1 Ile lat przepracowa³ w firmie ka¿dy z pracowników?
*/ select EmployeeID, HireDate, DATEDIFF(YEAR,hiredate,getdate()) from Employees