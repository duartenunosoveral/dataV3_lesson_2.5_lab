0. Instructions

use sakila

1. Select all the actors with the first name ‘Scarlett’.

select * from actor
where first_name = "Scarlett"

2. How many physical copies of movies are available for rent in the stores inventory? How many unique movie titles are available?

select count(inventory_id) as copies_available from inventory
select count(distinct film_id) as unique_titles_available from inventory

3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select max(length) as max_duration, min(length) as min_duration from film

4. What is the average movie duration expressed in format (hours, minutes)?

select CONCAT(FLOOR(AVG(length)/60), ' hours ', round(AVG(length)%60,0), ' minutes') as average_movie_duration from film

5. How many distinct (different) actors last names are there?

select count(distinct last_name) as unique_last_name from actor

6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

select datediff(max(rental_date), min(rental_date)) as operating_days from rental

7. Show rental info with additional columns month and weekday. Get 20 results.

select *, monthname(rental_date) as rental_month, monthname(return_date) as return_month, dayname(rental_date) as rental_weekday, dayname(return_date) as return_weekday from rental 
limit 

8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *,
			monthname(rental_date) as rental_month,
			monthname(return_date) as return_month,
			WEEKDAY(rental_date) as rental_weekday,
			WEEKDAY(return_date) as return_weekday,
       CASE
			WHEN WEEKDAY(rental_date) IN (1,7) THEN 'weekend'
			ELSE 'workday'
		END AS day_type_rental
from rental
limit 20;

9. Get release years.

select distinct release_year from film

10. Get all films with ARMAGEDDON in the title.

select * from film
where title like '%armageddon%';

11. Get all films which title ends with APOLLO.

select * from film
where title like '%apollo'

12. Get 10 the longest films.

select * from film
order by length desc
limit 10;

13. How many films include Behind the Scenes content?

select count(special_features) as total_behind_scenes from film
where special_features like '%behind the scenes%'