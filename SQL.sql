CREATE DATABASE Pizza_db;

USE Pizza_db;

SELECT * FROM pizza_sales;

--1.Sum of total price of all pizza orders
SELECT SUM(total_price) as total_price 
FROM pizza_sales;

--2.Average amount spent per order,calculated by dividing the total revenue by total number of orders
SELECT  (SUM(total_price)/count(DISTINCT order_id)) as avg_order_value 
FROM pizza_sales;

--3.Sum of quantities of all pizzas sold
SELECT SUM(quantity) as total_pizzas_sold
FROM pizza_sales;

--4.Total number of orders placed
SELECT COUNT(DISTINCT order_id)AS total_orders 
FROM pizza_sales;

--5.Average number of pizzas sold per order,calculated by dividing the total number of pizzas sold by the total number of orders
SELECT cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizzas_sold 
FROM pizza_sales;


--6.Daily trend over for total orders
SELECT DATENAME(WEEKDAY,order_date) day_name, 
       count(DISTINCT order_id) as total_orders 
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY,order_date);

--7.Monthly trend for total orders
SELECT DATENAME(MONTH,order_date),
       COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date);

--8.Percentage of sales by pizza category
SELECT pizza_category,
       ROUND(SUM(total_price),2) as total_price,
       ROUND(SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales),2) percent_of_orders
FROM pizza_sales
GROUP BY pizza_category;

--9.Percentage of sales by pizza size
SELECT pizza_size,
       ROUND(SUM(total_price),2) as total_price,
       ROUND(SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales),2) percent_of_orders
FROM pizza_sales
GROUP BY pizza_size;

--10.Total pizzas sold by pizza category
SELECT pizza_category,
       SUM(quantity) as quantity_sold 
FROM pizza_sales
GROUP BY pizza_category;

--11.Top 5 pizzas by revenue
SELECT TOP 5 pizza_name,
       SUM(total_price) AS total_revenue 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC;

--12.Bottom 5 pizzas by revenue
SELECT TOP 5 pizza_name,
       SUM(total_price) AS total_revenue 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY SUM(total_price) ASC;

--13.Top 5 pizzas by quantity
SELECT TOP 5 pizza_name,
       SUM(quantity) AS total_pizzas_sold
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;

--14.Bottom 5 pizzas by quantity
SELECT TOP 5 pizza_name,
       SUM(quantity) AS total_pizzas_sold 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;

--15.TOP 5 pizzas by total orders
SELECT TOP 5 pizza_name,
       COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) DESC;

--16.Bottom 5 pizzas by total orders
SELECT TOP 5 pizza_name,
       COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) ASC;
































































