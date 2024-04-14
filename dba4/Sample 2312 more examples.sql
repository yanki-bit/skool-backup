SHOW DATABASES;
SHOW CREATE TABLE branch;

-- Change name of column postcode to zip in table branch --
ALTER TABLE branch 
 CHANGE postcode zip CHAR(7);
-- verify the change --
DESCRIBE branch;
-- set postcode back as the name --
ALTER TABLE branch 
 RENAME COLUMN zip TO postcode; 
 -- verify the change --
DESCRIBE branch;

-- change the definition of postcode to varchar and not null --
ALTER TABLE branch 
 MODIFY postcode VARCHAR(7) NOT NULL;
  -- verify the change --
DESCRIBE branch;
DESCRIBE staff;

-- add a column manager to table branch --
ALTER TABLE branch
 ADD COLUMN manager CHAR(4);

-- we can link the column with staff and inforce integrity rules
ALTER TABLE branch
 ADD FOREIGN KEY (manager)
        REFERENCES staff (staffNo)
        ON UPDATE CASCADE ON DELETE SET NULL;

-- verify the change
show create table branch;

-- add values to new foreign key --
UPDATE branch 
SET 
    manager = SL21;
-- the previous fails because of missing quotes, 
-- MySQL takes that value as the name of a column--
UPDATE branch 
SET 
    manager = 'SG37';
-- the previous fails if safe update is enabled, 
-- because it doesn't have a WHERE --
-- this setting can be unchecked in preferences SQL editor
-- at the very end of the page --

UPDATE Branch 
SET 
    branchNo = 'B001'
WHERE
    branchNo = 'B003';

UPDATE branch 
SET 
    manager = 'SL21'
WHERE
    branchNo = 'B003';
-- verify the previous --

DELETE FROM Branch;

SELECT * FROM branch;

UPDATE branch 
SET manager = NULL;
    
-- verify --    
show create table branch;
-- let's get rid of the foreign key we created --
-- we need to check the show create table in order to find
-- the name of the constraint  -- 
ALTER TABLE branch DROP foreign key branch_ibfk_1; 

alter table branch drop column manager;

-- find the names of the staff with the 2 highest salaries --
SELECT 
    lname, fname
FROM
    staff
ORDER BY salary DESC
LIMIT 2;

-- verify 
SELECT 
    lname, fname, salary
FROM
    staff
ORDER BY salary DESC;
 
select * from brach;
select * from staff; 
DELETE from Branch where brachno='B005';
select * from brach;
select * from staff; 

