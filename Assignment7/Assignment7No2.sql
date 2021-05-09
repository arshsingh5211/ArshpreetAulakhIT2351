-- ***********************************************************************************************************
-- IT2351 Assignment 7 Part 2 - Arshpreet Aulakh
-- Create and call a procedure named test that includes three statements coded as a transaction
-- UPS purchased by FEC and now named FedUP
-- Rename one of the vendors and delete the other after updating the vendor_id column in Invoices
-- ***********************************************************************************************************
USE ap;

DELIMITER //

CREATE PROCEDURE test()

BEGIN
	DECLARE sql_error TINYINT DEFAULT FALSE; -- this indictes no error has occurred
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE; -- create condition handler that sets variable to true if error occurs
	
    START TRANSACTION; -- temporarily turns off autocommit mode
    UPDATE invoices -- first statement
	SET vendor_id = 123 -- update vendor_id column
	WHERE vendor_id = 122;

	DELETE FROM vendors -- delete UPS (vendor_id 122) in order to merge both to FedUp
	WHERE vendor_id = 122;

	UPDATE vendors -- rename FEC to FedUp
	SET vendor_name = 'FedUP'
	WHERE vendor_id = 123;

-- This section below verifies that no errors have occurred before committing changes. If there was an error, the ROLLBACK cancels any changes.
-- Necessary because if each statement was executed immediately, the integerity of the data would be lost in case of an error.
	  IF sql_error = FALSE THEN
		COMMIT;
		SELECT 'Transaction committed successfully' AS message;
	  ELSE
		ROLLBACK;
		SELECT 'There was an error! Changes rolled back.' AS message;
	  END IF;
END//

DELIMITER ;

CALL test();
    
    