-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2C - Arshpreet Aulakh
-- Output detail for each order
-- Multiple join statements are essentially series of two-table joins from left to right
-- USING keyword applies when joining two fields with the same name
-- ***************************************************************************************************

use om;
SELECT customer_id AS "Customer ID", order_date AS "Order Date", item_id AS "Item ID", order_qty AS Quantity
FROM customers
	JOIN orders 
		USING (customer_id)
	JOIN order_details 
		USING (order_id);