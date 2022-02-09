/* Æwiczenie 1 – wybieranie danych
--1
select title, title_no from title
--2
select title from title where title_no = 10
--3
select member_no, fine_assessed from loanhist where fine_assessed between 8 and 9
--4
select title_no, title, author from title where author in ('Charles Dickens','Jane Austen')
--5
select title_no, title from title where title like '%adventures%'
--6
select member_no, fine_assessed, fine_paid from loanhist where fine_assessed > 0 and fine_paid is null
--7
select distinct city, state from adult order by city
*/

/* Æwiczenie 2 – manipulowanie wynikowym zbiorem
--1
select title from title order by title
--2
select member_no, isbn, fine_assessed, fine_assessed * 2 as 'double fine'  from loanhist where fine_assessed > 0
--3
select lower(replace(firstname,' ','') + middleinitial + substring(lastname,1,2)) as email_name from member where lastname = 'Anderson'
--4
select 'The title is: ' + title + ' title number ' + convert(varchar,title_no) from title
*/