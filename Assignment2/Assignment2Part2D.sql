-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2D - Arshpreet Aulakh
-- Output detail for each order but replace item ID with item title using another join
-- Multiple join statements are essentially series of two-table joins from left to right
-- ***************************************************************************************************


use om;
SELECT customers.customer_id AS "Customer ID", order_date AS "Order Date", title AS Item, order_qty AS Quantity
FROM customers
	JOIN orders 
		USING (customer_id)
    JOIN order_details 
		USING (order_id)
    JOIN items 
		USING (item_id);