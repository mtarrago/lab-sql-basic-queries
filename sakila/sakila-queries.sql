-- Display all available tables in the Sakila database.alter
use sakila;
show tables;
-- Retrieve all the data from the tables actor, film and customer.
select * from actor,film,customer;

-- Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
select title from film;

-- 3.2 List of languages used in films, with the column aliased 
-- as language from the language table
select name as language from language; -- English, Italian, Japanese, Mandarin, French, German

-- 3.3 List of first names of all employees from the staff table

select first_name from staff; -- 2 names: Mike and John

-- Retrieve unique release years.
select distinct release_year from film; -- 2006

-- Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
select distinct store_id from store; -- 2

-- 5.2 Determine the number of employees that the company has.
select count(staff_id) from staff; -- 2

-- 5.3 Determine how many films are available for rent and how many have been rented.
select count(rental_id) as films_rented from rental;
select count(*) as films_available from film;

select distinct film_id from inventory; -- 958 
select distinct rental_id from rental where rental_date is not null;
select distinct rental_id from rental where fk_rental_inventory is null;

-- 5.4 Determine the number of distinct last names of the actors in the database.
select distinct last_name from actor; -- 58 rows
-- Retrieve the 10 longest films.
select title, length
from film
order by length desc
limit 10;

-- 7.1 Retrieve all actors with the first name "SCARLETT".
select * from actor where first_name = 'Scarlett';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
select * from film where title like '%ARMAGEDDON%' AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content -- 70 rows
select title, count(*) from film where special_features like 'Behind the Scenes'
group by title; 