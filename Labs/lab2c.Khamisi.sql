.echo on
.headers on
.mode column

--Name: Samer Khamisi
--File: lab2c.Khamisi.sql
--Date: 25 January, 2021

--1. List the employee IDs with the number of sales by each employee from most sales to least. I want to
--recognize the employees with the most sales.

SELECT employeeID, COUNT(orderID) FROM orders GROUP BY employeeID ORDER BY COUNT(orderID) DESC;

--2. I want to look at the average discounts taken by all customers for products that cost more than $50.00.
--Specfically, I want to know the average discount of all orders for each product from the highest price
--to the lowest price.

SELECT productID, unitPrice, PRINTF("%.2f", AVG(discount)) AS Average_Discount 
FROM order_Details WHERE unitPrice > 50.00 GROUP BY productID ORDER BY unitPrice DESC;

--3. I am doing an analysis of which shippers ship to each country, and I need a report showing the number
--of orders each shipper delivered to each country and the number of orders. I don't need the data where
--the number of orders is ten or less, but I need the report listed by country and the number of orders
--shipped to that country.

SELECT shipCountry, COUNT(orderID) AS Total_Orders, shipperID 
FROM orders GROUP BY shipperID, shipCountry HAVING COUNT(orderID > 10) ORDER BY shipCountry, COUNT(orderID) DESC;

--4. For each order, what was the time lag between the order date and the ship date?

SELECT orderID, orderDate, shippedDate, julianday(shippedDate) - julianday(orderDate) AS Lag 
FROM orders WHERE shippedDate NOT LIKE 'NULL' ORDER BY Lag DESC;

--5. Continuing with the previous query, I need the average time lag for each shipper.

SELECT shipperID, AVG(julianday(shippedDate) - julianday(orderDate)) AS Lag 
FROM orders GROUP BY shipperID ORDER BY lag;

--6. I am doing inventory, and I need to know the total price of each product on hand, that is, the price of
--each product line, sorted alphabetically by product name.

SELECT productID, productName, unitsinStock, unitPrice, unitsinStock * unitprice AS total 
FROM products WHERE unitsinStock >0 ORDER BY productName ASC;

--7. What is the dollar total we have tied up in inventory?

SELECT SUM(unitsinStock * unitPrice) AS Total FROM products; 

--9. How many days were in the service (if you are a veteran), or how many days will you serve (assuming
--you know your ETS date)?

SELECT JULIANDAY('2021-05-08') - JULIANDAY('2017-05-08') AS DaysinService;



