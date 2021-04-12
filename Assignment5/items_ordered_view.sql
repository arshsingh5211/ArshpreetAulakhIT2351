-- *******************************************************************************************************
-- IT2351 Assignment 5 Part 3 - Arshpreet Aulakh
-- Create a view that shows category name, product name, item price, and quantity of each item
-- *******************************************************************************************************


CREATE OR REPLACE VIEW items_ordered AS
	SELECT category_name, product_name,item_price,quantity
	FROM categories, order_items, products
	WHERE order_items.product_id = products.product_id
		AND categories.category_id = products.category_id
    ORDER BY category_name, product_name;