--Запрос 1

with Sample (id, name, price)
as
(select L.id_trip,T.name, sum((L.days_count-1)*H.price_per_person*T.group_count) as
price from 
Location
L join Hotel H on H.hotel_id=L.hotel_id
join Trips T on L.id_trip=T.id_trip
GROUP BY L.id_trip, T.name
order by price desc) 
select Sample.id, Sample.name, Sample.price, Trips.group_count from Sample join Trips on Sample.id=Trips.id_trip
limit 3;

--Запрос 2

with S (id, city)
as
(select  Tr.id_trip, Tr.city_from as city
from Transfer Tr join Trips T 
on Tr.id_trip=T.id_trip
union
select  Tr.id_trip, Tr.city_to as city
from Transfer Tr join Trips T 
on Tr.id_trip=T.id_trip)
select S.id,Trips.name, count(distinct S.city) as cities from S join Trips on S.id=Trips.id_trip
group by S.id,Trips.name
having count(S.city) >=ALL(select count(S.city) from S group by S.id);


--Запрос 3

with S (city)
as
(select  Tr.city_from as city
from Transfer Tr
union
select Tr.city_to as city
from Transfer Tr)
select C.id_country, C.country_name, count(distinct S.city) as count
from City C join S on S.city=C.id_city
group by C.id_country, C.country_name
having count(distinct S.city)>1
order by count desc;

--Запрос 4

select S.time from (select sum(Tr.datetime_end -Tr.datetime_start) as time from Transfer Tr) S;

--Запрос 5

select T.name, count(Tr.transport_id) as count from Transfer Tr join Transport T
on T.transport_id=Tr.transport_id
group by T.name
order by count desc;

--Запрос 6

select Tr.id_trip, T.name, sum(Tr.datetime_end-Tr.datetime_start) from Trips T 
join Transfer Tr on T.id_trip=Tr.id_trip
group by Tr.id_trip, T.name,Tr.transport_id
having Tr.transport_id in (402,403,404,405,407,408,409) and 
sum(Tr.datetime_end-Tr.datetime_start) >=ALL(select sum(Tr.datetime_end-Tr.datetime_start) 
					     from Transfer Tr group by Tr.transport_id
                                             having Tr.transport_id in (402,403,404,405,407,408,409));
--Запрос 7

select distinct Tr.id_trip, T.name from transfer Tr 
join Trips T on Tr.id_trip=T.id_trip
where Tr.transport_id = 401;

--Запрос 8

with S (id,name,percents)
as
(select C.id_country, C.country_name, sum(L.days_count) as percents from location L join City C on C.id_city=L.city_staying
group by C.id_country, C.country_name)
select S.id, S.name, S.percents/(select sum(S.percents) from S)*100 from S
order by percents desc, S.id;

--Запрос 9

select L.city_staying, C.city_name from Location L join City C 
on C.id_city=L.city_staying join Hotel H on L.hotel_id=H.hotel_id 
where H.price_per_person = (select max(price_per_person) from Hotel);

--Запрос 10

with S (organizator, count)
as
(select organizator, count(organizator) from Trips
group by organizator)
select S.organizator, S.count from S
where S.count = (select max(S.count) from S);