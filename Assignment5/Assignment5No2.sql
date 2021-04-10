/********************************************************
* This script creates the database named student_registration
*********************************************************/

DROP DATABASE IF EXISTS ArshpreetAulakh_student_registration;
CREATE DATABASE ArshpreetAulakh_student_registration;
USE ArshpreetAulakh_student_registration;

-- create the tables for the database
CREATE TABLE students (
  student_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  first_name        VARCHAR(255)   NOT NULL,
  last_name         VARCHAR(255)   NOT NULL      
);

CREATE TABLE addresses (
  address_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  student_id         INT            NOT NULL,
  street_address     VARCHAR(50)    NOT NULL      UNIQUE,

    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

CREATE TABLE classes (
  class_id           INT   			PRIMARY KEY   AUTO_INCREMENT,
  student_id         INT   			NOT NULL,
  subject_area		 VARCHAR(10)	NOT NULL,
  course_number		 INT 			NOT NULL,

	FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

-- Insert data into the tables
INSERT INTO students (student_id, first_name, last_name) VALUES
(1, 'Joe', 'Green'),
(2, 'Sue', 'Smith'),
(3, 'Nick', 'Green'),
(4, 'Andy', 'Andrews'),
(5, 'Greg', 'House'),
(6, 'Bruce', 'Wayne'),
(7, 'Clark', 'Kent');

INSERT INTO addresses (address_id, student_id, street_address) VALUES
(1, 1, '124 Main St.'),
(2, 2, '345 Second St.'),
(3, 3, '45 York Road'),
(4, 4, '600 5th Ave.'),
(5, 5, '221B Baker St.'),
(6, 6, '1007 Mountain Dr.'),
(7, 7, '344 Clinton St.');

INSERT INTO classes (class_id, student_id, subject_area, course_number) VALUES
(1, 1, 'IT', 1025),
(2, 1, 'MATH', 1200),
(3, 1, 'IT', 1050),
(4, 2, 'IT', 1025),
(5, 2, 'IT', 1050),
(6, 2, 'IT', 2351),
(7, 3, 'IT', 1025),
(8, 4, 'IT', 1025),
(9, 4, 'IT', 1050),
(10, 5, 'BIO', 2300),
(11, 5, 'CHEM', 2951),
(12, 5, 'PHYS', 2200),
(13, 6, 'ECON', 1100),
(14, 6, 'FIN', 1025),
(15, 7, 'ENG', 1025),
(16, 7, 'JOU', 1400);


-- Create a user named mgs_user
CREATE USER IF NOT EXISTS mgs_user@localhost
IDENTIFIED BY 'pa55word';

-- Grant privileges to that user
GRANT SELECT, INSERT, UPDATE, DELETE
ON mgs.*
TO mgs_user@localhost;