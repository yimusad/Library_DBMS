-- ----------------------------------------------------------
-- File          : INFO210_Team3_LibraryDBMS.sql 
-- Desc          : INFO 210 Final Project 
-- Author(s)     : Peter Gallogly pmg72, Harrison Jones hpj24, Yara Musad yim26, Grace Carson gmc336, Steven Zhao stz25, Elizabeth Lee esl56
-- Create Date   : Sept 01, 2022 
-- Modifications :  n/a


--DROP EXISTING TABLES WITH SAME NAME
DROP TABLE Written_By;
DROP TABLE Books;
DROP TABLE Fines_Recieve;
DROP TABLE Orders_Place;
DROP TABLE Student_Borrowers;
DROP TABLE Locations;
DROP TABLE Authors;


--CREATE TABLES IN CORRECT ORDER

CREATE TABLE Authors(
auth_first varchar(64),
auth_last varchar(64),
PRIMARY KEY (auth_first, auth_last)
);

CREATE TABLE Locations (
class_num number,
subclass_num number,
PRIMARY KEY (class_num, subclass_num)
);

CREATE TABLE Student_Borrowers (
std_id number PRIMARY KEY,
std_first varchar(128),
std_last varchar(128),
num_borrowed number,
CONSTRAINT Check_Quantity CHECK (num_borrowed <= 10)
);

CREATE TABLE Orders_Place (
order_id number PRIMARY KEY,
order_date date,
expiry_date date,
s_id number UNIQUE NOT NULL,
FOREIGN KEY (s_id) REFERENCES Student_Borrowers(std_id) ON DELETE CASCADE
);

CREATE TABLE Fines_Recieve (
fine_id number PRIMARY KEY,
fstd_id number NOT NULL,
book_price number,
days_overdue number,
damage char(1),
amount_billed number,
CHECK (damage in ('N', 'Y')), 
FOREIGN KEY (fstd_id) REFERENCES Student_Borrowers(std_id)
);


CREATE TABLE Books(
isbn varchar(13) PRIMARY KEY,
book_title varchar(128) NOT NULL,
book_price number NOT NULL,
status varchar(64) NOT NULL,
o_id number,
c_num number NOT NULL,
sub_num number NOT NULL,
s_id number,
FOREIGN KEY (o_id) REFERENCES Orders_place(order_id),
CONSTRAINT location_notnull FOREIGN KEY (c_num, sub_num) REFERENCES Locations(class_num, subclass_num),
FOREIGN KEY (s_id) REFERENCES Student_Borrowers(std_id)
);

CREATE TABLE Written_By(
a_first varchar(64),
a_last varchar(64),
b_isbn varchar(17),
PRIMARY KEY (a_first, a_last, b_isbn),
FOREIGN KEY (a_first, a_last) REFERENCES Authors(auth_first, auth_last),
FOREIGN KEY (b_isbn) REFERENCES Books(isbn)
);


--POPULATE TABLES 

--Insert into Authors (12)
INSERT INTO Authors(auth_first, auth_last)
VALUES('Charles', 'Mann');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Helene', 'Hanff');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Bill', 'Bryson');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Katherine', 'Boo');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Candice', 'Millard');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Christopher', 'Paloni');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Novella', 'Carpenter');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Buzz', 'Bissinger');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Patti', 'Smith');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Farley', 'Mowat');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Susan', 'Cain');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Mary', 'Roach');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Charles', 'Duhigg');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Simon', 'Winchester');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Alice', 'Ozma');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Jonathan', 'Haidt');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Daniel', 'Kahneman');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Jon', 'Krakauer');

INSERT INTO Authors(auth_first, auth_last)
VALUES('David', 'Sedaris');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Suzanne', 'Collins');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Laura', 'Hillenbrand');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Erik', 'Larson');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Brian', 'Greene');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Rick', 'Atkinson');

INSERT INTO Authors(auth_first, auth_last)
VALUES('James', 'Gleick');

INSERT INTO Authors(auth_first, auth_last)
VALUES('Michael', 'Polla');


--Insert into Locations
INSERT INTO Locations(class_num, subclass_num)
VALUES(9, 70);

INSERT INTO Locations(class_num, subclass_num)
VALUES(8, 16);

INSERT INTO Locations(class_num, subclass_num)
VALUES(5, 00);

INSERT INTO Locations(class_num, subclass_num)
VALUES(3, 05);

INSERT INTO Locations(class_num, subclass_num)
VALUES(9, 73);

INSERT INTO Locations(class_num, subclass_num)
VALUES(8, 13);

INSERT INTO Locations(class_num, subclass_num)
VALUES(6, 30);

INSERT INTO Locations(class_num, subclass_num)
VALUES(7, 96);

INSERT INTO Locations(class_num, subclass_num)
VALUES(7, 82);

INSERT INTO Locations(class_num, subclass_num)
VALUES(5, 99);

INSERT INTO Locations(class_num, subclass_num)
VALUES(1, 55);

INSERT INTO Locations(class_num, subclass_num)
VALUES(6, 11);

INSERT INTO Locations(class_num, subclass_num)
VALUES(1, 58);

INSERT INTO Locations(class_num, subclass_num)
VALUES(4, 23);

INSERT INTO Locations(class_num, subclass_num)
VALUES(0, 28);

INSERT INTO Locations(class_num, subclass_num)
VALUES(2, 01);

INSERT INTO Locations(class_num, subclass_num)
VALUES(1, 53);

INSERT INTO Locations(class_num, subclass_num)
VALUES(2, 89);

INSERT INTO Locations(class_num, subclass_num)
VALUES(8, 14);

INSERT INTO Locations(class_num, subclass_num)
VALUES(9, 40);

INSERT INTO Locations(class_num, subclass_num)
VALUES(3, 64);

INSERT INTO Locations(class_num, subclass_num)
VALUES(5, 23);

INSERT INTO Locations(class_num, subclass_num)
VALUES(0, 20);

INSERT INTO Locations(class_num, subclass_num)
VALUES(3, 94);



--Insert into Student_Borrowers
INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(12345, 'Greg', 'Heffley', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(32456, 'John', 'Smith', 3);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(45634, 'Lauren', 'Cohen', 2);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(64956, 'Daniel', 'Klein', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(57485, 'Pete', 'Jenning', 2);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(25136, 'Hayley', 'Williams', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(19034, 'Wendy', 'Scott', 3);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(74535, 'Emil', 'Sigh', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(90324, 'Ash', 'Foster', 2);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(21345, 'Aron', 'Tong', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(58397, 'Ross', 'Mcalister', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(25634, 'Brian', 'Larson', 2);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(68406, 'Jake', 'Green', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(87463, 'Tim', 'Chapel', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(92658, 'Jimothy', 'James', 1);

INSERT INTO Student_Borrowers(std_id, std_first, std_last, num_borrowed)
VALUES(71732, 'Greg', 'Oden', 2);


--Insert into Order_Place
INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(432532, '02-FEB-2022', '23-FEB-2022', 12345);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(547635, '08-MAR-2022', '29-MAR-2022', 32456);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(557843, '21-JUN-2022', '12-JUL-2022', 45634);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(673842, '01-JAN-2022', '09-FEB-2022', 64956);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(764535, '04-MAR-2022', '25-MAR-2022', 57485);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(132456, '12-MAR-2022', '02-APR-2022', 25136);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(673435, '17-JAN-2022', '07-FEB-2022', 19034);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(896744, '02-MAY-2022', '23-MAY-2022', 74535);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(568363, '01-FEB-2022', '22-FEB-2022', 90324);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(637345, '23-APR-2022', '14-MAY-2022', 21345);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(546735, '13-JUN-2022', '4-JULY-2022', 58397);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(357134, '10-MAY-2022', '31-MAY-2022', 25634);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(312515, '25-MAR-2022', '14-APR-2022', 68406);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(768452, '1-JAN-2022', '22-JAN-2022', 87463);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(482641, '09-MAR-2022', '30-MAR-2022', 92658);

INSERT INTO Orders_Place(order_id, order_date, expiry_date, s_id)
VALUES(555444, '03-MAR-2022', '24-MAR-2022', 71732);


--Insert info Fines_Receive
INSERT INTO Fines_Recieve(fine_id, fstd_id, book_price, days_overdue, damage, amount_billed)
VALUES(4738579, 12345, 13.49, 3, 'N', 2.02);

INSERT INTO Fines_Recieve(fine_id, fstd_id, book_price, days_overdue, damage, amount_billed)
VALUES(5869305, 32456, 14.69, 0, 'Y', 16.16);

INSERT INTO Fines_Recieve(fine_id, fstd_id, book_price, days_overdue, damage, amount_billed)
VALUES(6758495, 45634, 10.49, 4, 'N', 0.00);

INSERT INTO Fines_Recieve(fine_id, fstd_id, book_price, days_overdue, damage, amount_billed)
VALUES(5624123, 57485, 12.39, 0, 'N', 0.00);

INSERT INTO Fines_Recieve(fine_id, fstd_id, book_price, days_overdue, damage, amount_billed)
VALUES(3617230, 74535, 13.12, 3, 'Y', 14.43);

INSERT INTO Fines_Recieve(fine_id, fstd_id, book_price, days_overdue, damage, amount_billed)
VALUES(9172323, 57485, 20.49, 2, 'N', 2.05);


--Insert into Books
INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9781400032051', '1491: New Revelations of the Americas Before Columbus', 16.34, 'in', NULL, 9, 70, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780380001224', '84, Charing Cross Road', 13.49, 'in', NULL, 8, 16, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780241451939', 'A Short History of Nearly Everything', 20.49, 'in', NULL, 5, 00, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780812979329', 'Behind the Beautiful Forevers: Life, Death, and Hope in a Mumbai Undercity', 10.44, 'out', 555444, 3, 05, 71732);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780385526265', 'Destiny of the Republic: A Tale of Madness, Medicine, and the Murder of a President', 18.99, 'out', 555444, 9, 73, 71732);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780552554565', 'Eragon', 14.69, 'in', NULL, 8, 13, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780385611749', 'Eragon: Eldest', 15.70, 'in', NULL, 8, 13, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780143117285', 'Farm City: The Education of an Urban Farmer', 4.97, 'in', NULL, 6, 30, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780060974060', 'Friday Night Lights: A Town, A Team, and A Dream', 19.47, 'out', 547635, 7, 96, 32456);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780062873743', 'Just Kids', 8.88, 'in', NULL, 7, 82, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9787559841315', 'Never Cry Wolf', 10.49, 'in', NULL, 5, 99, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780307352156', 'Quiet: The Power of Introverts in a World that Cant Stop Talking', 18.47, 'out', 764535, 1, 55, 57485);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780393881721', 'Stiff: The Curious Lives of Human Cadavers', 13.89, 'in', NULL, 6, 11, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9781955423397', 'The Power of Habit', 13.12, 'out', 132456, 1, 58, 25136);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780060839789', 'The Professor and the Madman: A Tale of Murder, Insanity, and the Making of the Oxford English Dictionary', 11.49, 'in', NULL, 4, 23, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780446583787', 'The Reading Promise: My Father and the Books we Shared', 7.82, 'in', NULL, 0, 28, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780307455772', 'The Righeous Mind: Why Good People are Divided by Politics and Religion', 20.49, 'out', 637345, 2, 01, 21345);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9798809159685', 'Thinking, Fast and Slow', 11.29, 'in', NULL, 1, 53, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780965778404', 'Under the Banner of Heaven: A Story of Violent Faith', 9.60, 'in', NULL, 2, 89, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780316143479', 'When you are Engulfed in Flames', 21.76, 'in', NULL, 8, 14, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780439023481', 'The Hunger Games', 8.98, 'out', 768452, 8, 13, 87463);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780439023498', 'Catching Fire', 4.86, 'in', NULL, 8, 13, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780545663267', 'Mocking Jay', 4.87, 'in', NULL, 8, 13, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9781338635171', 'The Ballad of Songbirds and Snakes', 9.15, 'out', 312515, 8, 13, 68406);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780385742528', 'Unbroken', 5.62, 'out', 546735, 9, 40, 58397);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780739323595', 'The Devil in the White City: Murder, Magic, and Madness at the Fair That Changed America', 9.50, 'in', NULL, 3, 64, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780375727207', 'The Fabric of the Cosmos: Space, Time, and the Texture of Reality', 7.69, 'out', 482641, 5, 23, 92658);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780594871118', 'The Guns at Last Light: The War in Western Europe, 1944-1945', 8.00, 'in', NULL, 9, 40, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9781400096237', 'The Information: A History, A Theory, A Flood', 12.39, 'in', NULL, 0, 20, NULL);

INSERT INTO Books(isbn, book_title, book_price, status, o_id, c_num, sub_num, s_id)
VALUES('9780143038580', 'The Omnivore’s Dilemma: A Natural History of Four Meals', 13.88, 'in', NULL, 3, 94, NULL);



--Insert into Written_By
INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Charles', 'Mann', '9781400032051');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Helene', 'Hanff', '9780380001224');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Bill', 'Bryson', '9780241451939');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Katherine', 'Boo', '9780143117285');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Candice', 'Miller', '9780385526265');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Christoper', 'Paloni', '9780552554565');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Christoper', 'Paloni', '9780385611749');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Novella', 'Carpenter', '9780812979329');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Buzz', 'Bissinger', '9780060974060');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Patti', 'Smith', '9780062873743');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Farley', 'Mowat', '9787559841315');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Susan', 'Cain', '9780307352156');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Mary', 'Roach', '9780393881721');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Charles', 'Duhigg', '9781955423397');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Simon', 'Winchester', '9780060839789');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Alice', 'Ozma', '9780446583787');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Jonathan', 'Haidt', '9780307455772');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Daniel', 'Kahneman', '9798809159685');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Jon', 'Krakauer', '9780965778404');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('David', 'Sedaris', '9780316143479');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Suzanne', 'Collins', '9780439023481');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Suzanne', 'Collins', '9780439023498');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Suzanne', 'Collins', '9780545663267');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Suzanne', 'Collins', '9781338635171');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Laura', 'Hillenbrand', '9780385742528');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Erik', 'Larson', '9780739323595');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Brian', 'Greene', '9780375727207');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Rick', 'Atkinson', '9780594871118');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('James', 'Gleick', '9781400096237');

INSERT INTO Written_By(a_first, a_last, b_isbn)
VALUES('Michael', 'Polla', '9780143038580');


-- COMMIT THE PREFORMED CHANGE/CREATION OF TABLES
COMMIT;

--DISPLAY SETTINGS
SET pagesize 1000;    
SET linesize 500;    


--TABLE FORMATTING

--Format Authors
COL auth_first FORMAT A15;
COL auth_last FORMAT A15;

--Format Student_Borrowers
COL std_id FORMAT 999999;
COL std_first FORMAT A10;   
COL std_last FORMAT A10; 

--Format Orders_Place
COL order_id FORMAT 999999;
COL order_date FORMAT A10;
COL expiry_date FORMAT A11;
COL s_id FORMAT 999999;

--Format Fines_Receive
COL fine_id FORMAT 9999999;
COL fstd_id FORMAT 99999;
COL book_price FORMAT 99.99;
COL damage FORMAT A6;
COL amount_billed FORMAT 99.99;

--Format Books
COL isbn FORMAT A13;
COL book_title FORMAT A55;
COL book_price FORMAT 99.99;
COL status FORMAT A6;
COL o_id FORMAT 999999;
COL c_num FORMAT 999;
COL sub_num FORMAT 999;
COL s_id FORMAT 999999;

--Format Written_By
COL a_first FORMAT A15;
COL a_last FORMAT A15;
COL isbn FORMAT A13;

--DISPLAY TABLES
SELECT * FROM Authors;
SELECT * FROM Locations;
SELECT * FROM Student_Borrowers;
SELECT * FROM Orders_Place;
SELECT * FROM Fines_Recieve;
SELECT * FROM Books;
SELECT * FROM Written_By;


--MODIFY TUPLE

--Updating multiple attribute of a tuple of a book that has been borrowed by a student.
UPDATE Books
SET Books.status='out', Books.s_id='74535', Books.o_id='896744'
WHERE ISBN = 9780143117285;

--Staff of the library keep mispronouncing a a student's name incorrectly and they come to realize that it is due to their name being spelled 
--incorrectly in the database. Therefore, we must correct the tuple from 'Tim Chapel' to 'Tim Chapelle' so that their name is spelled correctly 
--in the database; given, that his std_id is 87463
UPDATE Student_Borrowers 
SET std_last = 'Chapelle'
WHERE std_id = 87463;

--Display the change
SELECT * FROM Student_Borrowers;


--MODIFY CONSTRAINT
--After realizing that all current records show students borrowing only a few books, the university agreed to change the maximum number of books 
--allowed to be checked out from 10 to 5, because it might be more appropriate given the situation and current size of the library
ALTER TABLE Student_Borrowers DROP CONSTRAINT Check_Quantity;
ALTER TABLE Student_Borrowers ADD CONSTRAINT Check_Quantity CHECK (num_borrowed <= 5);


--DELETE TUPLE
--A librarian discovered they accidentally fined a student for an overdue book, but it turns out that student actually returned it well before the
--order expiry date and the book had just been misplaced by staff. Delete the fine with fine_id number 5624123;
DELETE FROM Fines_Recieve
WHERE fine_id = 5624123;


--ALTER SCHEMA
--The librarians realized that some books in the database have extraordinarily long titles. All the titles of the current books in the database 
--fit within the domain expressed in the original CREATE TABLE statement, however, the librarians believe it would be best if the domain 
--was changed to allow up to 200 characters for the book title to accomodate any new books with long titles that enter the database in the future.
ALTER TABLE Books MODIFY book_title varchar(200);

--Show changes to schema
DESC Books;


--**** THESE sections BELOW take place in the future, so they MUST be commented out in order for the queries to the current database to work: ****

--(1) ALTER TABLE NAME
--(2) RENAME COLUMNS
--(3) DROP COLUMNS AND DROP TABLE


--ALTER TABLE NAME
--Since students are the only borrowers and there is no option to buy books, it is not necessary to have the column be named Student_Borrowers. 
--Because of this, the university librarians would like the table to be renamed from Student_Borrowers to Students.
--First, make sure there is no other table named Students already
-- DROP TABLE Students;
-- ALTER TABLE Student_Borrowers RENAME TO Students;

--Show that the name of the table has been updated
-- SELECT * FROM TAB;


--RENAME COLUMNS
--Additionally the library staff is confusing the class_number with the sub_class number, so they university would like the class_num column to 
--be renamed mainclass_num to and also change c_num to main_num in books table to be consistent with this change accross the database
-- ALTER TABLE Locations 
-- RENAME COLUMN class_num TO mainclass_num;
-- ALTER TABLE Books
-- RENAME COLUMN c_num TO main_num;

--Display the changes
-- SELECT * FROM Locations;
-- SELECT * FROM Books;


--DROP COLUMNS AND DROP TABLE
--Seven years from now, the library has grown so much in terms of inventory and popularity that the university has decided to liquidate
--the physical library and convert to allowing students to borrow books 100% digitally. Therefore, we can remove the Locations table
--and remove the main_num and sub_num columns from the Book's table representing the physical location in which they are stored.
--First we must drop the foreign key constraint referencing the Locations table in the Books table
-- ALTER TABLE Books DROP CONSTRAINT location_notnull;
-- DROP TABLE Locations;
-- ALTER TABLE Books DROP COLUMN main_num;
-- ALTER TABLE Books DROP COLUMN sub_num;

-- --Display changes to Books table
-- DESC Books;
-- --Show that Locations table no longer exists
-- SELECT * FROM TAB;



--QUERIES 9-15

--Q1: List full names of all Student Borrowers.
SELECT std_first, std_last 
FROM  Student_Borrowers; 

--Q2: List full names of Students and the books they borrowed.
SELECT Student_Borrowers.std_first, Student_Borrowers.std_last, Books.book_title
FROM Student_Borrowers, Books
WHERE Books.s_id=Student_borrowers.std_id;

--Q3: List the names of books and who borrowed them that have been borrowed by students in which the books are worth more than $10
SELECT Books.book_title, Student_Borrowers.std_first, Student_Borrowers.std_last, Books.book_price
FROM Books, Student_Borrowers
WHERE Books.s_id=Student_Borrowers.std_id
AND Books.book_price>10;

--Q4: List the average price of books borrowed by students with first name Greg.
SELECT AVG(Books.book_price)
FROM Books, Student_Borrowers
WHERE Books.s_id=Student_Borrowers.std_id
AND Student_borrowers.std_first='Greg';

--Q5: List all book names and prices by price ascending with a tiebreaker of ISBN
SELECT book_title, book_price
FROM Books
ORDER BY book_price desc, ISBN;

--Q6: List all book names and prices by price ascending with a tiebreaker of ISBN of books that have been borrowed by students who have borrowed more than 1 book
SELECT Books.book_title, Books.book_price
FROM Books, Student_Borrowers
WHERE Books.s_id=Student_Borrowers.std_id
AND Student_Borrowers.num_borrowed>1
ORDER BY book_price desc, ISBN;

--Q7: List book titles of books that have been borrowed by students who have a damage fine, sorted descending by that books ISBN
SELECT Books.book_title
FROM Books, Fines_Recieve, Student_Borrowers
WHERE Books.s_id=Student_Borrowers.std_id
AND Fines_Recieve.fstd_id = Student_Borrowers.std_id
AND Fines_Recieve.damage='Y'
ORDER BY ISBN desc;

--Q8: List IDs of fines and student names of students who have fines
SELECT Fines_Recieve.fine_id, Student_Borrowers.std_first, Student_Borrowers.std_last
FROM Fines_Recieve, Student_Borrowers
WHERE Fines_Recieve.fstd_id = Student_Borrowers.std_id;

--Q9: List average price and the Author name of books written by Authors whose first name starts with an S grouped by that books main class number
SELECT AVG(Books.book_price), Written_by.a_first, Written_by.a_last, c_num
FROM Books, Written_by
WHERE Books.ISBN=Written_by.b_isbn
AND Written_by.a_first LIKE 'S%'
GROUP BY c_num, Written_by.a_first, Written_by.a_last;

--Q10: List the maximum price of books written by Suzanne Collins
SELECT MAX(book_price)
FROM Books, Written_by
WHERE Books.ISBN = Written_by.b_isbn
AND Written_by.a_first='Suzanne';

--Q11: List all books and their main and sub class that are written by Suzanne Collins OR books that are in main class 3, ordered by price descending
SELECT book_title, c_num, sub_num, book_price
FROM Books, Written_by
WHERE Books.isbn=Written_by.b_isbn
AND Written_by.a_first='Suzanne'
UNION
SELECT book_title, c_num, sub_num, book_price
FROM Books
WHERE Books.c_num=3
ORDER BY book_price desc;

--Q12: List the Order ID, Student ID, and name of Book borrowed
SELECT order_id, Orders_Place.s_id, book_title
FROM Books, Orders_Place, Student_borrowers
WHERE Books.s_id=Student_borrowers.std_id
AND Books.o_id=Orders_Place.order_id;

--Q13: List the order dates and fines of students 
SELECT std_first, std_last, order_date, expiry_date, amount_billed
FROM Orders_Place, Fines_Recieve, Student_Borrowers
WHERE Student_Borrowers.std_id = Orders_Place.s_id
AND Student_Borrowers.std_id = Fines_Recieve.fstd_id;
