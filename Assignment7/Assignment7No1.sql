-- ***********************************************************************************************************
-- IT2351 Assignment 7 Part 1 - Arshpreet Aulakh
-- Create a stored procedure to delete a customer from the customer table and any other related tables.
-- Use 1032 ER_KEY_NOT_FOUND for condition handling; 
-- ***********************************************************************************************************

DROP PROCEDURE IF EXISTS delete_customer;

DELIMITER //

CREATE PROCEDURE delete_customer(var_customer_id INT, var_order_id INT)
BEGIN
	DECLARE er_key_not_found TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR 1032 	-- check to see that customer you are trying to delete exists (I think this is wrong code since it does not do anything)
		SET er_key_not_found = TRUE;
	
    DELETE FROM order_items WHERE order_id = var_order_id;
    DELETE FROM orders WHERE customer_id = var_customer_id;
    DELETE FROM addresses WHERE customer_id = var_customer_id;
	DELETE FROM customers WHERE customer_id = var_customer_id; -- WHY DID CHANGING THE ORDER TO THIS WORK??
    
    IF er_key_not_found = TRUE THEN
		SELECT 'Customer does not exist!' AS message;
	ELSE
		SELECT 'Customer data successfully deleted' AS message;
	END IF;
END//

DELIMITER ;

CALL delete_customer(7, 8); -- parameters indicate which customer and what that customer's order_id(s) are

-- verfied this works as intended using select statement