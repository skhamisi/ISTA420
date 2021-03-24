.echo on
.headers on
.mode csv

--Name: Samer Khamisi
--File: SQL.EXR3.Khamisi.sql
--Date: January 27, 2021

--1. We have noticed that certain customers prefer to make their orders with certain employees. We want
--to increase business by encouraging the customer/employee pairs that are more productive, and to
--channel the pairs that are less productive into other relationships. To this end, we have ordered this
--query and the following three. First, I need the customer ID, the customer contact name, the employee
--ID, the employee name, the order ID, the number of orders, and the total amount of each order, where
--the customer/employee pair has produced five or more orders between them, ordered by the dollar
--amount of the order from highest to lowest. The output needs to be in a comma separated format
--with strings that include spaces and commas delimited by double quotes. The dollar amount should
--be formatted as a decimal number with two decimal places.

SELECT o.customerID, c.contactName, o.employeeID, e.firstName||' '||e.lastName AS emp_name, o.orderID, count(o.orderID) AS num_orders, printf("%.2f",SUM(od.quantity * od.unitPrice)) AS order_total
FROM orders o 
JOIN customers c ON o.customerID = c.customerID 
JOIN employees e ON o.employeeID = e.employeeID 
JOIN order_details od ON o.orderID = od.orderID 
GROUP BY o.customerID, o.employeeID, o.orderID HAVING COUNT(od.orderID) > 4 ORDER BY order_total DESC;

--2. Second, I want the least productive pairs with the same columns. The total of orders should be less
--than three, the dollar amount of the order is less than $50.00, and the orders are ranked by increasing
--dollar amounts, starting with the least order. Here is the expected output.

SELECT o.customerID, c.contactName, o.employeeID, e.firstName||' '||e.lastName AS emp_name, o.orderID, count(o.orderID) AS num_orders, SUM(od.quantity * od.unitPrice) AS order_total
FROM orders o 
JOIN customers c ON o.customerID = c.customerID 
JOIN employees e ON o.employeeID = e.employeeID 
JOIN order_details od ON o.orderID = od.orderID 
GROUP BY o.customerID, o.employeeID, o.orderID HAVING COUNT(od.orderID) < 3 AND order_total < 50 ORDER BY order_total;

--3. Third, I need the most productive pairs as in the first report above, omitting the order ID but ranked
--by the average amount from highest to lowest of all orders by the customer/employee pair. Include
--only pairs where the amount of the average exceeds $2,500.00. Here is the expected output.

SELECT o.customerID, c.contactName, o.employeeID, e.firstName||' '||e.lastName AS emp_name, count(o.orderID) AS num_orders, AVG(od.quantity * od.unitPrice) AS order_average
FROM orders o 
JOIN customers c ON o.customerID = c.customerID 
JOIN employees e ON o.employeeID = e.employeeID 
JOIN order_details od ON o.orderID = od.orderID 
GROUP BY o.customerID, o.employeeID, o.orderID HAVING AVG(od.quantity * od.unitPrice) > 2500 ORDER BY order_average DESC;

--4. Finally, I need the least productive pairs as ranked by average order amount, from lowest to highest,
--formatted as above. Omit the order ID. Include only pairs where the average order amount is less than
--$50.00. Here is the expected output.

SELECT o.customerID, c.contactName, o.employeeID, e.firstName||' '||e.lastName AS emp_name, count(o.orderID) AS num_orders, AVG(od.quantity * od.unitPrice) AS order_average
FROM orders o 
JOIN customers c ON o.customerID = c.customerID 
JOIN employees e ON o.employeeID = e.employeeID 
JOIN order_details od ON o.orderID = od.orderID 
GROUP BY o.orderID HAVING order_average < 50 ORDER BY order_average ASC;

--5. Please create a report with the order ID, the customer ID, the customer name, the customer country,
--and the dollar amount of the order, sorted alphabetically by country and numerically from highest to
--owest by the dollar amount of the order, where the order total exceeds $5,000.00. Here is the output.

SELECT o.orderID, o.customerID, c.companyName, c.country, SUM(od.quantity * od.unitPrice) AS order_total
FROM orders o
JOIN customers c ON o.customerID = c.customerID
JOIN order_details od ON o.orderID = od.orderID
GROUP BY o.orderID HAVING order_total > 5000 ORDER BY country, order_total DESC;

--I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
--and employees, (b) where we have customers but no employees AND both customers and employees,
--and (c) where we have employees but no customers AND both customers and employees. Write three
--queries, using inner and outer joins. Report the results of the queries. There is no need for any further
--reporting.
.headers on
.mode column

SELECT DISTINCT c.city, c.region, c.postalCode 
FROM customers c
JOIN employees e ON c.city = e.city ORDER BY c.city;

SELECT DISTINCT c.city, c.region, c.postalCode 
FROM customers c
LEFT JOIN employees e ON c.city = e.city ORDER BY c.city;

SELECT DISTINCT e.city, e.region, e.postalCode 
FROM employees e
LEFT JOIN customers c ON e.city = c.city ORDER BY e.city;
