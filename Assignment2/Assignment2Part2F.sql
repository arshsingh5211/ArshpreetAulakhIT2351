-- ***************************************************************************************************
-- IT2351 Assignment 2 Part 2F - Arshpreet Aulakh
-- Output all titles with order quantitys over one
-- Join items table's primary key of item_id with order_details foreign key of item_id
-- ***************************************************************************************************

use om;
SELECT title, order_qty
FROM items JOIN order_details USING (item_id)
WHERE order_qty > 1;