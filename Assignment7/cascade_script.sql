USE information_schema;  
  
SELECT table_name FROM referential_constraints  
WHERE constraint_schema = 'ArshpreetAulakh_guitar_shop'  
        AND referenced_table_name = 'customers'  
        AND delete_rule = 'CASCADE';
        
-- why doesn't this return anything