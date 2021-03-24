.headers on
.echo on
.mode column

--Name: Samer Khamisi
--File: SQL.EXR2.Khamisi
--Date: January 20, 2021

--1. List the company name, the contact name and the country of all customers in Poland.

SELECT customerID, companyName, contactName, country FROM customers WHERE country = 'Poland';

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.

SELECT orderID, orderDate, shipCity FROM orders WHERE shipCity = 'Berlin';

--3. How many boxes of Filo Mix do we have in stock?

SELECT productName, unitsinStock FROM products WHERE productName = 'Filo Mix' AND unitsinstock >= 0;

--4. List the telephone numbers of all of our shippers.

SELECT shipperID, companyName, phone FROM shippers;

--5. Who is our oldest employee? Who is our youngest employee?


SELECT employeeID, firstName, lastName, birthDate FROM employees WHERE birthDate = (SELECT MAX(birthDate) FROM employees) OR birthDate = (SELECT MIN(birthDate) FROM employees);


--6. List the suppliers where the owner of the supplier is also the sales contact.

SELECT supplierID, contactName, contactTitle FROM suppliers WHERE contactTitle = 'Owner';

--7. Mailing Labels 
--From the Northwind database we used in class and SQLite, create mailing labels for 
--customer representatives. Each label should consist of six, and exactly six, lines. The mailing labels 
--should be suitable for printing on sticky label paper, specifically Avery 8160 labels.

SELECT contacttitle|| ' ' ||contactname|| '
' ||companyname|| '
' ||city|| ' ' ||address|| ' ' ||postalcode|| ' ' ||country|| '
' ||'	'||'
' ||'	'||' ' FROM customers;

--8. Telephone Book
--From the Northwind database we used in class and SQLite, create a telephone book for customer representatives. 
--Each line in the telehone book should consist of the representative last name, representative
--first name, company name, and telephone number. Each row should look like this.


SELECT substr(contactName, instr(contactName, ' ')+1) ||', '|| substr(contactName, 1, instr(ContactName,' '))||'   '|| companyName ||'   '|| phone FROM customers;

