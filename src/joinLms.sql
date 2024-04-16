--1 Бардык клиенттердин шаарлары уникалдуу чыксын
--1 Make all client cities unique
SELECT city as customers_city FROM Customers group by city;
--2 Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
--2 Entrepreneurs born in the 1950s and 1960s
SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1950 AND 1960;
--3 Франциялык поставщиктердин аттары жана мамлекети чыксын
--3 List the names and countries of the French suppliers
SELECT suppliername,country FROM Suppliers where country='France';
--4 Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
--4 List the name, address and country of clients whose country is other than Spain and whose name starts with "A".
SELECT CustomerName,Address,Country FROM Customers where country not in('Spain') and CustomerName like'A%';
--5 PostalCode бош болгон клиенттер чыксын
--5 Leave clients with empty PostalCode
SELECT * FROM Customers where PostalCode in('');
--6 Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
--6 Remove the first two clients from London
SELECT top 2 * FROM Customers where City='London' order by CustomerID  ;
--7 Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
--7 Names and birth years of businessmen whose last name consists of 4 letters
SELECT FirstName,LastName,BirthDate FROM Employees where LastName like'____';
--8 Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
--8 Find out how many distributors there are in each country
SELECT country,count(*) as suppliersCount FROM Suppliers group by country;
--9 Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
--9 Sort countries with only 1 supplier by name
SELECT country,count(*) as suppliersCount FROM Suppliers group by country having count(*) =1 order by country;
--10 Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
--10 Total the products in each category
SELECT CategoryName, SUM(price) AS JalpySumma FROM Products p inner join Categories c on p.CategoryID=c.CategoryID group by c.CategoryName;
--11 6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
--11 Find out the cheapest price and name of products in categories 6 and 8
SELECT CategoryID, SUM(price) as Jalpy_summa FROM Products group by CategoryID;
--12 Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
--12 List the names of products and their suppliers (let them be sorted)
SELECT p.ProductID,p.ProductName,p.Price,s.SupplierID,s.SupplierName FROM Products p inner join Suppliers s on p.SupplierID=s.SupplierID order by s.SupplierName;
--13 Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
--13 Sort the number of products of each supplier in descending order
SELECT s.SupplierName,count(p.ProductName) FROM Suppliers s inner join Products p on p.SupplierID=s.SupplierID group by s.SupplierName order by count(p.ProductName) desc;
--14 Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
--14 The name of the customer should be CustomerName, the name of the businessmen selling to him and the information about the delivery service they use
SELECT c.CustomerName, e.FirstName, sh.ShipperName from Customers c,Orders o,Employees e,Shippers sh where c.CustomerID = o.CustomerID and o.EmployeeID = e.EmployeeID  and sh.ShipperID = o.ShipperID;
--15 Кайсы ишкер канча клиент обслуживайтеткен чыксын
--15 How many clients are serviced by any entrepreneur
SELECT e.FirstName, count(c.CustomerName) as skolko_klientov_obslujil from Customers c, Orders o, Employees e where c.CustomerID = o.CustomerID and o.EmployeeID = e.EmployeeID group by e.FirstName order by count(c.CustomerName) desc;