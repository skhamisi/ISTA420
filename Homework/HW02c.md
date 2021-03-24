#### Name: Samer Khamisi

## T-SQL HW2c

**1. List the date/time types in T-SQL.**

* DATETIME - YYYMMDD hh:mm:ss.nnn - 8 bytes
* SMALLDATETIME - YYMMDD hh:mm - 4 bytes
* DATE - YYYY-MM-DD - 3 bytes
* TIME - hh:mm:ss.nnnnnnn - 3-5 bytes
* DATETIME2 - YYYY-MM-DD hh:mm:ss.nnnnnnn - 5-8 bytes
* DATETIMEOFFSET - YYYY-MM-DD hh:mm:ss.nnnnnnn[+|-] - 8-10 bytes
	
**2. How do you express a date/time literal in T-SQL?**

* Use character strings to express date and time values

**3. What is the setting DATEFORMAT used for?**

* Determines how SQL Server interprets the literals you enter when they are converted from a character-string 
type to a date and time type

**4. Write a T-SQL snippet changing the date format to German. Read the documentation on how to do
this.**

* SET LANGUAGE German;
* SELECT CAST('01/23/2021' AS DATE);

**5. What is the difference between CAST(), CONVERT(), and PARSE()?**

* They all convert the input value to a specified datatype, however CAST is standard, unless you need to use the style 
number or culture.

**6. What function returns the current date? This is very useful in a table that maintains a log of events,
such as user logins.**

* SELECT CURRENT_TIMESTAMP AS [CURRENT_TIMESTAMPT];

**7. How do you add one day to the current date? Add one week? Add one month? Add one year?**

* SELECT DATEADD(day, 1, '20210124');
* SELECT DATEADD(week, 1, '20210124');
* SELECT DATEADD(month, 1, '20210124');
* SELECT DATEADD(year, 1, '20210124');

**8. Write a SQL snippet to return the number of years between your birth date and today's date.**

* SELECT DATEDIFF(day, '19900926', '20210124');

**9. How do you check a string literal to see if it represents a valid date?**

* Use the ISDATE function. Returns a '1' if the input is convertible to a date and '0' if it is not.

**10. What does EOMONTH() do? Give an example of why this might be very useful.**

* The EOMONTH function accepts an input date and time value and returns the respective end-of-
month date as a DATE typed value. The function also supports an optional second argument indicating
how many months to add (or subtract, if negative). 
* Useful if trying to calculate deadlines or due dates. 

**11. Payments are due exactly 30 days from the date of the last function. Write a select query that calculates
the date of the next payment. Pretend we want to update a column in a database that contains the
date of the next payment. We will do this when we write UPDATE queries.**

* SELECT EOMONTH( SYSDATETIME()), payment FROM rent;

**12. Suppose your son or daughter wants to run a query every day that tells them the number of days until
their 16th birthday. Write a select query that does this.**

* SELECT DATEDIFF( day, SYSDATETIME(), '20370124;);