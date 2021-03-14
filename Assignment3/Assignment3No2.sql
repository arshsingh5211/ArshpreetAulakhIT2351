-- ***********************************************************************************************
-- IT2351 Assignment 3 Part 2 - Arshpreet Aulakh
-- Output number of orders and sum of the "Ship Value" (sum of the ship_amount), both from orders
-- Using COUNT and SUM for each
-- ***********************************************************************************************

SELECT COUNT(*) AS "Number of Orders", SUM(ship_amount) as "Ship Value"
FROM ORDERS;
