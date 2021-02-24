-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2A - Arshpreet Aulakh
-- Query using inner join to output from items and order_details using item_id from each table
-- item_id is primary key of items table and foreign key of order_details table
-- ***************************************************************************************************


use om;
SELECT title, artist, unit_price, order_qty
FROM items i JOIN order_details od
		ON i.item_id = od.item_id
ORDER BY title, artist;