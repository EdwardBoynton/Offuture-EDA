--Project 2 Script

CREATE TABLE student.Where_project2
(
	row_id int,
	order_id varchar(20),
	order_date varchar(20),
	ship_date varchar(20),
	ship_mode varchar(20),
	customer_id varchar(20),
	customer_name varchar(30),
	segment varchar(15),
	city varchar(75),
	state varchar(75),
	country varchar(50),
	postal_code varchar(10),
	market varchar(10),
	region varchar(25),
	product_id varchar(30),
	category varchar(20),
	sub_category varchar(25),
	product_name text,
	sales numeric,
	quantity int,
	discount numeric,
	profit numeric,
	shipping_cost numeric,
	order_priority varchar(10)
);

select *
from student.ofwhere ;

ALTER TABLE student.ofwhere  
ALTER COLUMN "postal_code" TYPE int
USING postal_code::integer;

--Sum,Min,Max
select 
    round(sum("sales"), 2) as Sum_Sales,
    round(min("sales"), 2) as Min_Sales,
    round(max("sales"), 2) as Max_Sales,  
    round(sum("quantity"), 2) as Sum_quantity,
    round(min("quantity"), 2) as Min_quantity,
    round(max("quantity"), 2) as Max_quantity,
    round(sum("discount"), 2) as Sum_discount,
    round(min("discount"), 2) as Min_discount,
    round(max("discount"), 2) as Max_discount,
    round(sum("profit"), 2) as Sum_profit,
    round(min("profit"), 2) as Min_profit,
    round(max("profit"), 2) as Max_profit,
    round(sum("shipping_cost"), 2) as Sum_shipping_cost,
    round(min("shipping_cost"), 2) as Min_shipping_cost,
    round(max("shipping_cost"), 2) as Max_shipping_cost,
    round(sum("row_id"), 2) as Sum_row_id,
    round(min("row_id"), 2) as Min_row_id,
    round(max("row_id"), 2) as Max_row_id,
    round(sum("postal_code"), 2) as Sum_postal_code,
    round(min("postal_code"), 2) as Min_postal_code,
    round(max("postal_code"), 2) as Max_postal_code
from student.ofwhere;

select *
from student.ofwhere;

--good foudation to do analysis from
select 
	product_name,
	sum(profit) as total_profit ,
	sum(sales) total_sales,
	round(avg(discount), 2) as average_discount,
	round(avg(shipping_cost), 2) as average_shipping_cost,
	sum(quantity) total_products_sold
from
	student.ofwhere
group by
	product_name
order by
	sum(quantity)desc;

--Best performing product by profit
select 
	product_name,
	round(sum(profit), 2) as total_profit ,
	round(sum(sales), 2) total_sales,
	sum(quantity) total_products_sold
from
	student.ofwhere
group by
	product_name
order by
	sum(profit)desc
limit 1;

--Best performing product by total_products_sold
select 
	product_name,
	round(sum(profit), 2) as total_profit ,
	round(sum(sales), 2) total_sales,
	sum(quantity) total_products_sold
from
	student.ofwhere
group by
	product_name
order by
	sum(quantity)desc
limit 1;

	
--Worst performing product by profit
select 
	product_name,
	round(sum(profit), 2) as total_profit ,
	round(sum(sales), 2) total_sales,
	sum(quantity) total_products_sold
from
	student.ofwhere
group by
	product_name
order by
	sum(profit)asc
limit 1;

--Top 5 countries by quantity

select 
	country,
	sum(quantity)
from
	student.ofwhere 
group by
	country 
order by 
	sum(quantity) desc
limit 5;
	
--Top 5 countries by profit

select 
	country,
	round(sum(profit), 2)
from
	student.ofwhere 
group by
	country 
order by 
	round(sum(profit), 2) desc
limit 5;
	

--Top 5 countries by total_sales

select 
	country,
	round(sum(sales), 2)
from
	student.ofwhere 
group by
	country 
order by 
	round(sum(sales), 2) desc
limit 5;
	

