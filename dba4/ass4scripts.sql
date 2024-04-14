-- contains scripts for assignment 4
-- programmer: Yani Tiangco 100 447 113 
-- course: INFO 2312 Section S10

-- Q1 Mike Ritchie
-- PropertyForRent
SELECT 
	P.propertyNo AS `Property Number`,
    P.pType AS `Property Type`,
    P.rooms AS `Number of Rooms`,
    P.rent AS `Rental Price`,
    P.branchNo AS `Branch Number`
FROM
    PropertyForRent AS P
WHERE 
	P.propertyNo IN
		(SELECT propertyNo 
        FROM Viewing 
        WHERE clientNo = 'CR74' AND vComment IS NULL); 
    
SELECT 
	P.propertyNo AS `Property Number`,
    P.pType AS `Property Type`,
    P.rooms AS `Number of Rooms`,
    P.rent AS `Rental Price`,
    P.branchNo AS `Branch Number`
FROM
    PropertyForRent AS P
WHERE 
	P.propertyNo IN
		(SELECT propertyNo 
        FROM Viewing 
        WHERE clientNo = 'CR56' AND vComment IS NULL); 
        
-- PropertyForRent
SELECT DISTINCT 
	P.propertyNo AS `Property Number`,
    P.pType AS `Property Type`,
    P.rooms AS `Number of Rooms`,
    P.rent AS `Rental Price`,
    P.branchNo AS `Branch Number`
FROM
    PropertyForRent P,
    Viewing V
WHERE 
	V.clientNo = 'CR74'
 	AND V.vComment IS NULL;

SELECT * 
FROM Viewing
WHERE vComment 
IS NULL;

SELECT * FROM PropertyForRent;
SELECT * FROM Branch;

-- Q2 PG4 leaking pipe, staff
SELECT 
	CONCAT(S.fName," ",S.lName) AS `Responsible-Staff`,
    B.street, B.city, B.postcode
FROM 
    Branch B,
    Staff S,
    PropertyForRent P
WHERE
--   P.staffNo = S.staffNo AND P.branchNo = B.branchNo
     P.staffNo = S.staffNo AND P.propertyNO ='PL94';
     
-- Q2 PG4 leaking pipe, staff
-- below actually works lol
SELECT 
	CONCAT(S.fName," ",S.lName) AS `Responsible-Staff`,
    B.address AS `Branch Address`
FROM 
    Branch B
--    Staff S,
--    PropertyForRent P
	JOIN PropertyForRent P ON B.branchNo = P.branchNo
    JOIN Staff S ON P.staffNo = S.staffNo
WHERE 
	P.propertyNo ='PG4';


-- Q3 Branch table modification
-- 1) New column
ALTER TABLE Branch
 ADD COLUMN address varchar(52);

DESCRIBE Branch;
SELECT * FROM Branch;
 
-- 2) Data move
UPDATE Branch 
SET address=concat(street," ",city," ",postcode)
WHERE branchNo != 'B008'; 

-- 3) remove old unneeded columns
ALTER TABLE Branch 
DROP COLUMN street,
DROP COLUMN city,
DROP COLUMN postcode;

-- Q4
insert into Viewing values
	('CR56', 'PA24', '2013-06-24 10:00', 'I am Groot');
    
-- Q5 Secretary learning SQL scripts
insert into CClient values
	(750, 'Smithe', 'House', '04425-190921', 'John', 'CR61', 'johnsybad@live.uk');
    
describe CClient;
-- reformat the previous query into correct order:
INSERT INTO CClient
			(clientNo,	fName    ,lName   ,telNo    ,	prefType,   maxRent, eMail)
VALUES
			('CR61',	'John',	'Smithe','04425-190921', 'House',	750,  'johnsybad@live.uk');

-- Check if the query worked correctly
SELECT * FROM CClient;
    
-- Q6
-- display registration table before deletion of staff SG37
describe Registration; -- here just to check the structure
SELECT * FROM Registration;

-- delete staff SG37
DELETE FROM Staff 
WHERE staffNo='SG37';

-- display registration after deletion of staff SG37
SELECT * FROM Registration;

-- Q7 modify the Viewing table
UPDATE Viewing 
SET 
    vComment = 'No comment';
-- above doesn't work since safe mode is on

-- modified to target only the NULL comment rows, not ALL rows under vComment column
UPDATE Viewing 
SET vComment = 'No comment'
WHERE vComment IS NULL; -- safe updates didn't allow me to target only vComment

-- make the query even more specific
UPDATE Viewing SET vComment = 'No comment' WHERE vComment IS NULL AND clientNo = 'CR56';

-- verify if it worked
SELECT * FROM Viewing;