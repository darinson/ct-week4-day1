-- Question 1: How many actors are there with the last name ‘Wahlberg’?
-- 2
SELECT *
FROM actor
WHERE last_name = 'Wahlberg';

-- Question 2: How many payments were made between $3.99 and $5.99?
-- 5607
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;

-- Extra: Break down count of payments by amount. The sum of the counts = 5607
SELECT amount, COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99
GROUP BY amount;

-- Question 3: What film does the store have the most of? (search in inventory) 
-- for both stores?
SELECT store_id, film_id, COUNT(film_id)
FROM inventory
GROUP BY store_id, film_id
ORDER BY store_id ASC, COUNT(film_id) DESC;

-- Question 4: How many customers have the last name ‘William’?
-- 0
SELECT last_name, COUNT(last_name)
FROM customer
WHERE last_name = 'William'
GROUP BY last_name;

-- Question 5:  What store employee (get the id) sold the most rentals?
-- staff_id = 1 sold the most rentals (8040 rentals)
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id;

-- Question 6:  How many different district names are there?
-- 378 different district names are present
SELECT DISTINCT(DISTRICT)
FROM address
GROUP BY (DISTRICT);

-- Question 7: What film has the most actors in it? (use film_actor table and get film_id) 
-- film_id = 508 has the most actors (15)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- Question 8: From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13 customers
SELECT COUNT(last_name) as Num_Customer_LastName_ES
FROM customer
WHERE store_id = 1 and last_name LIKE '%es';

-- Question 9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 
-- Three payment amounts (2.99, 4.99 and 0.99) had number of rentals above 250
SELECT COUNT(rental_id) as Num_Rentals, amount
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
ORDER BY COUNT(rental_id) DESC;

-- Question 10: Within the film table, how many rating categories are there? And what rating has the most  movies total?
-- There are 5 rating categories, and PG-13 has the most movies.
SELECT rating, COUNT(title) as Num_Movies
FROM film
GROUP BY rating
ORDER BY Num_Movies DESC;