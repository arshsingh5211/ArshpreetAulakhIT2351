-- ***************************************************************************************************
-- IT2351 Assignment 1 Part 3D - Arshpreet Aulakh
-- Query to select 3 fields and show difference between two dates and sort by ID and that difference
-- ***************************************************************************************************

SELECT customer_id AS "Customer ID", order_date AS "Date of Order", shipped_date AS "Shipped On:", DATEDIFF(shipped_date, order_date) AS Days_to_Ship
FROM orders
WHERE DATEDIFF(shipped_date, order_date) > 0
ORDER BY customer_id, Days_to_Ship;