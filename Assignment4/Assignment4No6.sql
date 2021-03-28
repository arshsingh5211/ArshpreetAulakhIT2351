-- **************************************************************************************************************
-- IT2351 Assignment 4 Part 6 - Arshpreet Aulakh
-- Build a view that returns following columns from Orders: order_id, order_date, tax_amount, and ship_date
-- Then add product_name column from Products
-- Next, add the following from Order_Items: item_price, discount_amount, final_price, quantity, and item_total
-- final_price = item_price - discount amount and item_total = calculated total for the item
-- Join orders and order_items using order_id, then join order_items and products USING product_ilaadi26
-- **************************************************************************************************************

CREATE OR REPLACE VIEW order_item_products AS
	SELECT order_id, order_date, tax_amount, ship_date, product_name, item_price, discount_amount,
			(item_price - discount_amount) AS final_price, quantity, ((item_price - discount_amount) * quantity) AS item_total
    FROM orders
		JOIN order_items USING (order_id)
        JOIN products USING (product_id);