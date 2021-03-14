-- ********************************************************************************************************************
-- IT2351 Assignment 3 Part 4 - Arshpreet Aulakh
-- Answer the question: What is the total quantity purchased for each product within each category?
-- Use WITH ROLLUP to get summary rows for each category and GROUPING and IF statements to filter out nulls
-- Join categories' primary key of category_id with products' foreign key & products with order_items using product_id
-- ********************************************************************************************************************

SELECT IF(GROUPING(category_name) = 1, 'Grand Total', category_name) 
			AS Category,
	   IF(GROUPING(product_name) = 1, 'All Products', product_name) 
			AS Product, COUNT(*) AS "Total Quantity"
FROM categories
	JOIN products USING (category_id)
    JOIN order_items USING (product_id)
GROUP BY category_name, product_name WITH ROLLUP;