-- ****************************************************************************************************
-- IT2351 Assignment 4 Part 4 - Arshpreet Aulakh
-- Return order id, order date, approximate ship date and ship date if it doesn't contain a null value
-- approx_ship_date calculated by adding 2 days to order date
-- I did not take out the times of each column as they were included at creation of db initially
-- ****************************************************************************************************

SELECT order_id, order_date, DATE_ADD(order_date, INTERVAL 2 day) AS approx_ship_date, 
	CASE WHEN ISNULL(ship_date) THEN '' ELSE ship_date END AS ship_date
FROM orders;