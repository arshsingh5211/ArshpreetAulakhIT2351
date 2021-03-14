-- ****************************************************************************************************************
-- IT2351 Assignment 3 Part 3 - Arshpreet Aulakh
-- Count how many products are in each category and return the price of the most expensive product in each category
-- Sort so that the category with most products is listed first
-- Join both tables using categories' primary key of category_id with products' foreign key
-- *****************************************************************************************************************

SELECT category_name AS "Category Name", COUNT(product_id) AS "Number of Products", MAX(list_price) AS "Largest Price"
FROM categories
	JOIN products USING (category_id)
GROUP BY category_id
ORDER BY COUNT(product_id) DESC;