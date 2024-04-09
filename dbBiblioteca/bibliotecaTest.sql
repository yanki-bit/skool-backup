-- this is a comment
create database biblioteca;

-- get the database
use biblioteca;

-- --------------------------------
-- create the individual tables
-- create the table for authors 
create table Author (
	authorID int,
    -- PRIMARY KEY (authorID),
    firstName varchar(255),
    lastName varchar(255),
    email varchar(255),
    PRIMARY KEY (authorID)
);

-- create table for publisher
create table Publisher (
	publisherID int,
    publisherName varchar(255),
    street varchar(255),
    city varchar(255),
    country varchar(255),
    postalCode varchar(255),
    email varchar(255),
    contactNo varchar(255),
    PRIMARY KEY (publisherID)
);

-- create table for library staff
create table libraryStaff (
	staffID int,
    -- PRIMARY KEY (staffID),
    firstName varchar(255),
    lastName varchar(255),
    phoneNum varchar(255),
    email varchar(255),
    street varchar(255),
    postalCode varchar(255),
    city varchar(255),
    country varchar(255),
    staffpassword varchar(255), -- password seems to be a keyword, so I renamed the column
	PRIMARY KEY (staffID)
);

-- create table for borrower
create table Borrower (
	userID int,
    PRIMARY KEY (userID),
    firstName varchar(255),
    lastName varchar(255),
    phoneNum varchar(255),
    email varchar(255),
    street varchar(255),
    postalCode varchar(255),
    city varchar(255),
    country varchar(255),
    userpassword varchar(255) -- password seems to be a keyword, so I renamed the column
);

-- create table for books
create table Books (
	bookID int,
    title varchar(255),
    ISBN_NO varchar(255),
    phoneNum varchar(255),
    email varchar(255),
    pubYear varchar(255),
    authorID int,
    publisherID int,
    genre1 varchar(255),
    genre2 varchar(255),
	PRIMARY KEY (bookID),
    FOREIGN KEY (authorID)
		REFERENCES Author (authorID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (publisherID)
		REFERENCES Publisher (publisherID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

-- create table for records
create table Record (
	recordID int,
    returnDate date,
    issueDate date,
    userID int,
    bookID int,
    staffID int,
    PRIMARY KEY (recordID),
    -- userID
     FOREIGN KEY (userID)
		REFERENCES Borrower (userID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    -- bookID
     FOREIGN KEY (bookID)
		REFERENCES Books (bookID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    -- staffID
     FOREIGN KEY (staffID)
		REFERENCES libraryStaff (staffID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

-- check if tables were generated
describe Author;
describe Publisher;
describe libraryStaff;
describe Borrower;
describe Books;
describe Record;

-- delete the data
drop database biblioteca;
