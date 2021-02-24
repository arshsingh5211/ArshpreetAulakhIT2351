-- *******************************************************************************************************
-- IT2351 Assignment 2 Part 2I - Arshpreet Aulakh
-- Increased price by 10% of all items with a unit_price over 17
-- Used UPDATE and verified it worked by selecting all rows from the items table 
-- *******************************************************************************************************

UPDATE items
SET unit_price = unit_price + (0.1 * unit_price)
WHERE unit_price > 17;