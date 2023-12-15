-- 1 Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
select title, length , rank () over (order by length desc) as "rank"
from film
where length <> " " or 0;

-- 2 Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
select title, length, rating, rank () over (partition by rating order by rating asc) as "rank"
from film
where length <> " " or 0;

-- 3 How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
select count(fc.film_id) as "counter", c.name
from category as c join film_category as fc on c.category_id = fc.category_id
group by name;

-- 4 Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
select a.first_name, a.last_name, a.actor_id, count(fa.film_id) as "counter"
from actor as a join film_actor as fa on a.actor_id = fa.actor_id
group by a.actor_id
order by counter desc
limit 1;

-- 5 Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.
select c.first_name, c.last_name, c.customer_id, count(r.rental_id) as "counter"
from rental as r join customer as c on r.customer_id = c.customer_id
group by c.customer_id
order by counter desc
limit 1;