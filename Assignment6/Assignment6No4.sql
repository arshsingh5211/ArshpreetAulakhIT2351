-- ***********************************************************************************************************
-- IT2351 Assignment 6 Part 4 - Arshpreet Aulakh
-- Create an event that runs once a year that determines which products have not been ordered during the year
-- ***********************************************************************************************************

DROP EVENT IF EXISTS yearly_product_order_audit;

DELIMITER //

CREATE EVENT yearly_product_order_audit
ON SCHEDULE EVERY 1 YEAR
STARTS '2021-04-24'
DO BEGIN
	SELECT product_id, product_name, quantity
    FROM products
		JOIN order_items USING (product_id)
    GROUP BY product_id, quantity
    HAVING SUM(quantity) = 0;

END//

DELIMITER ;
