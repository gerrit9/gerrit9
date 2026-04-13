

--===========================================================================
--============================= CIS310 ASSIGNMENT 7 =========================
--===========================================================================

/*
STUDENT NAME: 
STUDENT ID: 
SUBMISSION DATE:
*/


--===========================================================================
--============================= Part 1 GenAI codes =========================
--===========================================================================
-- For this section, paste in the GenAI generated codes to those business questions below. ChatGPT, Gemini, Deepseek... etc are all acceptable.
/*CAUTION: Similar to any business setting, you CANNOT paste the output table contents, or actual database data into GenAI. 
That is Data Leak and how sensitive info gets where they SHOULD NOT. Individual impact for you wise, this is how one loses their job or face fines or law suits*/
--What you CAN share into GenAI as prompts, business questions. 
--*Be sure to check and remove any potentially sensitive info. e.g. Entity Name of EMPLOYEE is common and fine to share, but ENTITY name of JIAOTAPIA123-23-2345 maycontain SSN and should NOT be shared.
--You CAN make up a similar sample table, filled with fake data you generated, describe the table or database structure without using the actual info
--Data Security is a complex topic, and we cannot sufficiently discuss it in this limited space, but we can PRACTICE it starting here.

--e.g. Business question 0: Find all the animals in Old McDonalds Farm.
--ChatGPT generated:
/*1. chat gpt generated*/ SELECT owner_number, last_name, first_name
FROM owner;
/* 2. chat gpt generated */
SELECT * FROM property;
/* 3. chatgpt generates*/
SELECT last_name, first_name
FROM owner
WHERE city = 'Seattle';
/* 4 chat gpt generated*/
SELECT last_name, first_name
FROM owner
WHERE city NOT LIKE 'Seattle';
/* 5  chat gpt generated*/	
SELECT property_id, office_number
FROM property
WHERE square_footage <= 1400;
/* 6. chat gpt generated*/
SELECT property_id
FROM property
WHERE bedrooms = 2
AND manager = 'StayWell-GeorgeTown';
/* 7.  chat gpt generated*/
SELECT address, square_footage
FROM property
WHERE monthly_rent BETWEEN 1350 AND 1750;
/* 8 chat gpt generated */
SELECT property_id, category_number, estimated_hours, (estimated_hours * 35) AS estimated_cost
FROM service_request
ORDER BY estimated_cost DESC;
/* 9. chat gpt generated */
SELECT owner_number, last_name
FROM owner
WHERE state IN ('NV', 'OR', 'KY', 'ID');
/* 10.  chatgpt generated*/
SELECT office_id, COUNT(property_id) AS num_three_bedroom_properties
FROM property
WHERE bedrooms = 3
GROUP BY office_id;
--===========================================================================
--============================= Part 2 Your improved codes ==================
--===========================================================================
/* Improve the GenAI generated codes, so that:
1. Your code should adequately output the correct table contents. I will highlight this whole section & execute to grade.
2. Executes without any error in the Microsoft SQL Servers we built, using the given database. 
3. Contains comments to showcase where and how you made changes compared to GenAI codes
4. Has appropriate formatting, indentations, line breaks etc.
*/
/*1. changed the values to reflect ones actually in the database and the table as well*/

SELECT OWNER_NUM, LAST_NAME, FIRST_NAME
FROM OWNER;

/*2.  no change it worked already*/
SELECT * FROM property;
/* 3 no change */
SELECT last_name, first_name
FROM owner
WHERE city = 'Seattle';
/* 4. added the address to the selection */  
SELECT last_name, first_name, ADDRESS
FROM owner
WHERE city NOT LIKE 'Seattle';
/* 5.  changes the values to their actual corresponding ones on the table as they are labeled*/
SELECT property_id, OFFICE_NUM
FROM property
WHERE SQR_FT <= 1400;
/* 6.  not sure how to get this got stuck*/
SELECT property_id
FROM property
WHERE BDRMS = 2
AND   IN (SELECT OFFICE_NAME FROM OFFICE);
/* 7. changed what was selected to actually be to the actual value and attributes */
SELECT address, SQR_FT
FROM property
WHERE monthly_rent BETWEEN 1350 AND 1750;
/* 8.  made the attributes what they should actually be*/
SELECT property_id, category_number, EST_HOURS, (EST_HOURS * 35) AS ESTIMATED_COST
FROM service_request
ORDER BY ESTIMATED_COST DESC;
/* 9. made attributes correct */ 
SELECT OWNER_NUM, last_name
FROM owner
WHERE state IN ('NV', 'OR', 'KY', 'ID');
/* 10.changed the attributes to their actual ones */
SELECT OFFICE_NUM, COUNT(property_id) AS num_three_bedroom_properties
FROM property
WHERE BDRMS = 3
GROUP BY OFFICE_NUM;
--e.g. Updated Business Query 0:
SELECT animal_name 
	FROM OMFARM; -- Adjusted TABLE/ENTITY name to peoerly query the given data. Since WHERE clause removed, added ";" to properly close the statement
		--WHERE farm_name = 'Old McDonalds Farm'; --Removed the WHERE because it is not needed for the database tables, all the records on the OMFARM already means all the animals.
-- Also adjusted the formatting to better visually represent the data.


--===========================================================================
--=================== Part 3 Your Thoughts & Reflections ====================
--===========================================================================
/*
In a paragraph, recap what YOU've learned in this exercise. 5-10 sentences are ideal. YOU, should write this, GenAI should NOT.
Potential topics to consider: 
What did you notice about GenAI's ability to generate the queries? what errors are common? 
How did you address them? Did you have the abilities to address them based on your knowledge after learning?
What are your thoughts of GenAI's capabilities in this content? How did it improve/hinder your efficiencies in coding?
Any other relavant observations or experiences. We will repeat this for the following assignments as well, so this does not have to be ALL encompassing. 
*
/* that gen ai actually can get some stuff done but it is still imperfect. many questions it could mostly get but it struggles with more specific ones. 10 and 6 were especially hard for it to do.it can do quite well for the most part sometimes not needing change. it still needs to be looked over though */

--===========================================================================
--============================= Business Questions  =========================
--===========================================================================
/*For each of the following business question, PROVIDE THE SQL QUERY that adequtely output the requested information, not the table content.
**These queries are based on STAYWELL DB Tables and their data contents**
**The Expected Output Tables are at the end of file, to help you check your queries**
*/
--1. List the owner number, last name, and first name of every property owner.


--2. List the complete PROPERTY table (all rows and all columns).



--3. List the last name and first name of every owner who lives in Seattle.



--4. List the first name, last name and address of every owner who does not live in Seattle.



--5. List the property ID and office number for every property whose square footage 
--is equal to or less than 1,400 square feet.



--6. List the property ID for every property with two bedrooms that is managed by StayWell-Georgetown
--In case the names changes, you should reference the given name "StayWell-Georgetown" in your query search 
--*hint use subquery



--7. List the ADDRESS AND SQUARE FOOTAGE ID for every property with a monthly rent that is between $1,350 and $1,750 
--MUST USE PROPER KEYWORD OPERATOR, FOR MOST SUCCINCT QUERY, FOR FULL CREDIT.



--8. Labor is billed at the rate of $35 per hour. 
--List the property ID, category number, estimated hours, and estimated labor cost for every service request. 
--Sort the results by the estimated cost from highes to lowest.
--To obtain the estimated labor cost, multiply the estimated hours by 35. 
--Use the column name ESTIMATED_COST for the estimated labor cost.



--9. List the owner number and last name for all owners who live in Nevada (NV), Oregon (OR), Kentucky (KY), or Idaho (ID)
--USE THE APPROPRIATE KEYWORD OPERATOR TO WRITE THE MOST SUCCINCT QUERY, FOR FULL CREDIT.



--10. list the number of three-bedroom properties managed by each office?

--===========================================================================
--========================== Expected Output Tables =========================
--============Best used to compare and check your queries ===================
--===========================================================================

/* 
Q1:
OWNER_NUM	LAST_NAME	FIRST_NAME
AK102		Aksoy		Ceyda
BI109		Bianchi		Nicole
BU106		Burke		Ernest
CO103		Cole		Meerab
JO110		Jones		Ammarah
KO104		Kowalczyk	Jakub
LO108		Lopez		Janine
MO100		Moore		Elle-May
PA101		Patel		Makesh
RE107		Redman		Seth
SI105		Sims		Haydon

Q2:
PROPERTY_ID	OFFICE_NUM	ADDRESS	SQR_FT	BDRMS	FLOORS	MONTHLY_RENT	OWNER_NUM
1		1	30 West Thomas Rd.	1600	3	1	1400	BU106
2		1	782 Queen Ln.		2100	4	2	1900	AK102
3		1	9800 Sunbeam Ave.	1005	2	1	1200	BI109
4		1	105 North Illinois Rd.	1750	3	1	1650	KO104
5		1	887 Vine Rd.		1125	2	1	1160	SI105
6		1	8 Laurel Dr.		2125	4	2	2050	MO100
7		2	447 Goldfield St.	1675	3	2	1700	CO103
8		2	594 Leatherwood Dr.	2700	5	2	2750	KO104
9		2	504 Windsor Ave.	700	2	1	1050	PA101
10		2	891 Alton Dr.		1300	3	1	1600	LO108
11		2	9531 Sherwood Rd.	1075	2	1	1100	JO110
12		2	2 Bow Ridge Ave.	1400	3	2	1700	RE107

Q3:
FIRST_NAME	LAST_NAME
Ceyda		Aksoy
Ammarah		Jones
Makesh		Patel
Seth		Redman

Q4:
FIRST_NAME	LAST_NAME	ADDRESS
Nicole		Bianchi		7990 Willow Dr.
Ernest		Burke		613 Old Pleasant St.
Meerab		Cole		9486 Circle Ave.
Jakub		Kowalczyk	7431 S. Bishop St.
Janine		Lopez		9856 Pumpkin Hill Ln.
Elle-May	Moore		8006 W. Newport Ave.
Haydon		Sims		527 Primrose Rd.

Q5:
PROPERTY_ID	OFFICE_NUM
3		1
5		1
9		2
10		2
11		2
12		2



Q6:
PROPERTY_ID	
9	
11	

Q7:
ADDRESS			SQR_FT
30 West Thomas Rd.	1600
105 North Illinois Rd.	1750
447 Goldfield St.	1675
891 Alton Dr.		1300
2 Bow Ridge Ave.	1400

Q8:
PROPERTY_ID	CATEGORY_NUMBER	EST_HOURS	ESTIMATED_COST
8		3		10		350
9		1		6		210
4		1		4		140
6		5		3		105
11		2		2		70
12		6		2		70
2		2		1		35
1		4		1		35
2		4		1		35

Q9:
OWNER_NUM	LAST_NAME
BU106		Burke
MO100		Moore
SI105		Sims



Q10:
OFFICE_NUM	PROPERTYPEROFFICE
1		2
2		3
*/



