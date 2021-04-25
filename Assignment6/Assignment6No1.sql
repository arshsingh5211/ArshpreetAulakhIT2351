-- *******************************************************************************************************
-- IT2351 Assignment 6 Part 1 - Arshpreet Aulakh
-- Create and call a stored procedure named productCount
-- Display a message based on whether count is >= 20 or not
-- *******************************************************************************************************

DROP PROCEDURE IF EXISTS productCount;

-- Change statement delimiter from semicolon to double front slash
DELIMITER //

CREATE PROCEDURE productCount()
BEGIN
	DECLARE count INT;
	
    SELECT (COUNT(product_id))
    FROM products;
    
    IF (count >= 20) THEN
		SELECT 'The number of products is greater than or equal to 20' AS message;
	ELSE
		SELECT 'The number of products is less than 20' AS message;
	END IF;
END//

-- Change statement delimiter back to semicolon
DELIMITER ;

CALL productCount