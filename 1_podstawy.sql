use northwind

/*
--Wybór kolumn - ćwiczenia
--1
select CompanyName, Address from Customers
--2
select LastName, HomePhone from Employees
--3
select ProductName, UnitPrice from Products
--4
select CategoryName, Description from Categories
--5
select CompanyName, HomePage from Suppliers
*/

/*
--Wybór wierszy - ćwiczenia
--1
select CompanyName, Address from Customers where city = 'LONDON'
--2
select CompanyName, address from Customers where Country in ('France','Spain')
--3
select ProductName, UnitPrice from Products where UnitPrice between 20 and 30
--4
select ProductName, UnitPrice from Products where CategoryID = 6
--5
select ProductName, UnitsInStock from products where SupplierID = 4
--6
select productname from products where UnitsInStock = 0
*/

/*
Porównywanie napisów (stringów) - ćwiczenie
--1
select * from Products where QuantityPerUnit like '%bottle%'
--2
select lastname, Title from Employees where LastName like '[b-l]%'
--3
select lastname, title from Employees where LastName like '[BL]%'
--4
select CategoryName from Categories where Description like '%[,]%'
--5
select * from Customers where CompanyName like '%store%'
*/

/* Zakres wartości - ćwiczenie
--1
select * from Products where UnitPrice < 10 or UnitPrice > 20
--2
select ProductName, UnitPrice from Products where UnitPrice between 20 and 30
*/

/* Warunki logiczne - ćwiczenie
--1
select CompanyName, Country from Customers where Country in ('Japan','Italy')
*/

/* wartości NULL - ćwiczenie
--1
select OrderID, OrderDate, CustomerID from Orders where ShipCountry = 'Argentina' and ShippedDate < '1998-01-01'
*/

/* Sortowanie danych - ćwiczenie
--1
select CompanyName, Country from Customers order by Country, companyname
--2
select CategoryID, ProductName, UnitPrice from Products order by CategoryID, UnitPrice desc
*/
--3
select CompanyName, Country from Customers where country in ('UK', 'ITALY') order by country, CompanyName