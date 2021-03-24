#### Name: Samer Khamisi

## T-SQL HW8a

**1. When using INSERT, is the list of columns necessary? Why or why not?**

* No, because if you don't, SQL will use the default null.

**2. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do
you not use a subquery?**

* Yes, select info from one table and inserts it into anther table

**3. What is the operand for the INSERT EXEC statement?**

* Exec (short for execute) - very common

**4. How would you use the INSERT INTO statement?**

* You would Insert into (parameters) or if you have a default value defined you can use that, 
or the default NULL

**5. What are the parameters to the BULK INSERT statement?**

* You specify the target table, the source file, and options
* dateafiletype, fieldterminator (separates the columns), rowterminator (what the rows end with)

**6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?**

* No, you have to define a primary key or unique constraint

**7. How do you create a SEQUENCE object?**

* You use the create sequence command

**8. How do you use a SEQUENCE object?**

* By creating one, the name is required but you can specify the data type

**9. How do you alter a SEQUENCE object?**

* By using the Alter table <table_name>

**10. What is the difference between DELETE and TRUNCATE?**

* Delete has two clauses (from, where) and is fully logged (will be slower)
* Truncate has no filters and is minimally logged (will be faster)

**11. What is the difference between DELETE and DROP TABLE?**

* Delete deletes the data and Drop Table deletes the data and schema