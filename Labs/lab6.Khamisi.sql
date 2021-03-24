--Name : Samer Khamisi
--File: lab6.Khamisi.sql
--Date: February 8, 2021

USE TSQLV4;

--1. Find employee IDs who had orders in both January, 2016 AND february, 2016.

SELECT o.empID
FROM sales.orders o
WHERE o.orderDate LIKE '2016-01-%' --Jan empIDs
INTERSECT --Equavalent to 'AND' operator
SELECT o1.empID
FROM sales.orders o1
WHERE o1.orderDate >= '2016-02-01' AND o1.orderDate < '2016-03-01'; --Feb empIDs

--2. Find employee IDs who had orders in both January, 2016 OR february, 2016.

SELECT o.empID
FROM sales.orders o
WHERE o.orderDate LIKE '2016-01-%' --Jan empIDs
UNION --Equavalent to 'OR' operator
SELECT o1.empID
FROM sales.orders o1
WHERE o1.orderDate >= '2016-02-01' AND o1.orderDate < '2016-03-01'; --Feb empIDs

--3. Find employee IDs who had orders in 2016, but NOT 2014.

SELECT o.empID
FROM sales.orders o
WHERE YEAR(o.orderDate) = '2016' --2016 empIDs
EXCEPT --Equavalent to 'NOT' operator
SELECT o1.empID
FROM sales.orders o1
WHERE YEAR(o1.orderDate) = '2014'; --2014 empIDs

--4. Cities and countris where we have both customers and employees.

SELECT e.city, e.country 
FROM hr.employees e
INTERSECT --Equavalent to 'AND' operator
SELECT c.city, c.country 
FROM sales.customers c;

--5. Cities and countris where we have either customers and employees.

SELECT e.city, e.country 
FROM hr.employees e
UNION --Equavalent to 'OR' operator
SELECT c.city, c.country 
FROM sales.customers c;

--6. Cities and countris where we have customers but NOT employees.

SELECT c.city, c.country 
FROM sales.customers c
EXCEPT --Equavalent to 'NOT' operator
SELECT e.city, e.country 
FROM hr.employees e;

--7. Cities and countris where we have employees but NOT customers.

SELECT e.city, e.country 
FROM hr.employees e
EXCEPT --Equavalent to 'NOT' operator
SELECT c.city, c.country 
FROM sales.customers c;

--8. Cities and countris where we have employees but NOT customers AND 
-- cities and countries where we have customers but NOT employees.

SELECT e.city, e.country 
FROM hr.employees e
UNION --Equavalent to 'OR' operator
SELECT c.city, c.country 
FROM sales.customers c
EXCEPT --Equavalent to 'NOT' operator
SELECT e.city, e.country 
FROM hr.employees e
INTERSECT --Equavalent to 'AND' operator
SELECT c.city, c.country 
FROM sales.customers c;
