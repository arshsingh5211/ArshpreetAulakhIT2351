-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2B - Arshpreet Aulakh
-- Query using inner join to output from orders and customers using customer_id from each table
-- customer_id is primary key of customers table and foreign key of order table
-- ***************************************************************************************************

use om;
SELECT CONCAT(customer_last_name, ", ", customer_first_name) AS Name, customer_city AS City, customer_state AS State, 
	   order_date AS "Order Date", shipped_date AS "Shipped Date", order_id AS "Order ID", customer_id AS "Customer ID"
FROM customers 
JOIN orders USING (customer_id)
ORDER BY customer_state, customer_city, customer_last_name, customer_first_name;