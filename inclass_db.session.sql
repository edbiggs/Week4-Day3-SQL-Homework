-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT customer.first_name,customer.last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
GROUP BY customer.first_name,customer.last_name,amount

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT customer.customer_id, customer.first_name,customer.last_name,payment.amount
FROM customer,payment
WHERE customer.customer_id = payment.customer_id AND payment.amount > 175

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT *
FROM address,customer,city
WHERE city.city_id = (SELECT city_id
    FROM city
    WHERE city = 'Nepal'
);

-- 5. Which staff member had the most
-- transactions?

SELECT staff.staff_id, staff.first_name, staff.last_name, payment.staff_id,count(payment.payment_id)
FROM staff, payment
WHERE staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name, payment.staff_id


-- 6. How many movies of each rating are
-- there?

SELECT DISTINCT rating, COUNT(film_id)
FROM film
GROUP BY rating

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)


SELECT DISTINCT customer.customer_id, amount
FROM customer, (
    SELECT *
    FROM payment
    WHERE amount > 6.99) AS ballers

-- How many free rentals did our stores give away?

SELECT rental_id,amount
FROM payment
WHERE amount <= 0





