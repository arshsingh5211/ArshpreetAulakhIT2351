-- ***********************************************************************************************************************************
-- IT2351 Assignment 4 Part 1 - Arshpreet Aulakh
-- Return list_price, list_price formatted to 1 decimal place, list_price converted to signed integer, then casted as signed integer
-- ***********************************************************************************************************************************

SELECT list_price, FORMAT(list_price, 1), CONVERT(list_price, SIGNED), CAST(list_price AS SIGNED)
FROM products;