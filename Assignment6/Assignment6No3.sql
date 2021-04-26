-- *******************************************************************************************************
-- IT2351 Assignment 6 Part 3 - Arshpreet Aulakh
-- Create and call a stored function that calculates discount price of item
-- Function should accept one parameter for item_id then return that item's discount
-- (discount amount subtracted from item price)
-- *******************************************************************************************************

DROP FUNCTION IF EXISTS discount_price;

DELIMITER //

CREATE FUNCTION discount_price (
	item_id_param INT
)
RETURNS DECIMAL(9, 2)
DETERMINISTIC READS SQL DATA
-- this means it reads data but doesn't write anything to db && it always produces the same results
BEGIN
	DECLARE discount_price_var DECIMAL(9,2);
    
    SELECT item_price - discount_amount
    INTO discount_price_var
    FROM order_items
    WHERE item_id = item_id_param;
    
    RETURN(discount_price_var);

END//

DELIMITER ;