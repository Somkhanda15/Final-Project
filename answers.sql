-- Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Authors table
CREATE TABLE Authors (
  AuthorID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  UNIQUE (FirstName, LastName)
);

-- Create Publishers table
CREATE TABLE Publishers (
  PublisherID INT AUTO_INCREMENT PRIMARY KEY,
  PublisherName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Books table
CREATE TABLE Books (
  BookID INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(200) NOT NULL,
  PublisherID INT,
  PublicationYear YEAR,
  ISBN VARCHAR(20) UNIQUE,
  FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Junction table for Many-to-Many relation between Books and Authors
CREATE TABLE BookAuthors (
  BookID INT,
  AuthorID INT,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Members table
CREATE TABLE Members (
  MemberID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  JoinDate DATE NOT NULL
);

-- Create Loans table to track book borrowing
CREATE TABLE Loans (
  LoanID INT AUTO_INCREMENT PRIMARY KEY,
  BookID INT NOT NULL,
  MemberID INT NOT NULL,
  LoanDate DATE NOT NULL,
  ReturnDate DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
