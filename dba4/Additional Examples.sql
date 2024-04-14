USE sample2312;

-- Simplest Query --
SELECT *
FROM staff;

-- Simple query with row filtering
SELECT *
FROM staff
WHERE salary > 10000;

-- use set notation for lists of values --
select * from staff where branchno in ('B002','B005');

-- use set notation for values out of the list--
SELECT * FROM staff WHERE branchno NOT IN ('B002','B005');

SELECT 
    branchno
FROM
    branch
WHERE
    city = 'London';

-- example with subqueries
select * from staff where branchno in (select branchno from branch where city='London');

SELECT * FROM PropertyForRent;

-- check for NULLs --
SELECT * FROM PropertyForRent WHERE staffNo IS NULL;
SELECT * FROM PropertyForRent WHERE staffNo IS NOT NULL;

-- List Properties for rent in a more friendly manner
-- notice type has been pType as type is a reserve word
SELECT 
    propertyNo AS `Property Number`,
    P.postcode AS `Postal Code`,
    pType AS `Type`,
    rooms AS `# rooms`,
    rent AS Rent,
    CONCAT(O.fName," ",O.lName) AS `Owner name`,
    CONCAT(S.fName," ",S.lName) AS `Overseeing Staff`
FROM
    PropertyForRent P,
    PrivateOwner O,
    Staff S
WHERE
    P.staffNo = S.staffNo AND P.ownerNo = O.ownerNo;

-- Aggregation functions example
SELECT sum(salary)
from Staff;

-- Aggregation functions example with group by
SELECT sum(salary)
from Staff
group by sPosition;

SELECT sPosition AS 'Position', sum(salary) AS 'Total per Position'
from Staff
group by sPosition;

-- count number of cities where the company has branches
SELECT count(city)
FROM branch;

-- verifying
SELECT ALL city
FROM branch;

-- ther count is not accurate, let's fix it
SELECT count(DISTINCT city)
FROM branch;
    
-- List the oldest person in each branch
-- testing DateDiff() -> returns the difference of two dates in days
SELECT staffNo, fName, lName, DOB, CURRENT_DATE(), DATEDIFF(CURRENT_DATE(),DOB) AS Age, branchNo
FROM staff
ORDER BY Age DESC;

-- get the date difference in days and convert to years for a proper date
SELECT staffNo, fName, lName, DOB, CURRENT_DATE(), FLOOR(DATEDIFF(CURRENT_DATE(),DOB)/365) AS Age, branchNo
FROM staff
ORDER BY Age DESC;

-- use only the year portion of each date. Does not consider upcomming birthdates
SELECT staffNo, fName, lName, DOB, CURRENT_DATE(), YEAR(CURRENT_DATE())-YEAR(DOB) AS Age, branchNo
FROM staff
ORDER BY Age DESC;

-- see them side by side
SELECT staffNo, fName, lName, DOB, CURRENT_DATE(), FLOOR(DATEDIFF(CURRENT_DATE(),DOB)/365) AS Age, YEAR(CURRENT_DATE())-YEAR(DOB) AS Age2,  branchNo
FROM staff
ORDER BY Age DESC;

-- after testing dates to calculate ages let's answer the question
SELECT branchNo, staffNo, fName, lName, MAX(FLOOR(DATEDIFF(CURRENT_DATE(),DOB)/365)) AS Age
FROM staff
GROUP BY branchNo
ORDER BY Age DESC;
-- what is the error?
-- illegal use of group by and aggregate functions
-- a proper use of them is shown below
SELECT branchNo, MAX(FLOOR(DATEDIFF(CURRENT_DATE(),DOB)/365)) AS Age
FROM staff
GROUP BY branchNo
ORDER BY Age DESC;

-- if you want to add the names you need to join the query above with 
-- Staff where you make branchNo and MaxAge match for getting the right names
SELECT S.branchNo, CONCAT(fName, lName) AS Name, Age
FROM Staff AS S,
     (SELECT branchNo, MAX(FLOOR(DATEDIFF(CURRENT_DATE(), DOB) / 365)) AS Age
	  FROM staff
      GROUP BY branchNo) AS BMaxAge
WHERE FLOOR(DATEDIFF(CURRENT_DATE(),DOB)/365)=Age AND S.branchNo=BMaxAge.branchNo
ORDER BY Age DESC;
