CREATE DATABASE IF NOT EXISTS db_LibraryManagement;
    use db_LibraryManagement;
    
    CREATE TABLE IF NOT EXISTS tbl_publisher (
        publisher_PublisherName VARCHAR(100) PRIMARY KEY,
        publisher_PublisherAddress VARCHAR(200) NOT NULL,
        publisher_PublisherPhone VARCHAR(50) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tbl_book (
        book_BookID INT PRIMARY KEY AUTO_INCREMENT,
        book_Title VARCHAR(100) NOT NULL,
        book_PublisherName VARCHAR(100) NOT NULL,
        FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS tbl_library_branch (
        library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT,
        library_branch_BranchName VARCHAR(100) NOT NULL,
        library_branch_BranchAddress VARCHAR(200) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tbl_borrower (
        borrower_CardNo INT PRIMARY KEY AUTO_INCREMENT,
        borrower_BorrowerName VARCHAR(100) NOT NULL,
        borrower_BorrowerAddress VARCHAR(200) NOT NULL,
        borrower_BorrowerPhone VARCHAR(50) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tbl_book_loans (
        book_loans_LoansID INT PRIMARY KEY AUTO_INCREMENT,
        book_loans_BookID INT NOT NULL,
        book_loans_BranchID INT NOT NULL,
        book_loans_CardNo INT NOT NULL,
        book_loans_DateOut DATE NOT NULL,
        book_loans_DueDate DATE NOT NULL,
        FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS tbl_book_copies (
        book_copies_CopiesID INT PRIMARY KEY AUTO_INCREMENT,
        book_copies_BookID INT NOT NULL,
        book_copies_BranchID INT NOT NULL,
        book_copies_No_Of_Copies INT NOT NULL,
        FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS tbl_book_authors (
        book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT,
        book_authors_BookID INT NOT NULL,
        book_authors_AuthorName VARCHAR(50) NOT NULL,
        FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
    );

    /* ====================== POPULATING TABLES ======================= */

    INSERT INTO tbl_publisher (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone) VALUES
        ('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
        ('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
        ('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
        ('Chilton Books','Not Available','Not Available'),
        ('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
        ('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),        
        ('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
        ('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
        ('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
        ('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
        ('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
        ('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
        ('W.W. Norton','W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
        ('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
        ('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
        ('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');

    INSERT INTO tbl_book (book_Title, book_PublisherName) VALUES 
        ('The Name of the Wind', 'DAW Books'),
        ('It', 'Viking'),
        ('The Green Mile', 'Signet Books'),
        ('Dune', 'Chilton Books'),
        ('The Hobbit', 'George Allen & Unwin'),
        ('Eragon', 'Alfred A. Knopf'),
        ('A Wise Mans Fear', 'DAW Books'),
        ('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
        ('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
        ('The Giving Tree', 'Harper and Row'),
        ('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
        ('Brave New World', 'Chalto & Windus'),
        ('The Princess Bride', 'Harcourt Brace Jovanovich'),
        ('Fight Club', 'W.W. Norton'),
        ('Holes', 'Scholastic'),
        ('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
        ('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
        ('The Fellowship of the Ring', 'George Allen & Unwin'),
        ('A Game of Thrones', 'Bantam'),
        ('The Lost Tribe', 'Picador USA');

    INSERT INTO tbl_library_branch (library_branch_BranchName, library_branch_BranchAddress) VALUES
        ('Sharpstown','32 Corner Road, New York, NY 10012'),
        ('Central','491 3rd Street, New York, NY 10014'),
        ('Saline','40 State Street, Saline, MI 48176'),
        ('Ann Arbor','101 South University, Ann Arbor, MI 48104');

    INSERT INTO tbl_borrower (borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone) VALUES
        ('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
        ('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
        ('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
        ('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
        ('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
        ('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
        ('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
        ('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
	-- drop table tbl_book_copies;
    INSERT INTO tbl_book_loans (book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate) VALUES
        (1,1,1,'2018-01-01','2018-02-02'),
        (2,1,1,'2018-01-01','2018-02-02'),
        (3,1,1,'2018-01-01','2018-02-02'),
        (4,1,1,'2018-01-01','2018-02-02'),
        (5,1,2,'2018-01-03','2018-02-03'),
        (6,1,2,'2018-01-03','2018-02-03'),
        (7,1,2,'2018-01-03','2018-02-03'),
        (8,1,2,'2018-01-03','2018-02-03'),
        (9,1,2,'2018-01-03','2018-02-03'),
        (10,1,2,'2018-01-03','2018-02-03'),
        (11,2,3,'2018-01-05','2018-02-05'),
        (12,2,3,'2018-01-05','2018-02-05'),
        (13,2,3,'2018-01-05','2018-02-05'),
        (14,2,3,'2018-01-05','2018-02-05'),
        (15,2,3,'2018-01-05','2018-02-05'),
        (16,2,3,'2018-01-05','2018-02-05'),
        (17,2,3,'2018-01-05','2018-02-05'),
        (18,2,4,'2018-01-05','2018-02-05'),
        (19,2,4,'2018-01-05','2018-02-05'),
        (20,2,4,'2018-01-05','2018-02-05'),
        (12,4,6,'2018-01-15','2018-02-15'),
        (11,4,6,'2018-01-15','2018-02-15'),
        (10,4,6,'2018-01-15','2018-02-15'),
        (9,4,6,'2018-01-15','2018-02-15'),
        (8,4,7,'2018-01-15','2018-02-15'),
        (7,4,7,'2018-01-15','2018-02-15'),
        (6,4,7,'2018-01-15','2018-02-15'),
        (5,4,7,'2018-01-15','2018-02-15'),
        (4,4,7,'2018-01-15','2018-02-15'),
        (3,4,7,'2018-01-15','2018-02-15'),
        (2,4,7,'2018-01-15','2018-02-15'),
        (1,4,7,'2018-01-15','2018-02-15');
        

    INSERT INTO tbl_book_copies (book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies) VALUES
        (1,1,10),
        (2,1,5),
        (3,1,4),
        (4,1,2),
        (5,1,2),
        (6,1,3),
        (7,2,3),
        (8,2,4),
        (9,2,5),
        (10,2,6),
        (11,2,7),
        (12,3,8),
        (13,3,9),
        (14,3,10),
        (15,3,2),
        (16,4,3),
        (17,4,4),
        (18,4,5),
        (19,4,1),
        (20,4,2);

    INSERT INTO tbl_book_authors (book_authors_BookID, book_authors_AuthorName) VALUES
        (1,'Patrick Rothfuss'),
        (2,'Stephen King'),
        (3,'Stephen King'),
        (4,'Frank Herbert'),
        (5,'J.R.R. Tolkien'),
        (6,'Christopher Paolini'),
        (7,'Patrick Rothfuss'),
        (8,'J.K. Rowling'),
        (9,'Haruki Murakami'),
        (10,'Shel Silverstein'),
        (11,'Douglas Adams'),
        (12,'Aldous Huxley'),
        (13,'William Goldman'),
        (14,'Chuck Palahniuk'),
        (15,'Louis Sachar'),
        (16,'J.K. Rowling'),
        (17,'J.K. Rowling'),
        (18,'J.R.R. Tolkien'),
        (19,'George R.R. Martin'),
        (20,'Arjun Raja');

-- Show all tables
SHOW TABLES;

-- Show data from each table:

-- Publisher table
SELECT * FROM tbl_publisher;

-- Book table
SELECT * FROM tbl_book;

-- Library branch table
SELECT * FROM tbl_library_branch;

-- Borrower table
SELECT * FROM tbl_borrower;

-- Book loans table
SELECT * FROM tbl_book_loans;

-- Book copies table
SELECT * FROM tbl_book_copies;

-- Book authors table
SELECT * FROM tbl_book_authors;


-- all books and publisher information
SELECT tb.book_BookID,tb.book_Title,tb.book_PublisherName,tp.publisher_PublisherAddress,tp.publisher_PublisherPhone FROM tbl_publisher as tp
join tbl_book as tb
on tp.publisher_PublisherName=tb.book_PublisherName
order by book_BookID;

-- books that was published by a particular person 
SELECT tb.book_BookID,tb.book_Title,tb.book_PublisherName,tp.publisher_PublisherAddress,tp.publisher_PublisherPhone FROM tbl_publisher as tp
join tbl_book as tb
on tp.publisher_PublisherName=tb.book_PublisherName
having tb.book_PublisherName="DAW Books"
order by book_BookID;

-- number of books taken by each person  
select book_loans_CardNo,count(book_loans_BookId) from tbl_book_loans group by book_loans_CardNo;

-- number of people in fee impose list , branch wise
select book_loans_BranchID,count(*) from tbl_book_loans where book_loans_DueDate < current_date() group by book_loans_BranchID;

-- disable safe mode to update the data
set sql_safe_updates=0;

-- updating with the number of copies remainning
UPDATE tbl_book_copies AS bc
JOIN tbl_book_loans AS bl ON bc.book_copies_BookID = bl.book_loans_BookID
SET bc.book_Copies_No_Of_Copies = CASE 
WHEN bc.book_Copies_No_Of_Copies > 0 THEN bc.book_Copies_No_Of_Copies - 1
ELSE 0
END;