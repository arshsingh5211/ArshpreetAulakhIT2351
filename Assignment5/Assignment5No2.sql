/********************************************************
* This script creates the database named student_registration
*********************************************************/

DROP DATABASE IF EXISTS ArshpreetAulakh_student_registration;
CREATE DATABASE ArshpreetAulakh_student_registration;
USE ArshpreetAulakh_student_registration;

-- create the tables for the database
CREATE TABLE students (
  student_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  first_name        VARCHAR(50)   NOT NULL,
  last_name         VARCHAR(50)   NOT NULL,
  email_address		VARCHAR(50)	   NOT NULL,
  major				VARCHAR(50)
);

CREATE TABLE addresses (
  address_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  student_id         INT            NOT NULL,
  street_address     VARCHAR(50)    NOT NULL      UNIQUE,

    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

CREATE TABLE classes (
  class_id    		 INT   			PRIMARY KEY   AUTO_INCREMENT,
  class_name		VARCHAR(50)
);


CREATE TABLE registration (
  registration_id    INT   			PRIMARY KEY   AUTO_INCREMENT,
  student_id         INT   			NOT NULL,
  class_id			 INT			NOT NULL,
  

	FOREIGN KEY (student_id)
    REFERENCES students (student_id),
    FOREIGN KEY (class_id)
    REFERENCES classes(class_id)
);



-- Insert data into the tables
INSERT INTO students (student_id, first_name, last_name, email_address, major) VALUES
(1, 'Joe', 'Green', 'Joe@school.edu', 'Programming'),
(2, 'Sue', 'Smith', 'Sue@school.edu', 'Programming'),
(3, 'Nick', 'Green', 'Nick@school.edu', 'Networking'),
(4, 'Andy', 'Andrews', 'Andy@school.edu', 'Networking'),
(5, 'Greg', 'House', 'Greg@school.edu', 'Medicine'),
(6, 'Bruce', 'Wayne', 'Bruce@school.edu', 'Finance'),
(7, 'Clark', 'Kent', 'Clark@school.edu', 'Journalism');

INSERT INTO addresses (address_id, student_id, street_address) VALUES
(1, 1, '124 Main St.'),
(2, 2, '345 Second St.'),
(3, 3, '45 York Road'),
(4, 4, '600 5th Ave.'),
(5, 5, '221B Baker St.'),
(6, 6, '1007 Mountain Dr.'),
(7, 7, '344 Clinton St.');

INSERT INTO classes(class_id, class_name) VALUES
(1, 'IT1025'),
(2, 'IT1050'),
(3, 'IT2351'),
(4, 'MATH1200'),
(5, 'CHEM 2020'),
(6, 'ECON 3000'),
(7, 'JOUR 1200');

INSERT INTO registration(registration_id, student_id, class_id) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 2),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 3, 1),
(8, 4, 1),
(9, 4, 2),
(10, 5, 4),
(11, 5, 5),
(12, 6, 6),
(13, 7, 7);


-- Create a user named mgs_user
CREATE USER IF NOT EXISTS mgs_user@localhost
IDENTIFIED BY 'pa55word';

-- Grant privileges to that user
GRANT SELECT, INSERT, UPDATE, DELETE
ON mgs.*
TO mgs_user@localhost;
