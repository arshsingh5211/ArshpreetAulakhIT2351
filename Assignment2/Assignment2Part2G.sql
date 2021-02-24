-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2G - Arshpreet Aulakh
-- Output all orders for customers in Ohio
-- Join customers table's primary key of customer_id with order table's foreign key of customer_id
-- ***************************************************************************************************

SELECT CONCAT(customer_last_name, ", ", customer_first_name) AS "Customer Name", customer_state AS State, title AS Title
FROM customers
	JOIN orders USING (customer_id)
    JOIN order_details USING (order_id)
    JOIN items USING (item_id)
WHERE customer_state = "OH";