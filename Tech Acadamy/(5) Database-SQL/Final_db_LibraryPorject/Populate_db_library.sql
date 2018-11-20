create database db_library
GO;



		
	/******************************************************
	 * Build our database tables and define ther schema
	 ******************************************************/
	CREATE TABLE tbl_branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(50) NOT NULL
	);


	CREATE TABLE tbl_publisher (
		publisher_name VARCHAR(50) PRIMARY KEY NOT NULL, 
		publisher_address VARCHAR(50) NOT NULL,
		publisher_phone VARCHAR(10) NOT NULL
	);

	

	CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_title VARCHAR(50) NOT NULL,
		publisher_name VARCHAR(50) CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) 
	);



	CREATE TABLE tbl_authors (
		book_id int CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_book(book_id),
		author_name VARCHAR(50) NOT NULL,
	);
	

	CREATE TABLE tbl_copies (
		book_id int CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_id),
		branch_id int CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id),
		number_of_copies int NOT NULL
	);


	CREATE TABLE tbl_loan (
		book_id int CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_id),
		branch_id int CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_branch(branch_id),
		card_no int CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_barrowers(card_no),
		date_out date NOT NULL,
		date_due date not null
	);


	CREATE TABLE tbl_barrowers (
		card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		barrower_name VARCHAR(50) NOT NULL,
		barrower_address VARCHAR(50) NOT NULL,
		barrower_phone VARCHAR(10) NOT NULL
	);


	

	/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/
	INSERT INTO tbl_branch
		(branch_name, branch_address)
		VALUES 
		( 'Sharpstown', '1234 Poker St'),
		('Central', '4321 Happy Road'),
		('North', '2222 Carrot Ct'),
		('Break Point', '10 Hang lane')
	;
	SELECT*FROM tbl_branch
	
	INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES 
		('Bannana Book', '5555 Kettle St', 5038661234),
		('Apple Cores Publishing', '45672 Light Eyes Rd', 9078991234),
		('Watermelon Seeds Publishing', '2222 Carrot Ct', 5551236666),
		('Oranges the Fruit Books', '0000 Force Pl', 9991214321)
	;
	
	SELECT*FROM tbl_publisher

	INSERT INTO tbl_authors
		(book_ID, author_name)
		VALUES 
		(1, 'Em Ily'),
		(3, 'Hippie Joe'),
		(6, 'Erk Beans'),
		(8, 'Erk Beans'),
		(5, 'Qui Gon Gin'), 
		(2, 'Sherpa Jim'),
		(20, 'Shella'),
		(7, 'Apple Jack'), 
		(9, 'Apple Jack'), 
		(10, 'Apple Jack'),
		(11, 'Apple Jack'),
		(12, 'Stephen King'),
		(13, 'Stephen King'),
		(14, 'Betty'),
		(15, 'Betty'),
		(16, 'Betty'),
		(17, 'John'),
		(18, 'John'),
		(19, 'Luck'), 
		(21, 'Luck')
		;

		INSERT INTO tbl_barrowers
		(barrower_name, barrower_address, barrower_phone)
		VALUES 
		('Tarzan', '123 Bar St', 503833334),
		('Hippie Joe', '6665 Northern Eyes Rd', 9078691234),
		('Erk Beans', '8383 Run Ct', 5551236666),
		('Qui Gon Gin', '1212 Force Pl', 9900214321), 
		('Sherpa Jim', '11111 Everest Rd', 9071235555),
		('Shella', '5656 Show Rd', 3334562345),
		('Apple Jack', '3333 Boardwalk Pl', 9991214321), 
		('Betty White', '12222 Comedy Rd', 1234349090)
	;


	INSERT INTO tbl_book
		(book_title, publisher_name)
		VALUES 
		('a bird day', 'Bannana Book'),
		('reptilian', 'Bannana Book' ),
		('mammal', 'Bannana Book' ),
		('arthropod','Bannana Book' ),
		('fish','Bannana Book' ),
		('worm', 'Bannana Book'),
		('cnidaria', 'Bannana Book'),
		('echinoderm','Apple Cores Publishing' ), 
		('encino man', 'Apple Cores Publishing'),
		('the market','Apple Cores Publishing' ),
		('the little keyboard', 'Apple Cores Publishing' ), 
		('the best sales pitch','Apple Cores Publishing'),
		('TIME', 'Watermelon Seeds Publishing'),
		('Water Fall', 'Watermelon Seeds Publishing' ),
		('Dragon Fly', 'Watermelon Seeds Publishing' ), 
		('Leper Con','Watermelon Seeds Publishing' ), 
		('4 Ws', 'Oranges the Fruit Books'), 
		('Go go', 'Oranges the Fruit Books'),
		('My hat it has 3 corners', 'Oranges the Fruit Books'),
		('Pendelton Wool','Oranges the Fruit Books' ), 
		('The Lost Tribe', 'Oranges the Fruit Books' )
	;


	SELECT * FROM tbl_book;
	select * FROM tbl_branch
	select * from tbl_barrowers

	INSERT INTO tbl_loan
		(book_ID, branch_id, card_no, date_out, date_due)
		VALUES 
		(1, 1, 1, '2018-04-01', '2018-04-10'),
		(3, 1, 2, '2018-04-01', '2018-04-10'),
		(6, 1, 3, '2018-04-01', '2018-04-10'),
		(8, 1, 4, '2018-01-01', '2018-01-10'),
		(5, 1, 5, '2018-01-01', '2018-01-10'), 
		(2, 2, 6, '2018-01-10', '2018-01-20'),
		(20, 2, 7, '2018-01-10', '2018-01-20'),
		(7, 2, 8, '2018-01-10', '2018-01-20'), 
		(9, 2, 1, '2018-01-10', '2018-01-20'), 
		(10, 2, 2, '2018-01-10', '2018-01-20'),
		(11, 3, 3, '2018-02-02', '2018-02-12'),
		(12, 1, 4, '2018-02-02', '2018-02-12'),
		(13, 1, 5, '2018-03-01', '2018-03-11'),
		(14, 3, 6, '2018-03-02', '2018-03-12'),
		(15, 3, 7, '2018-03-03', '2018-03-13'),
		(16, 3, 8, '2018-03-04', '2018-03-14'),
		(17, 3, 1, '2018-03-05', '2018-03-15'),
		(18, 4, 2, '2018-03-06', '2018-03-16'),
		(19, 4, 3, '2018-03-07', '2018-03-17'), 
		(21, 1, 4, '2018-03-08', '2018-03-18'),
		 (1, 4, 1, '2018-01-01', '2018-01-10'),
		(3, 4, 2, '2018-01-01', '2018-01-10'),
		(6, 4, 3, '2018-01-01', '2018-01-10'),
		(8, 4, 4, '2018-04-01', '2018-04-10'),
		(5, 4, 5, '2018-04-01', '2018-04-10'), 
		(2, 3, 6, '2018-06-10', '2018-06-20'),
		(20, 3, 7, '2018-06-10', '2018-06-20'),
		(7, 3, 8, '2018-06-10', '2018-06-20'), 
		(9, 2, 1, '2018-06-10', '2018-06-20'), 
		(10, 2, 2, '2018-06-10', '2018-06-20'),
		(11, 3, 3, '2018-07-02', '2018-07-12'),
		(12, 2, 1, '2018-07-02', '2018-07-12'),
		(13, 4, 5, '2018-08-01', '2018-08-11'),
		(14, 3, 6, '2018-08-02', '2018-08-12'),
		(15, 4, 7, '2018-08-03', '2018-08-13'),
		(16, 4, 8, '2018-08-04', '2018-08-14'),
		(17, 4, 8, '2018-08-05', '2018-08-15'),
		(18, 4, 7, '2018-08-06', '2018-08-16'),
		(19, 2, 6, '2018-08-07', '2018-08-17'), 
		(21, 4, 5, '2018-08-08', '2018-08-18'),
		(1, 4, 1, '2018-10-01', '2018-10-10'),
		(3, 4, 2, '2018-10-01', '2018-10-10'),
		(6, 4, 3, '2018-10-01', '2018-10-10'),
		(8, 4, 4, '2018-11-01', '2018-11-10'),
		(5, 4, 5, '2018-11-01', '2018-11-10'), 
		(2, 3, 6, '2018-11-10', '2018-11-20'),
		(10, 1, 8, '2018-11-10', '2018-11-20'),
		(11, 2, 1, '2018-11-10', '2018-11-20'),
		(12, 2, 3, '2018-11-10', '2018-11-20'),
		(13, 1, 5, '2018-11-10', '2018-11-20'),
		(14, 2, 6, '2018-11-10', '2018-11-20'), 
		(15, 2, 7, '2018-11-10', '2018-11-20'),
		(13, 1, 3, '2018-11-10', '2018-11-20'),
		(11, 4, 2, '2018-11-10', '2018-11-20')
		;

SELECT * FROM tbl_loan

SELECT book_id, branch_id
FROM tbl_loan
WHERE book_id=21;

INSERT INTO tbl_copies
		(book_ID, branch_id, number_of_copies)
		VALUES 
		(1, 1, 1),
		(1, 4, 2),
		(2, 2, 1),
		(2, 3, 2),
		(3, 1, 1), 
		(3, 4, 2),
		(5, 1, 1),
		(5, 4, 2), 
		(6, 4, 2), 
		(6, 1, 1),
		(7, 2, 1),
		(7, 3, 1),
		(8, 1, 1),
		(8, 4, 2),
		(9, 2, 2),
		(10, 2, 2),
		(10, 1, 1),
		(11, 3, 2),
		(11, 2, 1), 
		(11, 4, 1),
		 (12, 1, 1),
		(12, 2, 2),
		(13, 4, 1),
		(13, 1, 3),
		(14, 3, 2), 
		(14, 2, 1),
		(15, 3, 1),
		(15, 4, 1), 
		(15, 2, 1), 
		(16, 3, 1),
		(16, 4, 1),
		(17, 3, 1),
		(17, 4, 1),
		(18, 4, 2),
		(19, 4, 1),
		(19, 2, 1),
		(20, 2, 1),
		(20, 3, 1),
		(21, 1, 1), 
		(21, 4, 1)
		;
	
	/*****************************************************
	 * The following are queries database and set procedures
	 ******************************************************/


	 /*****************************************************
	 *1.) How many copies of the book titled "The Lost Tribe"
	  are owned by the library branch whose name is "Sharpstown"?
	 ******************************************************/
CREATE PROCEDURE [dbo].[Procedure1_db_library]
AS


SELECT 
 COUNT(distinct tbl_book.book_title) AS num_book,
 COUNT(distinct tbl_branch.branch_name) AS num_items
FROM tbl_loan
INNER JOIN tbl_book ON tbl_book.book_id=tbl_loan.book_ID
INNER JOIN tbl_branch ON tbl_branch.branch_id=tbl_loan.branch_ID
WHERE book_title='The Lost Tribe' AND branch_name='Sharpstown';

SELECT tbl_book.book_title, tbl_branch.branch_name
FROM tbl_loan
INNER JOIN tbl_book ON tbl_book.book_id=tbl_loan.book_ID
INNER JOIN tbl_branch ON tbl_branch.branch_id=tbl_loan.branch_ID
WHERE book_title='The Lost Tribe' AND branch_name='Sharpstown';

EXEC Procedure1_db_library
	 /*****************************************************
	 * .2.) How many copies of the book titled "The Lost Tribe"
	  are owned by each library branch?
	 ******************************************************/
CREATE PROCEDURE [dbo].[Procedure2_db_library]
AS


SELECT tbl_book.book_title, tbl_branch.branch_name, tbl_copies.number_of_copies
FROM tbl_book
INNER JOIN tbl_copies ON tbl_copies.book_id=tbl_book.book_ID
INNER JOIN tbl_branch ON tbl_branch.branch_id=tbl_copies.branch_id
WHERE book_title='The Lost Tribe';

EXEC Procedure2_db_library
	 /*****************************************************
	 * 3.) Retrieve the names of all borrowers who do not have 
	 any books checked out.
	 ******************************************************/
CREATE PROCEDURE [dbo].[Procedure3_db_library]
AS

SELECT tbl_barrowers.barrower_name, COUNT(book_id) AS numberofbooks
FROM tbl_barrowers
INNER JOIN tbl_loan ON tbl_loan.card_no=tbl_barrowers.card_no
GROUP BY barrower_name
HAVING COUNT(book_id) < 1;

exec Procedure3_db_library
	 /*****************************************************
	 * 4.) For each book that is loaned out from the "Sharpstown" 
	 branch and whose DueDate is today, retrieve the book title,
	  the borrower's name, and the borrower's address.
	 ******************************************************/
CREATE PROCEDURE [dbo].[Procedure4_db_library]
AS

SELECT tbl_book.book_title, tbl_barrowers.barrower_phone, tbl_barrowers.barrower_address
FROM tbl_branch
INNER JOIN tbl_loan ON tbl_branch.branch_id=tbl_loan.branch_ID
INNER JOIN tbl_book ON tbl_loan.book_id=tbl_book.book_id
INNER JOIN tbl_barrowers ON tbl_loan.card_no=tbl_barrowers.card_no
WHERE branch_name='Sharpstown' AND date_due='2018-11-20';

exec Procedure4_db_library
	 /*****************************************************
	 * 5.) For each library branch, retrieve the branch name and
	  the total number of books loaned out from that branch.
	 ******************************************************/
	 CREATE PROCEDURE [dbo].[Procedure5_db_library]
AS

SELECT tbl_branch.branch_name, COUNT (tbl_book.book_ID) AS totalbookloaned
FROM tbl_book
INNER JOIN tbl_loan ON tbl_loan.book_id=tbl_book.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id=tbl_loan.branch_id

WHERE date_due >=convert (datetime, '2018-11-20')
GROUP BY branch_name;

exec Procedure5_db_library
	 /*****************************************************
	 * 6.) Retrieve the names, addresses, and the number of
	  books checked out for all borrowers who have more than 
	  five books checked out.
	 ******************************************************/
	 CREATE PROCEDURE [dbo].[Procedure6_db_library]
AS

SELECT tbl_barrowers.barrower_name, tbl_barrowers.barrower_address, tbl_barrowers.barrower_phone, COUNT (tbl_loan.book_ID) AS totalbookloaned
FROM tbl_loan
INNER JOIN tbl_barrowers ON tbl_barrowers.card_no=tbl_loan.card_no
GROUP BY barrower_name,  tbl_barrowers.barrower_address, tbl_barrowers.barrower_phone
HAVING COUNT (tbl_loan.book_id)>5;

exec Procedure6_db_library
	 /*****************************************************
	 *7.) For each book authored (or co-authored) by "Stephen King",
	  retrieve the title and the number of copies owned by the library
	   branch whose name is "Central".
	 ******************************************************/
	 CREATE PROCEDURE [dbo].[Procedure7_db_library]
AS

SELECT tbl_authors.author_name, tbl_branch.branch_name, tbl_book.book_title, tbl_copies.number_of_copies
FROM tbl_authors
INNER JOIN tbl_copies ON tbl_copies.book_id=tbl_authors.book_id
INNER JOIN tbl_book ON tbl_book.book_id=tbl_copies.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id=tbl_copies.branch_ID
WHERE tbl_branch.branch_name='Central' AND tbl_authors.author_name='Stephen King';

exec Procedure7_db_library


