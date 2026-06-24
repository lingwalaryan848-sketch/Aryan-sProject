CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(20),
    quantiy INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);
USE RetailSalesDB;

SHOW TABLES;
SELECT * 
FROM retail_sales
LIMIT 100;
SELECT *
FROM `sql - retail sales analysis_utf`
LIMIT 1000;
select * from `sql - retail sales analysis_utf`
where transactions_id is null;
select * from `sql - retail sales analysis_utf`
where transactions_id is null
or sale_date  is null
or  sale_time  is null
or gender is null
or category is null
or quantiy is null
or cogs  is null
or total_sale is null; 

select count(*) as total_sale from `sql - retail sales analysis_utf`;
select year, month , avg_sale from(
select extract(year from sale_date )as year,
       extract(month from sale_date) as month,
       avg(total_sale) as avg_sale,
       RANK() over (partition by extract(YEAR from sale_date) order by avg(total_sale) DESC) as RANK 
       from `sql - retail sales analysis_utf`
       group by 1,2 
as t1
where rank=1;



select category, SUM(total_Sale) AS NET_SALE,count(*) as total_orders from `sql - retail sales analysis_utf` group by 1;

select avg(age) as avg_age from `sql - retail sales analysis_utf` where category ='Beauty';
select * from `sql - retail sales analysis_utf` where total_sale >1000;
SELECT customer_id, SUM(total_Sale)as total_sales from `sql - retail sales analysis_utf`
group by 1  order by 2 desc
limit 5;

select count(distinct customer_id) , category as unique_customers from `sql - retail sales analysis_utf`
group by category;
