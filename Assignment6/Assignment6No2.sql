-- *******************************************************************************************************
-- IT2351 Assignment 6 Part 2 - Arshpreet Aulakh
-- Create and call a stored procedure named insertCategory
-- Insert a "new" category named "Guitars" into Categories with failure message
-- Include unique category into Categories with success message
-- *******************************************************************************************************

DROP PROCEDURE IF EXISTS insertCategory;

-- Change statement delimiter from semicolon to double front slash
DELIMITER //

CREATE PROCEDURE insertCategory(var_category_id INT, var_category_name varchar(50))
BEGIN
	DECLARE duplicate_entry_for_key TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR 1062
		SET duplicate_entry_for_key = TRUE;
        
	INSERT INTO categories VALUES (var_category_id, var_category_name);
    
    IF duplicate_entry_for_key = TRUE THEN
		SELECT 'Row was not inserted - duplicate entry.' AS message;
	ELSE
		SELECT '1 row was inserted.' AS message;
	END IF;
END//

-- thought about adding commit and rollback but directions state to use general script structure in book and figure 15-9 does not have them

-- Change statement delimiter back to semicolon
DELIMITER ;

CALL insertCategory(5, 'Piano');