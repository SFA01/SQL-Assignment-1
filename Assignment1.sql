USE AdventureWorks;

/*Question 1 -We want the AddressID, AddressLine1,
AddressLine2, and City of the persons who
live in Los Angeles without any null values
in their AddressLine2.
How many are they? Do not use (Count)
function. Just seeing it in the report
section (text) is enough.
(3 rows affected)*/
SELECT * FROM Person.Address;
SELECT AddressID, AddressLine1,
AddressLine2,City FROM Person.Address WHERE City = 'Los Angeles' AND AddressLine2 IS NOT NULL;

/* Question 2 We want the AddressID, AddressLine1,
AddressLine2, and City of the persons
without any null values in their
AddressLine2 who are living in Los Angeles
or Toronto.
(4 rows affected) */

SELECT AddressID, AddressLine1,
AddressLine2,City FROM Person.Address WHERE City = 'Los Angeles' AND AddressLine2 IS NOT NULL
OR City = 'Toronto' AND AddressLine2 IS NOT NULL;


/* Question 3  We want the AddressID, AddressLine1,
AddressLine2, and City of the persons
without any null values in their
AddressLine2 who are living in Los Angeles,
Toronto, or Downey.
(7 rows affected) */

SELECT AddressID, AddressLine1,
AddressLine2,City FROM Person.Address WHERE City = 'Los Angeles' AND AddressLine2 IS NOT NULL
OR City = 'Toronto' AND AddressLine2 IS NOT NULL
OR City ='Downey' AND AddressLine2 IS NOT NULL;

/* Question 4 A) We need all information in
ProductCostHistory with the StandardCost
between 100 and 120 sorted by the
ModifiedDate.
B) Write the second query, and show all
standardcosts more than 2000.
Submit two separate queries. */


SELECT * FROM Production.ProductCostHistory WHERE StandardCost <= 120 AND StandardCost >= 100 ORDER BY ModifiedDate ASC;

SELECT * FROM Production.ProductCostHistory WHERE StandardCost > 2000;

/* Question 5
Write a T-SQL command to show 10 first
BusinessEntityID, FirstName, LastName, and
ModifiedDate of the persons with lastnames
ending with ‘ll’ and starting with ‘Ru’ and
firstname starting with ‘B’.
Try to use the shortest query possible.

*/
SELECT TOP 10 BusinessEntityID, FirstName, LastName, ModifiedDate FROM [Person].[Person]
WHERE LastName LIKE 'Ru%' AND LastName LIKE '%ll' AND FirstName LIKE 'B%';


/* Question 6 We are looking for an exact address in the
person.address table but we don't remember
the exact information to find it. We know
that the person we are looking for, lives
in 'Montreal', and also we know that there
was a ‘9’ and ‘7’ in the first part of
their address.
Write a query to show all the possible rows
in the tale and also include their
addressID.
Tip: Your result must have less than 10
rows.*/

SELECT AddressID, AddressLine1, AddressLine2, City 
FROM Person.Address 
WHERE City = 'Montreal' AND AddressLine1 LIKE '%7%' AND AddressLine1 LIKE '%9%';


/* Question 7 
Write a T-SQL command to show 10 first
BusinessEntityID, FirstName, LastName,
ModifiedDate, Today’s date As ‘Today’, and
Total days past from the modified date till
current date (change the column name to
‘Days Past’) of the persons with lastnames
ending with ‘ll’ and Firstname with exactly
three characters.
*You must use scalar functions such as
Getdate() and Cast().
Try to use the shortest query possible. */ 

SELECT TOP 10 BusinessEntityID, FirstName, LastName, ModifiedDate, Today = (GetDate()), DaysPast = DATEDIFF(day, ModifiedDate, GetDate())
FROM [person].[person] WHERE LastName LIKE '%ll' AND LEN(FirstName) = 3;