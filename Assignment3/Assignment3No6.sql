-- ****************************************************************************************************************************
-- IT2351 Assignment 3 Part 6 - Arshpreet Aulakh
-- Return email_address, order_id, and order total for each customer, group result set by email and order_id columns
-- order total = (order_items.item_price - order_items.discount_amount) * order_items.quantity
-- NOTE: Directions state to take order total from order_items table only so did not include shipping or tax from orders table
-- ****************************************************************************************************************************
SELECT email_address, order_id, SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers
	JOIN orders USING (customer_id)
    JOIN order_items USING (order_id)
GROUP BY email_address, order_id;