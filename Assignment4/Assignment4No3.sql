-- ****************************************************************************
-- IT2351 Assignment 4 Part 3 - Arshpreet Aulakh
-- Return list price, discount, and discount amount rounded to 2 decimal digits
-- *****************************************************************************

SELECT list_price, discount_percent, ROUND(((list_price * discount_percent)/100), 2) AS discount_amount
FROM products;