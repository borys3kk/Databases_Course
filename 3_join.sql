-- use joindb;
/*
-- U¿ycie aliasów dla nazw tabel
-- Przyk³ad 1 (bez aliasu nazwy tabel)
select buyer_name, sales.buyer_id,qty from Buyers, sales
where buyers.buyer_id = sales.buyer_id;
--Przyk³ad 2 (z aliasem nazwy tabel)
select buyer_name, s.buyer_id, qty	
	from Buyers as b, sales as s
	where b.buyer_id = s.buyer_id;
*/
/*
-- Przyk³ad 1 (bez aliasu nazwy tabel)
select buyer_name, sales.buyer_id, qty
	from Buyers inner join sales
	on Buyers.buyer_id = Sales.buyer_id
-- Przyk³ad 2 (z aliasem nazwy tabel)
select buyer_name, s.buyer_id, qty
	from Buyers as b inner join sales as s
	on b.buyer_id = s.buyer_id;
*/
-- £¹czenie danych z wielu tabel
-- Iloczyn kartezjañski
/*
select b.buyer_name as [b.buyer_name],
	   b.buyer_id as [b.buyer_id],
	   s.buyer_id as [s.buyer_id],
	   qty as [s.qty]
	from buyers as b, sales as s;
*/

-- Warunek
/*
select b.buyer_name as [b.buyer_name],
	b.buyer_id as [b.buyer_id],
	s.buyer_id as [s.buyer_id],
	qty as [s.qty]
	from buyers as b, sales as s
	where b.buyer_name = 'Adam Barr';
 */
 -- Warunki z³¹czenia
/*
 select b.buyer_name as [b.buyer_name],
	b.buyer_id as [b.buyer_id],
	s.buyer_id as [s.buyer_id],
	qty as [s.qty]
	from buyers as b, sales as s
	where s.buyer_id = b.buyer_id
		and
		b.buyer_name = 'Adam Barr';
*/

/*
-- Z³¹czenie cd
select buyer_name, b.buyer_id, qty	
	from Buyers as b, sales as s
	where s.buyer_id = b.buyer_id;
select buyer_name, sales.buyer_id, qty 
	from Buyers inner join Sales
	on Buyers.buyer_id = Sales.buyer_id;
*/
/* 
-- Napisz polecenie zwracaj¹ce nazwy produktów i firmy je dostarczaj¹ce
use Northwind;
select Productname, CompanyName 
	from Products
	inner join Suppliers
	on Suppliers.SupplierID = Products.SupplierID;
*/
/* 
-- Napisz polecenie zwracaj¹ce jako wynik nazwy klientów, którzy z³o¿yli zamówienia po 1 marca 1998
use Northwind;
select CompanyName from Customers
	inner join Orders
	on Orders.CustomerID = Customers.CustomerID
	where Orders.OrderDate > '3/1/98';
*/

/*
-- Z³¹czenie zewnêtrzne – OUTER JOIN
-- left outer join == left join
use joindb;
select buyer_name, sales.buyer_id, qty
	from Buyers left outer join Sales
	on Buyers.buyer_id = Sales.buyer_id
use Northwind;
select companyname, customers.CustomerID, orderdate
	from Customers
	left join Orders
	on Customers.CustomerID = Orders.CustomerID;
	
-- Napisz polecenie, które wyœwietla listê dzieci bêd¹cych 
cz³onkami biblioteki. 
Interesuje nas imiê, nazwisko i data urodzenia dziecka.
use library;
select firstname, lastname, j.birth_date
	from member as m, juvenile as j
	where m.member_no = j.member_no;
select m.firstname, m.lastname, birth_date
	from member as m
	inner join juvenile
	on juvenile.member_no = m.member_no;
dwa sposoby z joinami i bez
--Napisz polecenie, które podaje tytu³y aktualnie wypo¿yczonych ksi¹¿ek
use library;
select title.title
	from title inner join loanhist
	on title.title_no = loanhist.title_no
	where out_date is not null and in_date is null;
*/ 

/* Podaj informacje o karach zap³aconych za przetrzymywanie
ksi¹¿ki o tytule ‘Tao Teh King’. Interesuje nas data oddania
ksi¹¿ki, ile dni by³a przetrzymywana i jak¹ zap³acono karê 
use library;
select loanhist.fine_paid, loanhist.in_date,
	DATEDIFF(day,loanhist.in_date, loan.out_date) from loanhist
	inner join title
	on loanhist.title_no = title.title_no
	inner join loan
	on loan.title_no = title.title_no
	where title = 'Tao Teh King' and loanhist.fine_paid is not null
*/

/*
--Napisz polecenie które podaje listê ksi¹¿ek (mumery ISBN) 
-- zarezerwowanych przez osobê o nazwisku: Stephen A. Graff
use library;
select isbn from reservation
	inner join member
	on member.member_no = reservation.member_no
	where firstname = 'Stephen' and lastname = 'Graff' and middleinitial = 'A';
*/

/* Wybierz nazwy i ceny produktów o cenie jednostkowej
pomiêdzy 20 a 30, dla ka¿dego produktu podaj dane adresowe dostawcy
use Northwind;
select ProductName, UnitPrice, Suppliers.Address+ ' '
	+ Suppliers.City + ' ' + Suppliers.Country as 'Full Address'
	from Products inner join Suppliers
	on Products.SupplierID = Suppliers.SupplierID
	where UnitPrice between 20 and 30
*/

/* Wybierz nazwy produktów oraz informacje o stanie
magazynu dla produktów dostarczanych przez firmê ‘Tokyo
SQL – operacje z³¹czenia
Traders’
use Northwind;
select ProductName, UnitsInStock 
	from Products inner join Suppliers
	on Suppliers.SupplierID = Products.SupplierID
	where CompanyName = 'Tokyo Traders';
*/

/* Czy s¹ jacyœ klienci którzy nie z³o¿yli ¿adnego zamówienia
w 1997 roku, jeœli tak to poka¿ ich dane adresowe
use Northwind;
select distinct CompanyName, Address, City 
	from Customers inner join Orders
	on Customers.CustomerID = Orders.CustomerID
	where year(OrderDate) != 1997;
*/

/* Wybierz nazwy i numery telefonów dostawców,
dostarczaj¹cych produkty, których aktualnie nie ma w
magazynie
select CompanyName, Phone 
	from Suppliers inner join Products
	on Suppliers.SupplierID = Products.SupplierID
	where UnitsInStock = 0 or UnitsInStock is null;
*/

/* 
CROSS JOIN – iloczyn karteziañski
use joindb;
select buyer_name, qty
	from Buyers
	cross join Sales;
*/

/*
Napisz polecenie, wyœwietlaj¹ce CROSS JOIN miêdzy
shippers i suppliers. U¿yteczne dla listowania wszystkich
mo¿liwych sposobów w jaki dostawcy mog¹ dostarczaæ
swoje produkty
use Northwind;
select Suppliers.CompanyName, Shippers.CompanyName
	from Suppliers
	cross join Shippers
*/

/* 
£¹czenie wiêcej ni¿ dwóch tabel
use joindb;
select buyer_name, prod_name, qty
	from Buyers
	inner join Sales
	on Buyers.buyer_id = Sales.buyer_id
	inner join Produce
	on Sales.prod_id = Produce.prod_id
*/

/* 
Napisz polecenie zwracaj¹ce listê produktów zamawianych
w dniu 1996-07-08.
use Northwind
select orderdate, productname
	from Orders as O
	inner join [Order Details] as OD
	on O.OrderID = OD.OrderID
	inner join Products as p
	on p.ProductID = od.ProductID
	where OrderDate = '7/8/96'
*/
/* 
Wybierz nazwy i ceny produktów (baza northwind) o cenie
jednostkowej pomiêdzy 20 a 30, dla ka¿dego produktu
podaj dane adresowe dostawcy, interesuj¹ nas tylko
produkty z kategorii ‘Meat/Poultry’
use Northwind;
select ProductName, UnitPrice, s.Address, s.City, s.Country
	from Products as p inner join Suppliers as s
	on p.SupplierID = s.SupplierID
	inner join Categories as c
	on p.CategoryID = c.CategoryID
	where (UnitPrice between 20 and 30) and c.CategoryName = 'Meat/poultry';
*/

/* 
Wybierz nazwy i ceny produktów z kategorii ‘Confections’
SQL – operacje z³¹czenia
 Wybierz nazwy i ceny produktów z kategorii ‘Confections’
dla ka¿dego produktu podaj nazwê dostawcy.
use Northwind;
select ProductName, UnitPrice, CompanyName
	from Products as p inner join Suppliers as s
	on p.SupplierID = s.SupplierID
	inner join Categories as c
	on c.CategoryID = p.CategoryID
	where c.CategoryName = 'confections';
*/

/* 
Wybierz nazwy i numery telefonów klientów , którym w
1997 roku przesy³ki dostarcza³a firma ‘United Package’
use Northwind;
select distinct c.CompanyName, c.Phone 
	from Customers as c inner join Orders as o
	on c.CustomerID = o.CustomerID
	inner join Shippers as s
	on o.ShipVia = s.ShipperID
	where s.CompanyName = 'United Package'
	order by c.CompanyName;
*/

/* 
Wybierz nazwy i numery telefonów klientów, którzy
kupowali produkty z kategorii ‘Confections’
select distinct c.companyname, c.phone 
	from Customers as c inner join Orders as o
	on o.CustomerID = c.CustomerID
	inner join [Order Details] as od
	on od.OrderID = o.OrderID
	inner join Products as p
	on p.ProductID = od.ProductID
	inner join Categories as cat
	on cat.CategoryID = p.CategoryID
	where cat.CategoryName = 'confections'
*/

/* Napisz polecenie, które wyœwietla listê dzieci bêd¹cych
cz³onkami biblioteki. Interesuje nas imiê, nazwisko, data
urodzenia dziecka i adres zamieszkania dziecka.
use library;
select m.firstname, m.lastname, j.birth_date, a.city + ' ' + a.street + ' ' + a.state
	from juvenile as j inner join member as m
	on m.member_no = j.member_no
	inner join adult as a
	on a.member_no = j.adult_member_no;
*/

/* 
Napisz polecenie, które wyœwietla listê dzieci bêd¹cych
cz³onkami biblioteki. Interesuje nas imiê, nazwisko, data
SQL – operacje z³¹czenia
urodzenia dziecka, adres zamieszkania dziecka oraz imiê i
nazwisko rodzica.
use library;
select m.firstname, m.lastname, j.birth_date, a.city + ' ' + a.street + ' ' + a.state,  am.firstname + ' ' + am.lastname
	from juvenile as j inner join member as m
	on m.member_no = j.member_no
	inner join adult as a
	on a.member_no = j.adult_member_no
	inner join member as am 
	on a.member_no = am.member_no;
*/

/*
£¹czenie tabeli samej ze sob¹ – self join
use joindb;
select a.buyer_id as buyer1, a.prod_id, b.buyer_id as buyer2
	from sales as a
	join sales as b
	on a.prod_id = b.prod_id
	where a.buyer_id < b.buyer_id;
*/

/*
Napisz polecenie, które wyœwietla listê wszystkich kupuj¹cych te same produkty
use joindb;
select a.buyer_id as buyer1, a.prod_id, b.buyer_id as buyer2
	from sales as a inner join sales as b
	on a.prod_id = b.prod_id;
*/

/*
Zmodyfikuj poprzedni przyk³ad, tak aby zlikwidowaæ duplikaty
use joindb;
select a.buyer_id as buyer1, a.prod_id, b.buyer_id as buyer2
	from sales as a inner join sales as b
	on a.prod_id = b.prod_id
	where a.buyer_id <> b.buyer_id;
select a.buyer_id as buyer1, a.prod_id, b.buyer_id as buyer2
	from sales as a inner join sales as b
	on a.prod_id = b.prod_id
	where a.buyer_id <> b.buyer_id;
*/

/*
Napisz polecenie, które pokazuje pary pracowników zajmuj¹cych to samo stanowisko
use Northwind;
select e1.EmployeeID, e1.LastName as name, e1.Title as title,
	e2.EmployeeID, e2.LastName as name, e2.Title as title
	from Employees as e1 inner join Employees as e2
	on e1.Title = e2.Title
	where e1.EmployeeID < e2.EmployeeID;
*/

/*
Napisz polecenie, które wyœwietla pracowników i ich podw³adnych
use northwind;
select e1.FirstName+ ' ' +  e1.LastName as szefunio, e2.FirstName + ' ' + e2.LastName as podw³adny, e2.ReportsTo
	from Employees as e1 inner join Employees as e2
	on e1.EmployeeID = e2.ReportsTo
	order by e1.FirstName;
*/

/*
 Napisz polecenie, które wyœwietla pracowników, którzy nie
maj¹ podw³adnych.
use Northwind;
select CONCAT(e1.firstname,' ',e1.lastname) as 'name'
	from Employees as e1 left join Employees as e2
	on e1.EmployeeID = e2.ReportsTo
	where e2.ReportsTo is null;
select *
	from Employees as e1 left join Employees as e2
	on e1.EmployeeID = e2.ReportsTo;
*/
/*
Napisz polecenie, które wyœwietla adresy cz³onków
biblioteki, którzy maj¹ dzieci urodzone przed 1 stycznia
1996
use library;
select distinct CONCAT(a.street,', ', a.city,' ',a.zip) 
	from adult as a inner join juvenile as j
	on j.adult_member_no = a.member_no
	where year(j.birth_date) < 1996;
*/

/*
Napisz polecenie, które wyœwietla adresy cz³onków
biblioteki, którzy maj¹ dzieci urodzone przed 1 stycznia
1996. Interesuj¹ nas tylko adresy takich cz³onków biblioteki,
którzy aktualnie nie przetrzymuj¹ ksi¹¿ek.
select distinct CONCAT(a.street,', ', a.city,' ',a.zip) 
	from adult as a inner join juvenile as j
	on j.adult_member_no = a.member_no
	where year(j.birth_date) < 1996 and a.member_no not in (select member_no from loan);
*/

/*
 U¿yj operatora UNION do tworzenia pojedynczego zbioru
	wynikowego z wielu zapytañ
	Ka¿de zapytanie musi mieæ:
		-zgodne typy danych
		-tak¹ sam¹ liczbê kolumn
		-taki sam porz¹dek kolumn w select-list
use Northwind;
select (firstname + ' ' + lastname) as name, city, postalcode
	from Employees
	union
	select companyname, city, postalcode
		from Customers;
*/

/*
 Napisz polecenie które zwraca imiê i nazwisko (jako
pojedyncz¹ kolumnê – name), oraz informacje o adresie:
ulica, miasto, stan kod (jako pojedyncz¹ kolumnê – address)
dla wszystkich doros³ych cz³onków biblioteki
select (m.firstname + ' ' + m.lastname) as name, (a.city+' '+a.state+' '+a.zip) as address
	from adult as a inner join member as m
	on m.member_no = a.member_no;
*/

/*
Napisz polecenie które zwraca informacjê o u¿ytkownikach
biblioteki o nr 250, 342, i 1675 (nr, imiê i nazwisko cz³onka
SQL – operacje z³¹czenia
biblioteki) oraz informacje o zarezerwowanych ksi¹¿kach
(isbn, data) 
use library;
select m.member_no, m.firstname, m.lastname, r.isbn, r.log_date
	from member as m left join reservation as r
	on r.member_no = m.member_no
	where m.member_no in (250,342,1675)
select *
	from member as m inner join reservation as r
	on r.member_no = m.member_no
select *
	from member as m left join reservation as r
	on r.member_no = m.member_no
*/

/*
Podaj listê cz³onków biblioteki mieszkaj¹cych w Arizonie
(AZ), którzy maj¹ wiêcej ni¿ dwoje dzieci zapisanych do
biblioteki 
select m.lastname, m.firstname
	from member as m
	inner join adult as a
		on a.member_no = m.member_no
	where m.member_no in
	(select adult_member_no 
		from juvenile 
		group by adult_member_no
		having count(*) > 2)
	and a.state = 'az'
union 
select m.lastname, m.firstname
	from member as m
	inner join adult as a
		on a.member_no = m.member_no
	where m.member_no in
	(select adult_member_no 
		from juvenile 
		group by adult_member_no
		having count(*) > 3)
	and a.state = 'ca'
*/

/*
Dla ka¿dej kategorii produktu (nazwa), podaj ³¹czn¹ liczbê
zamówionych przez klienta jednostek.
*/
use Northwind;
select od.OrderID
	from [Order Details] as od
	full join orders as o
	on o.OrderID = od.OrderID
	group by CustomerID