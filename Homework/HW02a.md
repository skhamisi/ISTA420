#### Name: Samer Khamisi

## T-SQL HW2a

**1. List the order of execution of a SQL query.**

* From, Where, Group By, Having, Select, Order By

**2. What does the *from* clause do?**

* Gets all the rows from the table you specify

**3. What does the *where* clause do?**

* In the WHERE clause, you specify a predicate or logical expression to filter the rows returned by the 
FROM phase. 

**4. what does the *group by* clause do?**

* You can use the GROUP BY phase to arrange the rows returned by the previous logical query processing phase 
in groups.

**5. What does the *having* clause do?**

* The HAVING clause is a group filter. Only groups for which the HAVING predicate evaluates to TRUE are returned by 
the HAVING phase to the next logical query processing phase.

**6. What does the *select* clause do?**

* The SELECT clause is where you specify the attributes (columns) you want to return in the result table of 
the query.

**7. What does the *distinct* keyword do?**

* The means to remove duplicates

**8. What does the *order by* clause do?**

* You use the ORDER BY clause to sort the rows in the output for presentation purposes.

**9. What does the *limit* clause do?**

* The LIMIT clause is used to set an upper limit on the number of tuples returned by SQL.
* Not supported by all versions of SQL.

**10. What does the *top* clause do?**

* The TOP filter is a proprietary T-SQL feature you can use to limit the number or percentage of rows your 
query returns.

**11. What do the *offset*...*fetch*...clauses do?**

* The OFFSET-FETCH filter is considered an extension to the ORDER BY clause. With the OFFSET clause you indicate 
how many rows to skip, and with the FETCH clause you indicate how many rows to filter after the skipped rows.