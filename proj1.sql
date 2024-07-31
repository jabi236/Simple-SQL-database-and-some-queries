/*===================================================================

20 points: Deliverable 1)
Place all your your group members names and email contacts in your assignment.
Note in your submission if you did this Deliverable by Deliverable or read the complete assignment prior to starting. 


-----

Your database will be used to perform various searches on mailing addresses of both businesses and consumers. It will contain some information from receipts. 


Such address searches will need to be able to search by city, state, zip code, the entity name, and street address.
Receipt searches will need to correlate the receipt to the business, the consumer, and some data about the transaction.

Some notes on names - 
https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/Links to an external site.


Create your database. Create address table(s) in your database with fields for a US street addresses for use in generating physical delivery address lists. Use this information to influence your database table design. 
Create table(s) in your database for the receipts. Your receipt table will have a 'blob 'type as one of the fields along with whatever other fields you determine are needed. 

I leave the design choices completely up to your team. We have had a few discussions in class about the interesting (as in a curse) nature of addresses in the US. It will prove a useful tool for learning databases here. 

Specifically those database tables would have fields that would accept and allow selection against any of the mentioned fields in the example addresses provided below. I will provide some hints below to some of the some fields you should have but maybe not all of them - this is your team's database design project. A huge part of any database's success is in the design phase.



USPS provides this reference for a standardized addresses. You may choose if you want to use extended zip code format or the simple 5 number one.
https://pe.usps.com/text/pub28/28c2_001.htm#ep526236

Some hints:
Mapping of state names to standard postal abbreviations in the address fields is again a design choice you will have to make. 
You will need to decide if you want to assign a unique key to each entity represented.
You will want to think carefully about the design, good choices in the database table design can make the queries easy.  

 (Links to an external site.)

Here are some starting addresses to consider for your database.

----

Mr. Ray L. Hyatt Jr.

300 Rose Street Room 102 Hardymon Building

Lexington, Kentucky 40506

----

Mr. Ray L. Hyatt Jr.

301 Hilltop Avenue, Room 102

Lexington, Ky 40506

---

John Wick

82 Beaver St Room 1301 

New York, New York 10005

----

Tony Stark

200 Park Avenue Penthouse

New York, New York 10001

-----

Dr. Stephen Strange

117A Bleecker Street

New York, New York 10001

-----

Bob C. Smith

200 Park Avenue Apartment 221

New York, NY 10001

-----

Bowman F. Wildcat

#1 Avenue of Champions

Lexington, Ky 40506

-----

Bob C. Smith

200 Park Avenue 

Lexington, KY 40507

-----

Bob Porter c/o Intech 

1 Dead End Row Room 200

Dallas, TX 12347
-----

Mr. Bob Sydell c/o Intech

1 Dead End Row Room 200

Dallas, TX 12347

-------------------------------------

Add the above addresses to your database, you may need to parse and normalize naming to comply with your data base table design. 


Add 30 more addresses of your choice to the data base. Best if you have a mix of primarily business and some consumer addresses.
Note businesses can be consumers, and consumers can be businesses in the gig economy (ebay, amazon marketplace, etc.) -- this will heavily weigh on your design.
Use any legitimate source of publicly available addresses - phone directories used to be a useful source, restaurant advertisements are a great source, ideally pick no more than 2 additional cities that those listed in the provided to keep your complexity manageable at this stage. These must be real addresses. 


Receipts
These are all over the place in formats, if you thought the US addresses where a mess. 
What you should look for on them - Location, Business Name, Date, Total sale, Number of items sold. Assume the blob field is a scan/photo of the receipt, but we are not going to populate it here. The business on the receipt should be in your address table. 

Add 15 receipts to your database. They should correspond to transactions between entities in your business & consumer address tables and include the information suggested above. 

You can use receipts your team members have made from purchases, or any valid receipt source. If you are not comfortable with personal information (and you shouldn't be - I will explain more as the class progresses), feel free to substitute fake names to anonymize.  You may "make up" up to 5 receipts to fill in gaps in your database representing fake transactions between consumers and businesses in your database. 

Work items to turn in for this section: 
*/
 CREATE DATABASE cs405team008;
 GO
 USE cs405team008;
 GO
/*
20 points: Deliverable 2)  Show the commands you used to build your table(s). 
You can copy and paste them into your submission document.
DO NOT use screen grabs or other image clipping for these submissions, they produce hard to read documents. Hard to read documents = easy to award 0 points submissions. 
Instead grab as text, paste as text into your document. Use a fixed space font for this like courier. I will demo this in class. 
*/
 /*number?, name(surname, first name, middle intial, last name, suffix), address(street add, state, zip)*/
 CREATE TABLE addresses(
 cust_id INT,
 prefix VARCHAR(16),
 firstName VARCHAR(64),
 middleInitial VARCHAR(2),
 lastName VARCHAR(64),
 suffix VARCHAR(16),
 streetAddress VARCHAR(255),
 city VARCHAR(64),
 state CHAR(2),
 zipcode INT,
 PRIMARY KEY (cust_id)
 );
 GO
 /*number, location, Businame, Date, totalSale, numItems*/
 CREATE TABLE reciepts(
 recip_id INT,
 cust_name VARCHAR(255),
 bus_name VARCHAR(255),
 streetAddress VARCHAR(255),
 city VARCHAR(64),
 state CHAR(2),
 zipcode INT,
 saleDate DATE DEFAULT GETDATE(),
 saleTotal DECIMAL(9,2),
 totalItems INT,
 PRIMARY KEY(recip_id)
 );
 GO
/*
20 points: Deliverable 3)  Show two of the commands you used to load data into your table(s), one of your choice, one for John Wick's address and place that in your submission. Follow the same copy paste conventions as described in Deliverable 2.
Show two of the commands you used to load the receipt data into your table(s). 
*/
INSERT INTO addresses (cust_id, prefix, firstName, middleInitial, lastName, suffix, streetAddress, city, state, zipcode)
VALUES
(1, 'Mr.', 'Ray', 'L.', 'Hyatt', 'Jr.', '300 Rose Street Room 102 Hardymon Building', 'Lexington', 'KY', 40506),
(2, 'Mr.', 'Ray', 'L.', 'Hyatt', 'Jr.', '301 Hilltop Avenue, Room 102', 'Lexington', 'KY', 40506),
(3, NULL, 'John', NULL, 'Wick', NULL, '82 Beaver St Room 1301', 'New York', 'NY', 10005),
(4, NULL, 'Tony', NULL, 'Stark', NULL, '200 Park Avenue Penthouse', 'New York', 'NY', 10001),
(5, 'Dr.', 'Stephen', NULL, 'Strange', NULL, '117A Bleecker Street', 'New York', 'NY', 10001),
(6, NULL, 'Bob', 'C.', 'Smith', NULL, '200 Park Avenue Apartment 221', 'New York', 'NY', 10001),
(7, NULL, 'Bowman', 'F.', 'Wildcat', NULL, '#1 Avenue of Champions', 'Lexington', 'KY', 40506),
(8, NULL, 'Bob', 'C.', 'Smith', NULL, '200 Park Avenue', 'Lexington', 'KY', 40507),
(9, NULL, 'Bob', NULL, 'Porter', 'c/o Intech', '1 Dead End Row Room 200', 'Dallas', 'TX', 12347),
(10, 'Mr.', 'Bob', NULL, 'Sydell', 'c/o Intech', '1 Dead End Row Room 200', 'Dallas', 'TX', 12347),
(11, NULL, 'Brian', 'A', 'Scott', NULL, '175 Malabu Dr', 'Lexington', 'KY',40503),
(12, NULL, 'Billy', 'R', 'Healan', NULL, '3549 Indian Summer Trl', 'Lexington', 'KY', 40509),
(13, 'Mrs.', 'Jill', 'C', 'Johnson', NULL, '183 Eastover Dr', 'Lexington', 'KY', 40502),
(14, NULL, 'Bobby', 'J', 'Duncan', NULL, '1119 Tatesbrook Dr', 'Lexington', 'KY', 40517),
(15, NULL, 'Ronald', 'A', 'Smith', NULL, '170 NW 24th Ct', 'Pompano Beach', 'FL', 33064),
(16, NULL, 'John', NULL, 'Calipari', NULL, '1732 Richmond Rd', 'Lexington', 'KY', 40502),
(17, NULL, 'Kristina', NULL, 'Love', NULL, '306 Green St', 'Brandenburg', 'KY', 40108),
(18, 'Mr.', 'Philip', 'A', 'Spencer', NULL, '347 Retrac Rd', 'Lexington', 'KY', 40503),
(19, NULL, 'Jacob', 'M', 'Long', NULL, '684 Halifax Dr', 'Lexington', 'KY', 40503),
(20, NULL, NULL, NULL, 'Kroger', NULL, '705 Euclid Ave', 'Lexington', 'KY', 40502),
(21, NULL, NULL, NULL, 'Speedway', NULL, '819 South Limestone', 'Lexington', 'KY', 40508),
(22, NULL, NULL, NULL, 'Wendys', NULL, '2575 Nicholasville Rd', 'Lexington', 'KY', 40503),
(23, NULL, NULL, NULL, 'Hibachi Express', NULL, '565 South Limestone', 'Lexington', 'KY', 40508),
(24, NULL, NULL, NULL, 'Gulf', NULL, '405 Waller Ave', 'Lexington', 'KY', 40504),
(25, NULL, NULL, NULL, 'Shell', NULL, '905 South Limestone', 'Lexington', 'KY', 40503),
(26, NULL, NULL, NULL, 'Skyline', NULL, '2850 Richmond Rd', 'Lexington', 'KY', 40509),
(27, NULL, NULL, NULL, 'Dicks Sporting Goods', NULL, '3645 Nicholasville Rd', 'Lexington', 'KY', 40503),
(28, NULL, 'Harold', 'L', 'Jones', NULL, '3310 Tates Creek Apt 417', 'Lexington', 'KY', 40502),
(29, NULL, NULL, NULL, 'Chick-Fil-A', NULL, '2299 Richmond Rd', 'Lexington', 'KY', 40502),
(30, NULL, NULL, NULL, 'Thortons', NULL, '802 North Broadway', 'Lexington', 'KY', 40508),
(31, NULL, NULL, NULL, 'Target', NULL, '131 W Reynolds Rd', 'Lexington', 'KY', 40503),
(32, NULL, NULL, NULL, 'Papa Johns', NULL, '265A Avenue of Champions', 'Lexington', 'KY', 40508),
(33, NULL, 'James', NULL, 'Taylor', NULL, '481 Shropshire Ave', 'Lexington', 'KY', 40508),
(34, NULL, 'Brandon', 'J', 'McDonald', NULL, '1228 Devonport Dr', 'Lexington', 'KY', 40504),
(35, NULL, 'Joseph', 'W', 'Savage', NULL, '10350 Giverny Blvd', 'Cincinatti', 'OH', 45241),
(36, NULL, 'Trey', NULL, 'Wright', NULL, '2216 W Ormsby Ave', 'Louisville', 'KY', 40210),
(37, NULL, 'Grant', 'L', 'Gray', NULL, '1619 Bypass Rd #237', 'Winchester', 'KY', 40391),
(38, NULL, 'Chris', 'W', 'White', NULL, '2316 Old Hickory Ln', 'Lexington', 'KY', 40515),
(39, NULL, 'Nicolas', 'A', 'Leet', NULL, '5529 Noland Rd', 'Shawnee', 'KS', 66216),
(40, NULL, 'Chris', 'M', 'Smith', NULL, '626 Portland Dr.', 'Lexington', 'KY', 40503);
GO
INSERT INTO reciepts (recip_id, cust_name, bus_name, streetAddress, city, state, zipcode, saleDate, saleTotal, totalItems)
VALUES
(1, 'Jacob Long', 'Kroger', '705 Euclid Ave', 'Lexington', 'KY', 40502, '2023-02-18', 59.06, 12),
(2, 'Chris Smith', 'Speedway', '819 South Limestone', 'Lexington', 'KY', 40508, '2023-02-13', 12.71, 1),
(3, 'Nicolas Leet', 'Wendys', '2575 Nicholasville Rd', 'Lexington', 'KY', 40503, '20230213', 6.2, 1),
(4, 'Chris White', 'Hibachi Express', '565 South Limestone', 'Lexington', 'KY', 40508, '2023-02-03', 8.43, 1),
(5, 'Grant Gray', 'Gulf', '405 Waller Ave', 'Lexington', 'KY', 40504, '2023-02-13', 4.78, 1),
(6, 'Trey Wright', 'Shell', '905 South Limestone', 'Lexington', 'KY', 40503, '2023-01-03', 25.41, 4),
(7, 'Joseph Savage', 'Skyline', '2850 Richmond Rd', 'Lexington', 'KY', 40509, '2022-12-18', 10.08, 1),
(8, 'Brandon McDonald', 'Dicks Sporting Goods', '3645 Nicholasville Rd', 'Lexington', 'KY', 40503, '2023-02-18', 192.63, 3),
(9, 'James Taylor', 'Kroger', '705 Euclid Ave', 'Lexington', 'KY', 40502, '2023-02-18', 33.53, 7),
(10, 'Harold Jones', 'Kroger', '705 Euclid Ave', 'Lexington', 'KY', 40502, '2023-02-15', 99.29, 22),
(11, 'Philip Spencer', 'Chick-fil-a', '2299 Richmond Rd', 'Lexington', 'KY', 40502, '2023-02-15', 10.79, 2),
(12, 'Kristina Love', 'Chick-fil-a', '2299 Richmond Rd', 'Lexington', 'KY', 40502, '2023-02-20', 9.85, 3),
(13, 'John Calipari', 'Thortons', '802 North Broadway', 'Lexington', 'KY', 40508, '2022-11-03', 2.73, 1),
(14, 'Ronald Smith', 'Target', '131 W Reynolds Rd', 'Lexington', 'KY', 40503, '2023-02-03', 31.16, 4),
(15, 'Bob Duncan', 'Papa Johns', '265A Avenue of Champions', 'Lexington', 'KY', 40508, '2023-02-15', 14.09, 2);
GO

/*
20 points: Deliverable 4)  run show tables; from your database prompt after connecting to your database and place the output in your submission. Follow the same copy paste conventions as described in Deliverable 2.
*/
SELECT TABLE_NAME 
FROM [cs405team008].INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
GO
/*
20 points : Deliverable 5) run select * from <tablename>;  where <tablename> is the name of the table(s) you created in your database and place that output in your submission. Follow the same copy paste conventions as described in Deliverable 2.
*/
SELECT * FROM addresses;
GO
SELECT * FROM reciepts;
GO
/*
The above deliverables provide me a fast reference for what you did when I review your results in the next set of deliverables.


-----------------------------------------------------------------------------------------------------
Business query #1

Once you have your database table built and loaded with addresses, your boss wants list of all the customers and businesses sorted in ascending order by zip code.  This can be two queries or one, choice is up to you. 

Owner wants the report to be formatted like this:  I have demoed some of this in class already. 

| Customer/Business Full Name | Delivery address |


We will accept the standard output from a mysql query here as shown and discussed in class - reformatting to csv or the like maybe in a later assignment. As always, I suggest a fixed spacing font for the code output in your submission document as it will produce a much tidier and professional report for considerably lower effort. 
*/

/*
20 points: Deliverable 6)  Deliverables for this part of the assignment will be:
-the query you wrote
-the output it produced.
Place these in your submission.

------------------------------------------------------------------------------------------------------

====================================================================

STOP - READ THIS CAREFULLY BEFORE CONTINUING
Stop here until you have completed items 1-6 if you wish to do this in a manner that mimics some real world business behavior. If you do not wish to do this continue reading to the end prior to starting. Either way you will learn things. I suggest you debate with your team and arrive at mutually agreeable path prior to proceeding past this point. Regardless of your team's choice, remember to document it in Deliverable 1).

====================================================================
*/

 /*
-----------------------------------------------------------------------------------------------------
Business change request #1

Your database collection was a wild success, but many buyers of your data indicated that they would have liked to have contact numbers for your customers so they could send them unsolicited offers (ever wonder how you start getting those?). Your boss wants you to add cell phone number to each data base entry where you have that data.

To that end add these phone numbers to the database you created.

John Wick 555-555-5555

Tony Stark 555-555-3142

Stephen Strange (555)555-4321

Bowman F. Wildcat has no phone number, he lacks dexterity to tap the keys and voice recognition just does not work for him for some reason.  

Your instructor did not provide a valid phone number. 

The "Bob's" did not provide a phone number. 

Plus made up phone numbers (real is ok too if it is easier for you, we will not be calling or texting them) for the remaining addresses in your database. Some businesses and consumers may have multiple numbers, you need to figure out how to handle that. Be careful as some businesses may be customers and vise-versa (How will you tell?).

Business Query #2:

Your boss wants a query ran to pull all the phone numbers from potential customers  the two largest zip code sets to allow some targeted marketing of offers.  <note: impacts of this spamming will show up in a later assignment>

Final report should output be in the following columns and grouped by zip code. 

| Customer Name | Phone number | Zip code|

20 points: Deliverable 7) Deliverables for this part of the assignment will be:
-show the command you used to modify the table(s)
-show the command(s) you used to modify the entities when you added the phone numbers
-the query(s) you wrote
-the output your queries produced 
-the output from select * from <tablename> for each of your tables. 
Place these in your submission following the previous formatting guidelines. 

--------------------------------------------------------------------------------------------------------------------------------------
*/

/*
Business Change #3 

Your boss's business has been contacted by business in your database. As they have a of the shelf cash register application, they can't access and manipulate their data like your business can. They need to catch up and would like you to provide the price of highest cost and lowest cost item on each receipt from sales from their stores. Assume they are a conglomerate and own ALL stores in your database. 

Add to the receipt table a column for highest and lowest price item and record the $ amount of it in the table. Make up these values if you like but note consistency, i.e. the highest value item can't be more than the total sale on the receipt (or can it - think about that?)


Query #3:
Search all receipts and provide a report of the following

| Customer name | Business Name | Highest Price | Total Sale | State | Zip |


20 points: Deliverable 8) Deliverables for this part of the assignment will be:
-the query you wrote
-the output it produced.
Place these in your submission.
*/

/*
Business Query #4:

Your boss also wants to know how many customers have the substring "Bo" in their first names. She intends to do an ad campaign and does not want to step on names of customers. The output should be in the form:

| Total number |


10 points: Deliverable 9) Deliverables for this part of the assignment will be:
-the query you wrote
-the output it produced.
Place these in your submission.
*/

/*
10 points Deliverable 10) --- your instructor will release this to you in 1 week. Businesses have to deal with unexpected changes all the time. This will help simulate it. 

Your boss wants a report of the zip codes with the highest total sales. They have been contacted by a business that wants to open a new store and would like to place it in an area with robust demand represented by high sales. They have paid your boss's business a hefty fee for this business intelligence and your boss needs you to deliver. 

Write a query that returns the total sales by Customer Zip code sorted in descending order. 
Should be in this format:

| Consumer Zip Code | Total Sales |


10 points: Deliverable 11) Backup up your database to the name "cs405.teamname.sql" and store in your home directory on the multi-lab systems.
-Show the commands you used to do this and place these in your submission.

https://www.cs.uky.edu/docs/users/mysql.htmlLinks to an external site.

/usr/bin/mysqldump -h mysql -p --databases databasename > cs405.teamname.sql
Where database name is your linkblue name. Same name as in the use databasename; when you connect to your database. 

(Do not panic, we will go over this in class).
It would be a GREAT idea for each team-member to get a copy of this backup and store it in their own multi-lab account.
Note: Ironically direct restores are disabled for this learning database for reasons, I will show you an alternative method for recovering your data that when it becomes relevant.  



*/
/*
10 points: Deliverable 12) - Write a short blurb about how your path in completing this project as influenced by the information you had at hand. No more that one typed page, I am not looking for a paper here, just experiences and lessons learned. 

You may be asked to demo your project so do not lose your backup! Might be wise for each team member to keep a copy of it. 

Closing comments:
There will be multiple ways to complete each section, so don't get hung up on finding the "RIGHT WAY" to do them. I will not be counting off for inefficient coding here, this is a learning stage.

I may pull examples of good and not so great ways of doing these for discussion in class. Key items I am grading here are correctness of selections, which drives correct output, properly formatted output, properly labeled output, table design, and data as stored in the tables. 
Show your select statements used to build inputs for the next select statements if you do not combine them into one select statement. 


Neatness and clarity in the submission are important. 
Put your names on your submissions!
*/