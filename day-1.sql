-- Hello World SQL Query, SELECT ALL records from the actor table
SELECT *
FROM actor;

-- Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that equals Nick using the LIKE and WHERE clauses
-- LIKE clause is more powerful, more verbosity
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_names that start with a the letter N using the LIKE and WHERE clauses
-- using the Wildcard symbol (%)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'N%';

-- Query for all first_names that start with K and have 2 letters after the K using LIKE/WHERE clauses
-- using the underscore symbol (_)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_names that start with K and have 2 letters after the K using LIKE/WHERE clauses
-- combine wildcard and underscore
-- The underscore defines a minimum length for the text
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';

-- Comparing operators in SQL:
-- Greater Than (>) -- Less Than (<)
-- Greater OR Equal ( >= ) -- Less than OR Equal ( <= )
-- Not Equal ( <> )


-- Explore the data with a SELECT ALL Query
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount that was GREATER than 2 dollars
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS than 7.99 dollars
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS THAN OR EQUAL TO 7.99 dollars
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customers who paid
-- an amount GREATER THAN OR EQUAL TO 2.00 dollars
-- Doing so in Ascending order (lowest to highest) using the ORDER BY clause
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid
-- an amount NOT EQUAL TO 0.00 dollars
-- Order the results in DESCENDING ORDER
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- Boolean operators in SQL
-- BETWEEN
-- AND

-- Query for data that shows customers who paid
-- an amount BETWEEN 2.00 and 7.99 dollars
-- using the BETWEEN with the AND Clause -- attached to the WHERE Clause 
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99
ORDER BY amount DESC;

-- SQL Aggregations ==> SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display sum of amounts paid that are greater than 5.99 dollars

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the average of amounts paid that are greater than 5.99 dollars;
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts paid that are greater than 5.99 dollars;
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the DISTINCT count of amounts paid that are greater than 5.99 dollars;
SELECT DISTINCT amount
FROM payment
WHERE amount > 5.99;

-- Query to display the lowest amount that is greater than $7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display the highest amount that is greater than $7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Using the GROUP BY Clause
-- Query to display all amount above 7.99 (To display what the Group By Clause does)
SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display the count of the amount equal to $7.99
-- WHILE ALSO displaying the actual amount as well
-- Using the GROUP BY clause to produce the count
SELECT amount, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY amount;

-- Query to display customer_ids with the summed amounts for each customer
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display summed amounts for each customer_id
-- The result given will show similar values from the previous example
SELECT customer_id, amount
FROM payment
GROUP BY customer_id, amount
ORDER BY customer_id DESC;

-- SQL HAVING CLAUSE

-- Query to display customer_ids that show up more than 5 times (if available)
-- Groub By the customer's email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j%.e%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

SELECT email
FROM customer;