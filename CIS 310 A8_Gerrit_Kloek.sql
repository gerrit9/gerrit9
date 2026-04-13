--===========================================================================
--============================= CIS310 ASSIGNMENT 8 =========================
--===========================================================================

/*
STUDENT NAME:Gerrit Kloek
STUDENT ID:5491577
SUBMISSION DATE:4/4/2025


--** YOU MUST USE THE PROPER JOIN KEYWORD FOR TABLE JOINS. Or the query will be considered unexecutable**
--** e.g. INNER JOIN/LEFT OUTER JOIN/RIGHT JOIN/ CROSS JOIN**

For each of the following business question, PROVIDE THE SQL Query that adequtely output the requested information
**These queries are based on STAYWELL DB Tables and their data contents**
**The Expected Output Tables are at the end of file, to help you check your queries**
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

--e.g. Business question 0: Find all the animals and their feeding records in Old McDonalds Farm.
--ChatGPT generated:
SELECT animal_name, feedingrecord
FROM animals
WHERE farm_name = 'Old McDonalds Farm';


--===========================================================================
--============================= Part 2 Your improved codes ==================
--===========================================================================
/* Improve the GenAI generated codes, so that:
1. Your code should adequately output the correct table contents. I will highlight this whole section & execute to grade.
2. Executes without any error in the Microsoft SQL Servers we built, using the given database. 
3. Contains comments to showcase where and how you made changes compared to GenAI codes
4. Has appropriate JOIN keywords, Relational Algebra set operators, formatting, indentations, line breaks etc.
*/

--e.g. Updated Business Query 0:
SELECT ANIMAL_NAME, FEEDING_DATE, FEEDING_AMOUNT, FOOD_TYPE, FEEDING_NOTES -- ADJUSTED THE PROPER ATTRIBUTES THAT SUFFICIENTLY SHOWS THE ANIMALS AND THEIR FEEDING RECORDS
	FROM OMFARM F INNER JOIN CAFE C on F.ANIMAL_ID = C.ANIMAL_NUM; -- Adjusted TABLE/ENTITY name to properly query the given data. 
									--Since WHERE clause removed, added ";" to properly close the statement
									--ANIMAL NAME AND FEEDING INFO ARE ON 2 TABLES, CONNECTED BY PK FK OF OMFARM.ANIMAL_ID = C.ANIMAL_NUM.
									--INNER JOIN IS THE MOST APPROPRIATE, AS REASONABLY, WE'D LIKE ANIMALS AND ALL RECORDS, BUT ONLY IF THEY ARE ANIMALS ON THIS FARM, AND HAVE FEEDING RECORDS
									-- LEFT JOIN IS LIKELY SUFFICIENT AS WELL.
		--WHERE farm_name = 'Old McDonalds Farm'; --Removed the WHERE because it is not needed for the database tables, all the records on the OMFARM already means all the animals.
-- Also adjusted the formatting to better visually represent the data.


--===========================================================================
--=================== Part 3 Your Thoughts & Reflections ====================
--===========================================================================
/*
In a paragraph, recap what YOU've learned in this exercise. 5-10 sentences are ideal. YOU, should write this, GenAI should NOT.
Potential topics to consider: Ones suggested in Last homework if you'd like to elaborate on more.
Also, what new capabilities can you now use GenAI to assist in creating, how did it do on these new areas?
Any other relavant observations or experiences. This is a continuing learning experience, it will be different as you are practicing with new knowledge and skills 
*
   /* chatgpt can get the framework but not the entire thing. it consistently lacks proper formatting even when it may get code right. but it always has a  bit of trouble with the names since it has to assume unless given the exact names. chatgpt can be a tool to get ideas started but not to finish the idea. it can get work started but never really finished. */



--===========================================================================
--===========================================================================
--============================= Business Questions  =========================
--===========================================================================
--===========================================================================


--1.	For every property, list the management office number, property address, monthly rent, 
--owner number, owner’s first name, and owner’s last name.
  /* chat gpt generated*/ */
   SELECT 
    p.property_id,
    p.address AS property_address,
    p.monthly_rent,
    m.office_number AS management_office_number,
    o.owner_first_name,
    o.owner_last_name,
    o.owner_phone_number
FROM properties p
JOIN management_offices m ON p.management_office_id = m.office_id
JOIN owners o ON p.owner_id = o.owner_id;
 /* made the formatting better with indentation and spacing. changed names from the chat gpt ones to database ones.*/
  SELECT 
    p.PROPERTY_ID,
    p.ADDRESS AS PROPERTY_ADDRESS,
    p.MONTHLY_RENT,
    m.OFFICE_NUM AS OFFICE_NUM,
    o.FIRST_NAME,
    o.LAST_NAME,
    o.OWNER_NUM
   FROM 
    PROPERTY p
    JOIN 
	 OFFICE m ON p.OFFICE_NUM = m.OFFICE_NUM
    JOIN 
	  OWNER o ON p.OWNER_NUM = o.OWNER_NUM;

--2.	For every service request for 'Furniture Replacement', list the property ID, 
--management office number, address, estimated hours, spent hours, owner number, 
--and owner’s last name.
--HINT: similar to last homework, be sure to use the specified keyword phrases in your querying (nested query)
 */  /*chat gpt generated*/
    SELECT  
    sr.property_id,
    mo.office_number AS office_num,
    mo.office_address,
    sr.estimated_hours,
    sr.spent_hours,
    o.owner_phone_number AS owner_number,
    o.owner_last_name
FROM service_requests sr
JOIN service_category sc ON sr.service_category_id = sc.category_id
JOIN properties p ON sr.property_id = p.property_id
JOIN management_offices mo ON p.management_office_id = mo.office_id
JOIN owners o ON p.owner_id = o.owner_id
WHERE sc.category_name = 'Furniture Replacement';
  /*changed formatting to be properly spaced and indented, changed the table and attribute names as well so it referenced the right attribute and tables*/
   SELECT  
    sr.PROPERTY_ID,
    mo.OFFICE_NUM AS OFFICE_NUM,
    mo.ADDRESS,
    sr.EST_HOURS,
    sr.SPENT_HOURS,
    o.OWNER_NUM AS OWNER_NUM,
    o.LAST_NAME
    FROM 
	 SERVICE_REQUEST sr
     JOIN 
	  SERVICE_CATEGORY sc ON sr.CATEGORY_NUMBER = sc.CATEGORY_NUM
     JOIN 
	    PROPERTY p ON sr.property_id = p.property_id
     JOIN 
	  OFFICE mo ON p.OFFICE_NUM = mo.OFFICE_NUM
     JOIN 
	  OWNER o ON p.OWNER_NUM = o.OWNER_NUM
      WHERE 
	   sc.CATEGORY_DESCRIPTION = 'Furniture Replacement';
--3.	List the owner's id, first and last names of all owners who own a two-bedroom property. 
--Use the IN operator in your query.
  /* chat gpt generated*/ */
  SELECT owner_id, owner_first_name, owner_last_name  
FROM owners  
WHERE owner_id IN (  
    SELECT owner_id  
    FROM properties  
    WHERE bedrooms = 2  
);
  /* changed the formatting to have better spacing and indentation and changed each name in the lines of code relating to an attribute or table to the one it should be by the naming conventions of the database*/
   SELECT 
    OWNER_NUM, FIRST_NAME, LAST_NAME
   FROM 
    OWNER 
     WHERE 
	   OWNER_NUM IN (  
      SELECT 
	   OWNER_NUM 
      FROM 
	   PROPERTY  
       WHERE 
	    BDRMS = 2  
);
--4.	Repeat above request, but this time use the EXISTS operator in your query.
  /*chat gpt generated */ */
    SELECT owner_id, owner_first_name, owner_last_name  
FROM owners o  
WHERE EXISTS (  
    SELECT 1  
    FROM properties p  
    WHERE p.owner_id = o.owner_id  
    AND p.bedrooms = 2  
);
  /*changed formatting so there is better spacing and indentation. changed the attributes and tables to the table and attribute names in the database */
    SELECT
	 OWNER_NUM, FIRST_NAME,LAST_NAME 
    FROM 
	  OWNER o  
     WHERE EXISTS (  
       SELECT 
	    1  
       FROM 
	    PROPERTY p  
        WHERE 
		 p.OWNER_NUM = o.OWNER_NUM
        AND p.BDRMS = 2  
);
--5.	List the property IDs of any pair of properties that have the same number of bedrooms. 
--For example, one pair would be property ID 2 and property ID 6, 
--because they both have four bedrooms. The first property ID listed should be the major sort key 
--and the second property ID should be the minor sort key.
    /* chat gpt generated */ */
	 SELECT p1.property_id AS property1_id, p2.property_id AS property2_id
FROM properties p1
JOIN properties p2 
  ON p1.bedrooms = p2.bedrooms 
  AND p1.property_id < p2.property_id;
   /*made some actual formatting by spacing each one out and lining them up to what they are most connected to and changing the names to their names in the database  */
   SELECT 
    p1.property_id AS property1_id, p2.property_id AS property2_id
   FROM 
    PROPERTY p1
    JOIN 
	 PROPERTY p2 ON p1.BDRMS = p2.BDRMS 
      AND p1.property_id < p2.property_id;


--6.	List the office number, address, and monthly rent for properties 
--whose owners live in Washington State or own two-bedroom properties.
   /*chat gpt generated */ */
    SELECT 
    mo.office_number, 
    p.address, 
    p.monthly_rent
FROM properties p
JOIN management_offices mo ON p.management_office_id = mo.office_id
JOIN owners o ON p.owner_id = o.owner_id
WHERE o.state = 'Washington' 
   OR p.bedrooms = 2;
    /* updated formatting with spacing and indentation as well as changing table names, and attribute names to the ones in the database instead of chatgpt given ones*/
	SELECT 
    mo.OFFICE_NUM, 
    p.address, 
    p.monthly_rent
   FROM 
     PROPERTY p
    JOIN 
	 OFFICE mo ON p.OFFICE_NUM = mo.OFFICE_NUM
    JOIN 
	 OWNER o ON p.OWNER_NUM = o.OWNER_NUM
      WHERE 
	   o.state = 'WA' 
       OR p.bedrooms = 2;

--7.	List the office number, address, monthly rent, bedroom count, and state for properties 
--whose owners live in Washington State but do not own two-bedroom properties.
  /*chat gpt generated */ */
      SELECT 
    mo.office_number, 
    p.address, 
    p.monthly_rent, 
    p.bedrooms, 
    o.state
FROM properties p
JOIN management_offices mo ON p.management_office_id = mo.office_id
JOIN owners o ON p.owner_id = o.owner_id
WHERE o.state = 'Washington'
  AND NOT EXISTS (
      SELECT 1 
      FROM properties p2
      WHERE p2.owner_id = o.owner_id 
        AND p2.bedrooms = 2
  );

   /*formatted it with proper spacing as well as changing table names and attribute names to what they are in the database rather then chatgpt assumptions */
   SELECT 
      mo.OFFICE_NUM, 
      p.ADDRESS, 
      p.MONTHLY_RENT, 
      p.BDRMS, 
      o.state
    FROM 
     PROPERTY p
     JOIN 
      OFFICE mo ON p.OFFICE_NUM = mo.OFFICE_NUM
     JOIN 
     OWNER o ON p.OWNER_NUM = o.OWNER_NUM
      WHERE 
       o.state = 'WA'
        AND NOT EXISTS (
         SELECT 1 
          FROM 
		      PROPERTY p2
           WHERE 
		     p2.OWNER_NUM = o.OWNER_NUM
              AND p2.BDRMS = 2
  );
--8.	Find the service ID and property ID for each service request 
--whose estimated hours is greater than the number of estimated hours of at least 
--one service request on which the category number is 5.
--MUST USE ANY/ALL OPERATOR
   /* chat gpt generated*/ */
     SELECT service_id, property_id
FROM service_requests
WHERE estimated_hours > ANY (
    SELECT estimated_hours
    FROM service_requests
    WHERE service_category_id = 5
);
   /* made the formatting better with spacing and changed each name to their names in the database instead of gpt's assumed names*/
   SELECT 
   SERVICE_ID, PROPERTY_ID
    FROM 
      SERVICE_REQUEST
      WHERE 
       EST_HOURS > ANY (
      SELECT
	   EST_HOURS
     FROM 
	   SERVICE_REQUEST
       WHERE
	    CATEGORY_NUMBER = 5
);
--9.	List the address, square footage, owner number, service ID, number of estimated hours, 
--and number of spent hours for each service request on which the category number is 4.
  /* chat gpt generated */ */
  SELECT 
    p.address, 
    p.sqft, 
    o.owner_phone_number AS owner_num, 
    sr.service_id, 
    sr.estimated_hours, 
    sr.spent_hours
FROM service_requests sr
JOIN properties p ON sr.property_id = p.property_id
JOIN owners o ON p.owner_id = o.owner_id
WHERE sr.service_category_id = 4;
/*made formatting with actual indentation and spacing, as well as changing attribute and table names to ones in the database */
SELECT 
    p.address, 
    p.SQR_FT, 
    o.OWNER_NUM AS OWNER_NUM, 
    sr.SERVICE_ID, 
    sr.EST_HOURS, 
    sr.SPENT_HOURS
   FROM 
    SERVICE_REQUEST sr
   JOIN
     PROPERTY p ON sr.PROPERTY_ID = p.PROPERTY_ID
  JOIN 
    OWNER o ON p.OWNER_NUM = o.OWNER_NUM
    WHERE 
     sr.CATEGORY_NUMBER = 4;

--10.	Output the same list of information above request, but this time be sure each property is included 
--regardless of whether the property currently has any service requests.
--*Hint: Consider a different join type.
 /* chat gpt generated*/  */
 SELECT 
    p.address, 
    p.sqft, 
    o.owner_phone_number AS owner_num, 
    sr.service_id, 
    sr.estimated_hours, 
    sr.spent_hours
    FROM 
      PROPERTY p
    JOIN 
      OWNER o ON p.owner_id = o.owner_id
LEFT JOIN service_requests sr ON p.property_id = sr.property_id 
    AND sr.service_category_id = 4;
	/*changed the formatting to have better spacing and alignment as well as changing table and attribute names to the ones actually in the database. */
	SELECT 
    p.address, 
    p.SQR_FT, 
    o.OWNER_NUM AS owner_num, 
    sr.SERVICE_ID, 
    sr.EST_HOURS, 
    sr.spent_hours
  FROM 
   PROPERTY p
     JOIN 
       OWNER o ON p.OWNER_NUM = o.OWNER_NUM
     LEFT JOIN
       SERVICE_REQUEST sr ON p.property_id = sr.property_id 
       AND sr.CATEGORY_NUMBER= 4;


--===========================================================================
--========================== Expected Output Tables =========================
--============Best used *AFTER* you've come up with your queries ============
--===========================================================================



/* 
Q1:
OFFICE_NUM	ADDRESS			MONTHLY_RENT	OWNER_NUM	FIRST_NAME	LAST_NAME
1		30 West Thomas Rd.	1400		BU106		Ernest		Burke
1		782 Queen Ln.		1900		AK102		Ceyda		Aksoy
1		9800 Sunbeam Ave.	1200		BI109		Nicole		Bianchi
1		105 North Illinois Rd.	1650		KO104		Jakub		Kowalczyk
1		887 Vine Rd.		1160		SI105		Haydon		Sims
1		8 Laurel Dr.		2050		MO100		Elle-May	Moore
2		447 Goldfield St.	1700		CO103		Meerab		Cole
2		594 Leatherwood Dr.	2750		KO104		Jakub		Kowalczyk
2		504 Windsor Ave.	1050		PA101		Makesh		Patel
2		891 Alton Dr.		1600		LO108		Janine		Lopez
2		9531 Sherwood Rd.	1100		JO110		Ammarah		Jones
2		2 Bow Ridge Ave.	1700		RE107		Seth		Redman



Q2:
PROPERTY_ID	OFFICE_NUM	ADDRESS			EST_HOURS	SPENT_HOURS	OWNER_NUM	LAST_NAME
12		2		2 Bow Ridge Ave.	2		0		RE107		Redman

OWNER_NUM	LAST_NAME
BI109		Bianchi
JO110		Jones
PA101		Patel
SI105		Sims

Q3:
OWNER_NUM	FIRST_NAME	LAST_NAME
BI109		Nicole		Bianchi
JO110		Ammarah		Jones
PA101		Makesh		Patel
SI105		Haydon		Sims

Q4:
OWNER_NUM	FIRST_NAME	LAST_NAME
BI109		Nicole		Bianchi
JO110		Ammarah		Jones
PA101		Makesh		Patel
SI105		Haydon		Sims

Q5:
PROPERTY_ID	PROPERTY_ID	BDRMS
1		4		3
1		7		3
1		10		3
1		12		3
2		6		4
3		5		2
3		9		2
3		11		2
4		7		3
4		10		3
4		12		3
5		9		2
5		11		2
7		10		3
7		12		3
9		11		2
10		12		3

Q6:
OFFICE_NUM	ADDRESS			MONTHLY_RENT
1		105 North Illinois Rd.	1650
1		782 Queen Ln.		1900
1		887 Vine Rd.		1160
1		9800 Sunbeam Ave.	1200
2		2 Bow Ridge Ave.	1700
2		447 Goldfield St.	1700
2		504 Windsor Ave.	1050
2		594 Leatherwood Dr.	2750
2		891 Alton Dr.		1600
2		9531 Sherwood Rd.	1100


Q7:
OFFICE_NUM	ADDRESS			MONTHLY_RENT	BDRMS	STATE
1		105 North Illinois Rd.	1650		3	WA
1		782 Queen Ln.		1900		4	WA
2		2 Bow Ridge Ave.	1700		3	WA
2		447 Goldfield St.	1700		3	WA
2		594 Leatherwood Dr.	2750		5	WA
2		891 Alton Dr.		1600		3	WA

Q8:
SERVICE_ID	PROPERTY_ID
5		8
6		4
8		9

Q9:
ADDRESS			SQR_FT	OWNER_NUM	SERVICE_ID	EST_HOURS	SPENT_HOURS	CATEGORY_NUMBER
30 West Thomas Rd.	1600	BU106		2		1		0		4
782 Queen Ln.		2100	AK102		4		1		0		4


Q10:
ADDRESS			SQR_FT	OWNER_NUM	SERVICE_ID	EST_HOURS	SPENT_HOURS	CATEGORY_NUMBER
30 West Thomas Rd.	1600	BU106		2		1		0		4
782 Queen Ln.		2100	AK102		4		1		0		4
782 Queen Ln.		2100	AK102		7		1		0		2
9800 Sunbeam Ave.	1005	BI109		NULL		NULL		NULL		NULL
105 North Illinois Rd.	1750	KO104		6		4		2		1
887 Vine Rd.		1125	SI105		NULL		NULL		NULL		NULL
8 Laurel Dr.		2125	MO100		3		3		1		5
447 Goldfield St.	1675	CO103		NULL		NULL		NULL		NULL
594 Leatherwood Dr.	2700	KO104		5		10		0		3
504 Windsor Ave.	700	PA101		8		6		2		1
891 Alton Dr.		1300	LO108		NULL		NULL		NULL		NULL
9531 Sherwood Rd.	1075	JO110		1		2		1		2
2 Bow Ridge Ave.	1400	RE107		9		2		0		6


*/