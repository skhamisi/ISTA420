.echo on
.headers on
.mode column

--Name: Samer Khamisi
--File:lab3.Khamisi.sql
--Date: January 26, 2021

--1. What is the order number and the date of each order sold by each employee?

SELECT e.employeeID, e.titleofCourtesy, e.firstName, e.lastName, o.orderID, o.orderDate 
FROM employees e INNER JOIN orders o ON e.employeeID = o.employeeID;

--2. List each territory by region.

SELECT t.territoryID, t.territoryDescription, r.regionID, r.regionDescription FROM territories t 
INNER JOIN region r ON t.regionID = r.regionID ORDER BY r.regiondescription, t.territoryDescription;

--3. What is the supplier name for each product alphabetically by supplier?

SELECT p.productID, p.productName , s.supplierID, s.companyname FROM products p 
INNER JOIN suppliers s ON s.supplierID = p.supplierID ORDER BY s.companyName;

--4. For every order on May 5, 1998, how many of each item was ordered, and what was the price of the
--item?

SELECT o.orderDate, p.productName, od.quantity, p.unitPrice FROM orders o 
JOIN order_details od ON o.orderID = od.orderID 
JOIN products p ON od.productID = p.productID WHERE o.orderDate = '1998-05-05';

--5. For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and
--what was the price of the item?



--6. For every order in May, 1998, what was the customer’s name and the shipper’s name?

SELECT o.orderID, o.orderDate, o.customerID, c.customerID, o.shipperID, c.companyName, o.shipperID, s.shipperID, s.companyName 
FROM orders o JOIN customers c ON o.customerID = c.customerID JOIN shippers s ON o.shipperId = s.shipperID WHERE o.orderDate LIKE '1998-05-%';

--7. What is the customer’s name and the employee’s name for every order shipped to France?



--8. List the products by name that were shipped to Germany.


