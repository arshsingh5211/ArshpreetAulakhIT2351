-- ********************************************************************************************************************
-- IT2351 Assignment 3 Part 5 - Arshpreet Aulakh
-- Return only unique category_names using IN keyword instead of a join
-- ********************************************************************************************************************

SELECT DISTINCT category_name
FROM categories
WHERE category_id IN
	(SELECT category_id
	 FROM products)
ORDER BY category_name;