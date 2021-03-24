.echo on
.headers on
.mode column

--Name: Samer Khamisi
--File Name: lab2a.Khamisi.sql
--Date: January 19, 2021

--1. What are the regions?

select * from region;

--2. What are the cities?

select * from territories;

--3. What are the cities in the Southern region?

select * from territories where regionid = 4;

--4. How do you run this query with the fully qualified column name?

select territories.territoryID, territories.territoryDescription, territories.RegionID 
from territories where RegionID = 4;

--5. How do you run this query with a table alias?

select T.territoryID, T.territoryDescription, T.RegionID
 from territories T where RegionID = 4;

--6. What is the contact name, telephone number, and city for each customer?

select c.contactName, c.phone, c.city from customers c;

--7. What are the products currently out of stock?

select productID, productName, unitsinstock from products where unitsinstock = 0;

--8. What are the ten products currently in stock with the least amount on hand?

select p.productID, p.productName, p.unitsinstock from products p where unitsinstock > 0 order by unitsinstock limit 10;

--9. What are the five most expensive products in stock?

select productID, unitprice, unitsinstock, productName from products where unitsinstock > 0 order by unitprice desc limit 5;

--10. How many products does Northwind have? How many customers? How many suppliers?

select count(productID) from products;
select count(customerID) from customers;
select count(supplierID) from suppliers;
