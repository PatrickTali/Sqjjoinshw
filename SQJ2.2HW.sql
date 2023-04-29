1. List all customers who live in Texas (use
JOINs)
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE city = 'Texas';


2. Get all payments above $6.99 with the Customers full name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

3. Show all customers names who have made payments over $175(use
subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id in (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

4. List all customers that live in Nepal (use the city
table)
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

5. Which staff member had the most
transactions?
SELECT first_name, last_name
FROM staff
GROUP BY  staff_id;

6. How many movies of each rating are
there?
SELECT title , rating
FROM film;

7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id in (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 6.99
);



8. How many free rentals did our store give away?
SELECT rental_id
FROM rental
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE amount < 0;