# 1. How many distinct (different) actors' last names are there?
Select COUNT(Distinct(last_name)) from sakila.actor;

# 2. In how many different languages where the films originally produced?
Select distinct(name) from sakila.language;

# 3. How many movies were not originally filmed in English?
 Select count(language_id <> "english") as "non-english"
 from sakila.language;

# 4. Get 10 the longest movies from 2006.
SELECT * from sakila.film length
where release_year = 2006
ORDER by length DESC
limit 10;

# 5. How many days has been the company operating (check DATEDIFF() function)?
-- SELECT DATEDIFF(max(return_date), min(rental_date)) as total_operating_days, min(rental_date) as first_rental, max(return_date) as last_return from sakila.rental;
SELECT DATEDIFF(max(last_update), min(last_update)) as total_operating_days, min(last_update) as first_employee_update, max(last_update) as last_employee_update from sakila.staff;

# 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, DATE_FORMAT(rental_date, "%M") as rental_month, DATE_FORMAT(rental_date, "%w") as rental_weekday from sakila.rental
limit 20;

# 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
 SELECT *,
 CASE
	when dayofweek(return_date)=6 or dayofweek(return_date)=7 then "weekend"
    else "workday"
end as "retun_date dat_type"
from sakila.rental

# 8. How many rentals were in the last month of activity?
Select count(rental_id) from sakila.rental
where date_sub(max(last_update), Interval 30 day);


