SHOW DATABASES;


-- -------------------------------------------------------------------------------
-- creating database
CREATE DATABASE COMPANY;
USE COMPANY;

-- -------------------------------------------------------------------------------
-- Employee table

-- Creating table
CREATE TABLE EMPLOYEE (
	Fname VARCHAR (10),
    Minit VARCHAR (1),
    Lname VARCHAR (10),
    Ssn INT (9) NOT NULL,
    Bdate DATE,
    Address VARCHAR (40),
    Sex VARCHAR (1),
    Salary INT (6),
    Super_ssn INT (9),
    Dno INT (1),
    PRIMARY KEY (Ssn)
    );
    
-- Set foreign keys    
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (Super_ssn)
REFERENCES EMPLOYEE (Ssn)
ON DELETE SET NULL;

ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (Dno)
REFERENCES DEPARTMENT (Dnumber)
ON DELETE SET NULL;

-- Populate data    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\employee.csv'
INTO TABLE EMPLOYEE
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Show table
SELECT * FROM EMPLOYEE;


-- -------------------------------------------------------------------------------
-- Department table

-- Creating table
CREATE TABLE DEPARTMENT (
	Dname VARCHAR (20),
    Dnumber INT (1) NOT NULL,
    Mgr_ssn INT (9),
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber)
    );

-- Set foreign keys
ALTER TABLE DEPARTMENT
ADD FOREIGN KEY (Mgr_ssn)
REFERENCES EMPLOYEE (Ssn)
ON DELETE SET NULL;

-- Populate data
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\department.csv' 
INTO TABLE DEPARTMENT
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Show table
SELECT * FROM DEPARTMENT;


-- -------------------------------------------------------------------------------
-- Dept_locations table

-- Creating table
CREATE TABLE DEPT_LOCATIONS (
	Dnumber INT (1) NOT NULL,
    Dlocation VARCHAR (15) NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation)
    );

-- Set foreign keys
ALTER TABLE DEPT_LOCATIONS
ADD FOREIGN KEY (Dnumber)
REFERENCES DEPARTMENT (Dnumber)
ON DELETE CASCADE;

-- Populate data 
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dept_locations.csv'
INTO TABLE DEPT_LOCATIONS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DEPT_LOCATIONS;


-- -------------------------------------------------------------------------------
-- Project table

-- Creating table
CREATE TABLE PROJECT (
	Pname VARCHAR (20),
    Pnumber INT (2) PRIMARY KEY,
	Plocation VARCHAR (15),
    Dnum INT (1)
    );
    
-- Set foreign keys    
ALTER TABLE PROJECT
ADD FOREIGN KEY (Dnum)
REFERENCES DEPARTMENT (Dnumber)
ON DELETE SET NULL;

-- Populate data
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\project.csv'
INTO TABLE PROJECT
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Show table
SELECT * FROM PROJECT;


-- -------------------------------------------------------------------------------
-- Works_on table

-- Creating table
CREATE TABLE WORKS_ON (
	Essn INT (9),
    PNo INT (2),
    Hours DECIMAL (4,1),
    PRIMARY KEY (Essn,PNo)
    );
    
-- Set foreign keys
ALTER TABLE WORKS_ON
ADD FOREIGN KEY (Essn)
REFERENCES EMPLOYEE (Ssn)
ON DELETE CASCADE;

ALTER TABLE WORKS_ON
ADD FOREIGN KEY (Pno)
REFERENCES PROJECT (Pnumber)
ON DELETE CASCADE;

-- Populate data
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\works_on.csv'
INTO TABLE WORKS_ON
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Show table
SELECT * FROM WORKS_ON;


-- -------------------------------------------------------------------------------
-- Dependent table

-- Creating table
CREATE TABLE DEPENDENT (
	Essn INT (9),
    Dependent_name VARCHAR (15),
    Sex VARCHAR (1),
    Bdate DATE,
    Relationship VARCHAR (10),
    PRIMARY KEY (Essn,Dependent_name)
    );
    
-- Set foreign keys
ALTER TABLE DEPENDENT
ADD FOREIGN KEY (Essn)
REFERENCES EMPLOYEE (Ssn)
ON DELETE CASCADE;

-- Populate data    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dependent.csv' 
INTO TABLE DEPENDENT
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Show table
SELECT * FROM DEPENDENT; 








