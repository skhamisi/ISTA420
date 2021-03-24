#### Name: Samer Khamisi

## T-SQL HW2b

**1. What is a *data type*? Why do we have *data types*?**

* The data type is a guideline for SQL to understand what type of data is expected inside of each column, 
and it also identifies how SQL will interact with the stored data. 

**2. What is a *collation?* Name four elements of a collation.**

* Collation is a property of character data that encapsulates several aspects: language support, sort 
order, case sensitivity, accent sensitivity, and more. Collation can be defined at four different levels: 
instance, database, column, and expression.

**3. How would you strip whitespace from a string? For example, suppose you had "---Dave---" but wanted only "Dave".**

* Use the RTRIM and LTRIM functions. TRIM('---Dave---'));

**4. Suppose you wanted to make a list of every college and university that was called an Institute from the college table. Write the query.**

* Select * from college where collegeName LIKE '%Institute%';

**5. How would you find the number of the index of the first space in a string? For example, the index of
the first space in "Barack Hussein Obama" would be 7.**

* Use the CHARINDEX function. CHARINDEX(substring, string); SELECT CHARINDEX(' ', 'Barack Hussein-Obama');

**6. How would you select just the first name in a list of the presidents. Each record looks like the: "George
Washington", "John Adams", "Thomas Jefferson". First names can be an arbitrary length, from "Cal"
to "Benjamin." (e.g., Cal College, Benjamin Harrison)**

* SUBSTRING(string, start, length);       
* SUBSTRING(Barack Hussein Obama, 1, 7);


**7. What is the order of precedence for the logical operators?**

* 1. Parentheses
* 2. (*Multiplication, /Division, %Modulus)
* 3. +(Positive), -(Negative), +(Addition), +(Concatenation), -(Subtraction)
* 4. =, >, <, >=, <=, <>, !=, !>, !< (Comparison operators)
* 5. NOT
* 6. AND
* 7. BETWEEN, IN, LIKE, OR
* 8. = (Assignment)

**8. What is the order of precedence for the math operators?**

* Parentheses can be used to force precedence otherwise:
* 1. (*Multiplication, /Division, %Modulus)
* 2. +(Positive), -(Negative), +(Addition), +(Concatenation), -(Subtraction)

**9. What is the difference between a *simple* and a *searched* CASE expression?**

* The simple CASE form has a single test value or expression right after the CASE keyword that is 
compared with a list of possible values in the WHEN clauses.
	
* The searched CASE form is more flexible in the sense you can specify predicates in the WHEN clauses rather 
than being restricted to using equality comparisons.

**10. How would you turn a list of names like this: "LASTNAME, FIRSTNAME", to a list like this:
"FIRSTNAME LASTNAME"?**

* CONCAT(firstname + N' ' + lastname) AS fullname;

**11. How would you turn a list of names like this: "FIRSTNAME LASTNAME", to a list like this: "LAST-
NAME, FIRSTNAME"?**

* lastname + N',' + firstname AS fullname;