-- *****************************************************************************************************************
-- IT2351 Assignment 4 Part 2 - Arshpreet Aulakh
-- Return separate columns for email address, length of the email address, location of @ sign, username, and domain
-- *****************************************************************************************************************

SELECT email_address, LENGTH(email_address) AS Length, LOCATE("@", email_address) AS "@", 
	SUBSTRING(email_address, 1, LOCATE('@', email_address) - 1) AS Username, SUBSTRING(email_address, LOCATE('@', email_address) + 1) AS DOMAIN
FROM customers;