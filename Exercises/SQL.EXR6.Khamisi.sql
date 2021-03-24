--Name: Samer Khamisi
--File: SQL.EXR6.Khamisi.sql
--Date: February 17, 2021

CREATE DATABASE classicCars;

USE classicCars; 

DROP TABLE IF EXISTS customers; 

CREATE TABLE Customers (
	custid int NOT NULL PRIMARY KEY,
	companyName varchar(50),
	lastName varchar(35),
	firstName varchar(35),
	phone varchar(20),
	addressLine1 varchar(50),
	addressLine2 varchar(50),
	city varchar(50),
	state_ varchar(30),
	postalCode varchar(20),
	country varchar(20),
	salesRepid varchar(50),
	creditLimit float(30) 
);

BULK INSERT customers FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\Customers.csv'
WITH 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM customers;

-----------------------------------------------
-----------------------------------------------

USE classicCars; 

DROP TABLE IF EXISTS employees; 

CREATE TABLE employees (
	empid int NOT NULL PRIMARY KEY,
	lastName varchar(25),
	firstName varchar(25),
	extenstion varchar(10),
	email varchar(50),
	officeCode int,
	reportsTo varchar(20),
	jobTitle varchar (45)

);

BULK INSERT employees FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\Employees.csv'
WITH 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);


SELECT * FROM employees;

-----------------------------------------------
-----------------------------------------------

USE classicCars; 

DROP TABLE IF EXISTS offices; 

CREATE TABLE offices (
	officeid int NOT NULL PRIMARY KEY,
	City varchar(25),
	Phone varchar(35),
	addressLine1 varchar(35),
	addressLine2 varchar(20),
	state_ varchar(15),
	country varchar(25),
	postalCode varchar(20),
	territory varchar(15)
);

BULK INSERT offices FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\Offices.csv'
WITH 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM Offices;
-----------------------------------------------
-----------------------------------------------
USE classicCars;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
	productid varchar(50) PRIMARY KEY,
	productName varchar(80),
	productLine varchar(30),
	productScale varchar(50),
	productVendor varchar(50),
	productDescription varchar(max),
	qtyInStock int, 
	buyPrice money, 
	MSRP money
);

BULK INSERT products FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\products.csv'
WITH 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);


SELECT * FROM products;
-----------------------------------------------
-----------------------------------------------
USE classicCars;

DROP TABLE IF EXISTS orderDetails;

CREATE TABLE OrderDetails (
	 orderid int,
	 productid varchar(50), 
	 qty int, 
	 price money, 
	 orderLineNumber int
	 constraint pk_orderdetails 
		primary key (orderid, productid),
	constraint fk_orderdetails_products
		foreign key (productid)
		references products (productid),
	constraint fk_orderdetails_orders
		foreign key (orderid)
		references orders (orderid)
); 

BULK INSERT orderDetails FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\OrderDetails.csv'
WITH 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM OrderDetails;

-----------------------------------------------
-----------------------------------------------
USE classicCars;

DROP TABLE IF EXISTS orders;

CREATE TABLE Orders (
	Orderid int NOT NULL PRIMARY KEY, 
	orderDate varchar(50), 
	requiredDate varchar(50), 
	shippedDate varchar(50), 
	orderStatus varchar(50),
	comments varchar(max), 
	custid int FOREIGN KEY REFERENCES customers(custid)
);

BULK INSERT orders FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\Orders.csv'
with 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM orders;
-----------------------------------------------
-----------------------------------------------
USE classicCars; 

DROP TABLE IF exists payments;

CREATE table Payments (
	custid int FOREIGN KEY REFERENCES customers(custid),
	checkNumber varchar(50) NOT NULL PRIMARY KEY,
	paymentDate datetime, 
	amount money
); 

BULK INSERT payments FROM 'C:\Users\Samer\MSSA2021\Database\SQL.EXR6\Payments.csv'
with 
(
	FORMAT = 'csv',
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM payments;

-----------------------------------------------
-----------------------------------------------
--Queries

--3. Perform the following queries:

--(a) How many distinct products does ClassicModels sell?

SELECT COUNT(DISTINCT productid) AS Distinct_Products FROM products;

--(b) Report the name and city of customers who don't have sales representatives.

SELECT custid, companyName, lastName, firstName FROM customers WHERE salesRepid LIKE 'NULL';

--(c) What are the names of executives with VP or Manager in their title? Use the CONCAT function
--to combine the employee's first name and last name into a single field for reporting.

SELECT empid, CONCAT(firstName,' ', lastName) AS employee, jobTitle FROM employees WHERE jobTitle LIKE '%VP%' OR jobTitle LIKE '%Manager%';

--(d) Which orders have a value greater than $5,000?

SELECT orderid, price FROM orderDetails WHERE price > 5000;

--(e) Report the account representative for each customer.

SELECT custid, companyName, firstName, lastName, salesRepid FROM customers;

--(f) Report total payments for Atelier graphique.

SELECT SUM(p.amount) AS total_Payments FROM customers c
JOIN
payments p ON c.custid = p.custid
WHERE companyName LIKE 'Atelier graphique';

--(g) Report the total payments by date

SELECT p.amount, paymentDate FROM customers c
JOIN
payments p ON c.custid = p.custid
WHERE companyName LIKE 'Atelier graphique';

--(h) Report the products that have not been sold.

SELECT p.productid FROM products p
LEFT OUTER JOIN
orderDetails od ON p.productid = od.productid
WHERE od.productid is NULL;

--(i) List the amount paid by each customer.

SELECT c.custid, c.companyName, SUM(p.amount) AS total_Payments FROM customers c
JOIN
payments p ON c.custid = p.custid
GROUP BY c.custid, c.companyName;

--(j) List products sold by order date.



--(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.



--(l) List the names of customers and their corresponding order number where a particular order from
--that customer has a value greater than $25,000?



--(m) Compute the commission for each sales representative, assuming the commission is 5% of the
--value of an order. Sort by employee last name and rst name.



--(n) What is the dierence in days between the most recent and oldest order date in the Orders le?



--(o) Compute the average time between order date and ship date for each customer ordered by the
--largest dierence.