-- SELECT * from actor
-- SELECT first_name from actor LIMIT 5
-- SELECT * from actor WHERE first_name='NICK';
-- SELECT * from actor WHERE first_name IN ('NICK', 'JOE', 'DAN')
-- SELECT * from actor WHERE first_name LIKE 'N%';

-- SELECT first_name, last_name, film_id from actor
-- INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id LIMIT 5

-- SELECT first_name, last_name, film_id from actor
-- LEFT OUTER JOIN film_actor ON actor.actor_id = film_actor.actor_id 

-- SELECT first_name, last_name, film_id from actor
-- LEFT OUTER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
-- ORDER BY film_id

-- SELECT COUNT(first_name) from actor
-- LEFT OUTER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
-- WHERE first_name LIKE 'N%'
-- ORDER BY film_id

-- SELECT COUNT(first_name), last_name from actor
-- GROUP BY last_name


-- SELECT queries

-- Display the first and last names of all actors from the table actor
-- SELECT first_name, last_name from actor

-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name
-- SELECT (first_name  || " " || last_name) as Actor_Name from actor

-- WHERE
-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
-- SELECT actor_id, first_name, last_name FROM actor WHERE first_name='JOE';

-- Find all actors whose last name contain the letters GEN
-- SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%GEN%';

-- Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order
-- SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%LI%'
-- ORDER BY last_name, first_name

-- Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China

-- SELECT country_id , country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China')


-- ALTER TABLE
-- You want to keep a description of each actor. You don't think you will be performing queries on a description, so create a column in the table actor named description and use the data type BLOB (Make sure to research the type BLOB, as the difference between it and VARCHAR are significant)

-- ALTER TABLE actor ADD COLUMN description TEXT;

-- Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column
-- ALTER TABLE actor DROP COLUMN description

-- GROUP BY, HAVING, UPDATE

-- List the last names of actors, as well as how many actors have that last name
-- SELECT COUNT(last_name), last_name from actor
-- GROUP BY last_name


-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
-- SELECT COUNT(last_name), last_name from actor
-- GROUP BY last_name
-- HAVING COUNT(last_name) >=2;

-- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record

-- SELECT actor_id from actor
-- WHERE first_name='GROUCHO' AND last_name='WILLIAMS'; find out the required actor id first

-- UPDATE actor
-- SET first_name='HARPO'
-- WHERE actor_id=172

-- Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO
-- UPDATE actor
-- SET first_name='GROUCHO'
-- WHERE actor_id=172


-- JOIN

-- Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address

-- SELECT first_name, last_name, address from address
-- INNER JOIN staff ON address.address_id = staff.address_id 

-- Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment
-- SELECT first_name, last_name, SUM(amount) from staff
-- INNER JOIN payment ON payment.staff_id = staff.staff_id 
-- WHERE  strftime('%m', payment_date) = '08' AND strftime('%Y', payment_date) = '2005'
-- GROUP BY staff.staff_id

-- List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join
-- SELECT COUNT(actor_id), title from film
-- INNER JOIN film_actor on film.film_id= film_actor.film_id
-- GROUP BY title

-- How many copies of the film Hunchback Impossible exist in the inventory system?
-- SELECT COUNT(inventory_id), title from film
-- INNER JOIN inventory on film.film_id=inventory.film_id
-- WHERE title='HUNCHBACK IMPOSSIBLE'
-- GROUP BY title

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name

-- SELECT last_name, SUM(amount) from customer
-- INNER JOIN payment  on customer.customer_id=payment.customer_id 
-- GROUP BY payment.customer_id
-- ORDER BY last_name


-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity.
--  Use subqueries to display the titles of movies starting with the letters K and Q whose language is English
-- SELECT language_id from language
-- WHERE name='English'

-- SELECT title from film 
-- WHERE title LIKE 'K%' OR title LIKE 'Q%' 
-- AND language_id= 
-- (SELECT language_id from language
-- WHERE name='English');

-- -- Use subqueries to display all actors who appear in the film Alone Trip

-- SELECT first_name, last_name from actor
-- WHERE actor_id IN
-- (
-- SELECT actor_id from film_actor
-- WHERE film_id= 
-- (SELECT film_id from film
-- where title = 'ALONE TRIP'));

-- You want to run an email marketing campaign in Canada, for which you will need the names
-- and email addresses of all Canadian customers.
-- Use joins to retrieve this information

-- SELECT first_name, last_name, email, country from customer
-- INNER JOIN address on customer.address_id=address.address_id
-- INNER JOIN city on address.city_id=city.city_id
-- INNER JOIN country on city.country_id=country.country_id
-- WHERE country.country_id=
-- (SELECT country.country_id from country
-- WHERE country='Canada');
