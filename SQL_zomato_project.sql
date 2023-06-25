create database zomato_data;

use zomato_data;

create table gold_consumers(user_id int , date_of_gold_signup date);

insert into gold_consumers(user_id ,date_of_gold_signup)values(1,'2019-08-09'),(3,'2020-09-10');

select*from gold_consumers;

create table users(user_id int , date_of_sign_up date);

insert into users(user_id , date_of_sign_up)values(1,'2020-12-12'),(2,'2019-12-11'),(3,'2018-09-01');

create table sales(user_id int ,order_date date , product_id int);

insert into sales(user_id , order_date , product_id)
values(3,'2019-08-04',2),
(2,'2020-12-09' , 1),
(1,'2020-11-01' , 3),
(2,'2018-12-09' , 1),
(3,'2021-11-11',  2),
(1,'2020-12-09' , 3);

select*from sales;

create table product(product_id int , product_name varchar(25) ,price int);

alter table product modify product_name text ;

insert into product(product_id ,product_name ,price)values(1,'p1',900),(2,'p2',800),(3,'p3',500);

drop table if exists product;

create table product(product_id int , product_name varchar(25) ,price int);

alter table product modify product_name text ;

insert into product(product_id ,product_name ,price)values(1,'p1',900),(2,'p2',800),(3,'p3',500);

SELECT *FROM product; 


##total amount customers spent on products 

SELECT 
    s.user_id, SUM(price) AS total_amt
FROM
    sales s
        INNER JOIN
    product p ON s.product_id = p.product_id
GROUP BY user_id;


##first product purchased by each customer 

select*
from
(
select*,
 dense_rank() over (partition by user_id order by order_date) RN
from sales
) T
where RN = 1 ;

##days customer visited zomato

SELECT 
    s.user_id, COUNT(DISTINCT s.order_date) AS total_days
FROM
    sales s
GROUP BY s.user_id;


##ITEM MOST POPULAR FOR EACH CUSTOMER 













