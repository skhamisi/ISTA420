.echo on
.headers on
.mode column

--Name: Samer Khamisi
--File: lab2b.Khamisi.sql
--Date: January 20, 2021

--1. Who are our customers in North America?

SELECT customerID, companyName, country FROM customers WHERE country IN('USA', 'Mexico', 'Canada'); 

--2. What orders were placed in April, 1998?

SELECT orderID, orderDate FROM orders WHERE orderDate Like '1998-04-%';

--3. What sauces do we sell?

SELECT productID, productName FROM products WHERE productName LIKE '%sauce%';

--4. You sell some kind of dried fruit that I liked very much. What is its name?

SELECT productID, productName FROM products WHERE productName LIKE '%dried%';

--5. What employees ship products to Germany in December?

SELECT employeeID FROM orders WHERE orderDate LIKE '%-12-%' AND shipCountry LIKE 'Germany';

--6. We have an issue with product 19. I need to know the total amount and the net amount of all orders for product 19 where the customer took a discount.

SELECT orderID, productID, unitPrice * quantity AS totalAmount, (unitPrice * quantity) * (1 - discount) AS netAmount FROM order_details WHERE productID = 19 AND discount > 0;

--7. I need a list of employees by title, first name, and last name, with the employee’s position under their names, and a line separating each employee.



--8. I need a list of our customers and the first name only of the customer representative.



--9. Give me a list of our customer contacts alphabetically by last name.



--10. I need a report telling me the most common pairing of customers and employees with the greatest order volume (by the number of orders placed). Exclude pairings with minimal orders.



--11. I need a report listing the highest average selling product by product id. The average is determined by the total sales of each product id divided by the quantity of the product sold. Include only the highest 20 products.


