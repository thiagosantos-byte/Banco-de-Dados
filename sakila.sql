SELECT * FROM customer;

SELECT first_name, last_name FROM customer;

SELECT * FROM film
WHERE length > 120;

SELECT * FROM film
WHERE release_year = 2006;

SELECT * FROM customer
WHERE active = 1;

SELECT r.rental_id, c.first_name, c.last_name
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id;

SELECT p.payment_id, c.first_name, c.last_name, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, f.title
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

SELECT s.staff_id, s.first_name, s.last_name, st.store_id
FROM staff s
JOIN store st ON s.store_id = st.store_id;

SELECT f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

SELECT COUNT(*) AS total_clientes FROM customer;

SELECT SUM(amount) AS total_pagamentos FROM payment;

SELECT AVG(amount) AS media_pagamentos FROM payment;

SELECT c.name, COUNT(f.film_id) AS total_filmes
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_alugueis
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_alugueis DESC
LIMIT 1;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_gasto
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_gasto
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_gasto DESC
LIMIT 5;

SELECT f.title, COUNT(r.rental_id) AS total_alugueis
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY total_alugueis DESC;

SELECT c.name,
       COUNT(DISTINCT f.film_id) AS total_filmes,
       COUNT(r.rental_id) AS total_alugueis
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

SELECT c.first_name, c.last_name,
       f.title,
       cat.name AS category,
       p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id;

SELECT c.first_name, c.last_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;

SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

SELECT c.first_name, c.last_name,
       COUNT(r.rental_id) AS total_alugueis,
       SUM(p.amount) AS total_gasto,
       AVG(p.amount) AS ticket_medio
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

SELECT DATE(rental_date) AS dia, COUNT(*) AS total_alugueis
FROM rental
GROUP BY dia
ORDER BY total_alugueis DESC
LIMIT 1;

SELECT c.first_name, c.last_name,
       COUNT(r.rental_id) AS total_alugueis,
       cat.name AS categoria_favorita
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY c.customer_id, cat.name
HAVING COUNT(r.rental_id) = (
    SELECT MAX(total)
    FROM (
        SELECT COUNT(*) AS total
        FROM rental r2
        JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
        JOIN film_category fc2 ON i2.film_id = fc2.film_id
        WHERE r2.customer_id = c.customer_id
        GROUP BY fc2.category_id
    ) sub
);
