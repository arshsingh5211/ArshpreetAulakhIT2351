-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2E - Arshpreet Aulakh
-- Output detail for each order but replace customer ID with customer name using another join
-- Multiple join statements are essentially series of two-table joins from left to right
-- ***************************************************************************************************

use om;
SELECT CONCAT(customer_last_name, ", ", customer_first_name) AS "Customer Name", order_date AS "Order Date", 
		title AS Item, artist AS Artist, order_qty AS Quantity
FROM customers
	JOIN orders 
		USING (customer_id)
    JOIN order_details 
		USING (order_id)
    JOIN items 
		USING (item_id);