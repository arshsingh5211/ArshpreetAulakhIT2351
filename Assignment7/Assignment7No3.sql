-- ***********************************************************************************************************
-- IT2351 Assignment 7 Part 3 - Arshpreet Aulakh
-- Create and call a procedure named test that includes two SQL statements coded as transaction
-- Delete the row with an invoice ID of 114 by first deleting all line items for that invoice from Line_Items
-- Commit or roll back in case of error
-- ***********************************************************************************************************
USE ap;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
-- above is same as last question, just setting up condition handling

  START TRANSACTION;
  
  DELETE FROM invoice_line_items -- first delete all line items from line items table for that invoice
  WHERE invoice_id = 114;

  DELETE FROM invoices -- then delete that invoice from the invoices (parent) table
  WHERE invoice_id = 114;

	-- commit or roll back depending on whether there are errors
  COMMIT;
  
  IF sql_error = FALSE THEN
    COMMIT;
    SELECT 'The transaction was committed.';
  ELSE
    ROLLBACK;
    SELECT 'The transaction failed. Changes rolled back.';  -- rollback is to cancel changes back to how it was
  END IF;
END//

DELIMITER ;

CALL test();

-- verify this worked by running a query after