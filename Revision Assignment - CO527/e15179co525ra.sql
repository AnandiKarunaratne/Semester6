SHOW DATABASES;


-- creating database
CREATE DATABASE COMPANY;
USE COMPANY;


-- Employee table
CREATE TABLE EMPLOYEE (
	Fname VARCHAR (10),
    Minit VARCHAR (1),
    Lname VARCHAR (10),
    Ssn INT (9) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR (40),
    Sex VARCHAR (1),
    Salary INT (6),
    Super_ssn INT (9),
    Dno INT (1)
    );
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\employee.csv'
INTO TABLE EMPLOYEE
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM EMPLOYEE;


-- Department table
CREATE TABLE DEPARTMENT (
	Dname VARCHAR (20),
    Dnumber INT (1) PRIMARY KEY,
    Mgr_ssn INT (9),
    Mgr_start_date DATE
    );

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\department.csv' 
INTO TABLE DEPARTMENT
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DEPARTMENT;


-- Dept_locations table
CREATE TABLE DEPT_LOCATIONS (
	Dnumber INT (1),
    Dlocation VARCHAR (15),
	PRIMARY KEY (Dnumber, Dlocation)
    );

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dept_locations.csv'
INTO TABLE DEPT_LOCATIONS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DEPT_LOCATIONS;


-- Project table
CREATE TABLE PROJECT (
	Pname VARCHAR (20),
    Pnumber INT (2) PRIMARY KEY,
	Plocation VARCHAR (15),
    Dnum INT (1)
    );

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\project.csv'
INTO TABLE PROJECT
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM PROJECT;


-- Works_on table
CREATE TABLE WORKS_ON (
	Essn INT (9),
    PNo INT (2),
    Hours DECIMAL (4,1),
    PRIMARY KEY (Essn,PNo)
    );

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\works_on.csv'
INTO TABLE WORKS_ON
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM WORKS_ON;


-- Dependent table
CREATE TABLE DEPENDENT (
	Essn INT (9),
    Dependent_name VARCHAR (15),
    Sex VARCHAR (1),
    Bdate DATE,
    Relationship VARCHAR (10),
    PRIMARY KEY (Essn,Dependent_name)
    );
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dependent.csv' 
INTO TABLE DEPENDENT
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM DEPENDENT; 


