--# выручка по месяцам 
Select date_trunc('month', payment_date) as date,
sum(amount) as sum_amount
From payment
group by date_trunc('month', payment_date)
order by date asc

--# выручка по магазинам
select s_2.store_id, sum(p.amount) as total_amount
from payment p join staff s
on p.staff_id = s.staff_id
join store s_2 on s.store_id = s_2.store_id
group by s_2.store_id

--# количество клиентов по магазинам

select store_id, 
count(customer_id)
from customer 
group by store_id


--# популярные категории
select f.category_id, c.name, count(r.rental_id) as cnt_rental
from  rental r join inventory i on r.inventory_id = i.inventory_id
join film_category f on i.film_id = f.film_id
join category c on c.category_id = f.category_id
group by  f.category_id, c.name
order by cnt_rental desc


--# самые доходные фильмы
select f.film_id, f.title, sum(p.amount) as sum_amount
from payment p join rental r on p.rental_id = r.rental_id
join inventory i on r.inventory_id= i.inventory_id
join film f on i.film_id = f.film_id
group by f.film_id, f.title
order by sum_amount desc


--# средний платёж
select avg(p.amount) as avg_amount
from payment p


--# клиенты с наибольшей суммой платежей
select c.customer_id, c.first_name, sum(p.amount) as sum_amount
from payment p join customer c on p.customer_id = c.customer_id
group by c.customer_id, c.first_name
order by sum_amount desc
limit 1 


--# фильмы, которые редко арендуют
select f.film_id, f.title, count(r.rental_id) as count_cnt
from rental r left join  inventory i on r.inventory_id= i.inventory_id
left join film f on i.film_id = f.film_id
group by f.film_id, f.title
order by count_cnt asc



--# фильмы, которые не арендуют
select f.film_id, f.title
from film f left join inventory i on i.film_id = f.film_id
left join rental r on r.inventory_id= i.inventory_id
where r.rental_id is null
ыы
























