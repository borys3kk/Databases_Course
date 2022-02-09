use Northwind
/* Æwiczenie 1
--1
select orderid, sum(UnitPrice*Quantity*(1-Discount))
from [Order Details] group by OrderID order by 
sum(UnitPrice*Quantity*(1-Discount)) desc;
--2
select top 10 orderid, sum(UnitPrice*Quantity*(1-Discount))
from [Order Details] group by OrderID order by 
sum(UnitPrice*Quantity*(1-Discount)) desc;
--3
select top 10 with ties orderid, sum(UnitPrice*Quantity*(1-Discount))
from [Order Details] group by OrderID order by 
sum(UnitPrice*Quantity*(1-Discount)) desc;
*/

/* Æwiczenie 2
--1
select productid, sum(Quantity) from [Order Details]
where ProductID < 3 group by ProductID;
--2
select productid, sum(Quantity) from [Order Details]
group by ProductID;
--3
select OrderID, sum(UnitPrice*Quantity*(1-Discount)),
sum(Quantity) from [Order Details] group by 
OrderID having SUM(Quantity) > 250 order by 
sum(quantity) desc;
*/

/* Æwiczenie 3
--1
select sum(quantity) as 'suma' ,
ProductID, orderid from [Order Details]
group by rollup(ProductID,OrderID);
--2
select sum(quantity) as 'suma' ,
ProductID, orderid from [Order Details]
where productid = 50
group by rollup(ProductID,OrderID);
--3
du¿e -> to s¹ podsumowania
--4
select ProductID, orderid, sum(quantity) as suma, GROUPING(orderid) as 'orderidgroup', grouping(productid) as 'productid'
	from [Order Details]
	group by cube(ProductID,OrderID)
	order by suma desc;
*/