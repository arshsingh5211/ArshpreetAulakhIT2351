-- *****************************************************************************************************************************************
-- IT2351 Assignment 4 Part 5 - Arshpreet Aulakh
-- Return category name from categories, product name from products
-- Return column named total_sales that shows the sum of the sales for each product with sales in the order_items table
-- Return column named highest_sales that uses the first_value function to show the name of the product with highest sales in each category
-- Return column named lowest_sales that uses the flast_value function to show the name of the product with lowest sales in each category
-- Join categories with products using category_id, and join products with order_items using product_id
-- *****************************************************************************************************************************************

SELECT category_name, product_name, SUM((item_price + discount_amount) * quantity) AS total_sales,
	FIRST_VALUE(product_name) OVER(PARTITION BY category_name 
										ORDER BY SUM((item_price + discount_amount) * quantity) DESC
                                        ) AS highest_sales,
	LAST_VALUE(product_name) OVER(PARTITION BY category_name 
										ORDER BY SUM((item_price + discount_amount) * quantity) DESC
                                        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                                        ) AS lowest_sales
FROM categories
	JOIN products USING (category_id)
    JOIN order_items USING (product_id)
GROUP BY product_id;