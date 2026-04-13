--===========================================================================
--============================= CIS310 ASSIGNMENT 9 =========================
--===========================================================================

/*
STUDENT NAME: Gerrit Kloek
STUDENT ID:5491577
SUBMISSION DATE:4/11/2025


For each of the following business request PROVIDE THE SQL Query that adequtely performs the tasks.
**These queries are based on STAYWELL DB Tables and their data contents**

*/
--===========================================================================
--============================= Part 1 GenAI codes =========================
--===========================================================================
-- For this section, CONSIDER WHAT YOU SHOULD PASTE in the GenAI generated codes to complete those BUSINESS REQUESTS below. ChatGPT, Gemini, Deepseek... etc are all acceptable.
/*CAUTION: Similar to any business setting, you CANNOT paste the input table contents, or actual database data into GenAI. 



--===========================================================================
--============================= Part 2 Your improved codes ==================
--===========================================================================
/* Improve/comment to the GenAI generated codes, so that:
1. Your code should adequately PERFORM THE TASKS. I will highlight this whole section & execute to grade.
2. Executes without any error in the Microsoft SQL Servers we built, using the given database. 
3. Contains COMMENTS to showcase where and how you made changes compared to GenAI codes, OR LACK OF IMPROVEMENTS AND WHY YOU AGREE WITH GENAI/WHERE IT WENT RIGHT
*/



--===========================================================================
--=================== Part 3 Your Thoughts & Reflections ====================
--===========================================================================
/*
In a paragraph, recap what YOU've learned in this exercise. 5-10 sentences are ideal. YOU, should write this, GenAI should NOT.
Potential topics to consider: Ones suggested in previous assignemnts if you'd like to elaborate on more.
Also, what new capabilities can you now use GenAI to assist in creating, how did it do on these new areas?
Any other relavant observations or experiences. This is a continuing learning experience, it will be different as you are practicing with new knowledge and skills 
*/
/*I've learned that chatgpt still has a bit of trouble with more complex queries as well as formatting. but it can also be subject to human error in what prompts it is given and how it is told to do its work. it struggles a little bit more with the specifics of making tables often assuming int is needed for everything when it isn't always. it does excel at more simple tasks and makes them just a bit quicker. updating and deleting in tables it can do quite well without much issue, other then formatting. */




--===========================================================================
--============================= Business Requests =========================
--===========================================================================


--1.Create a LARGE_PROPERTY table and insert into the LARGE_PROPERTY table the office number, address, bedrooms, floors, 
--monthly rent, and owner number for those properties whose square footage is greater than 800 square feet.
--There are multiple ways you can accomplish this, submit the easiest method.
  /* */ chat gpt generated*/
  CREATE TABLE LARGE_PROPERTY (
    OFFICE_NUM INT,
    ADDRESS VARCHAR(255),
    BED_ROOMS INT,
    FLOORS INT,
    MONTHLY_RENT DECIMAL(10, 2),
    OWNER_NUM INT
);
INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BED_ROOMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
SELECT OFFICE_NUM, ADDRESS, BED_ROOMS, FLOORS, MONTHLY_RENT, OWNER_NUM
FROM PROPERTY
WHERE SQFT > 800;
  /* Formatting adjusted and the tables were changed with not null parameters as well as changing the int types to what they should be based on what was done for staywell table creation*/
    CREATE TABLE LARGE_PROPERTY (
     OFFICE_NUM TINYINT NOT NULL,
     ADDRESS VARCHAR(255) NOT NULL,
     BDRMS TINYINT NOT NULL,
     FLOORS TINYINT NOT NULL,
     MONTHLY_RENT SMALLINT NOT NULL,
     OWNER_NUM CHAR(5) NOT NULL
);
   INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
   SELECT OFFICE_NUM, ADDRESS, BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM
   FROM PROPERTY
   WHERE SQR_FT > 800;

  
--2.StayWell has increased the monthly rent of each large property by $50. 
--Update the monthly rents in the LARGE_PROPERTY table accordingly.
  /*chat gpt generated */
INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BED_ROOMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
SELECT 
    OFFICE_NUM, 
    ADDRESS, 
    BED_ROOMS, 
    FLOORS, 
    MONTHLY_RENT + 50, 
    OWNER_NUM
FROM PROPERTY
WHERE SQFT > 800;
/*adjusted the formatting so everything as in line and changed the attribute names to what they are on the table and not what chatgpt thought up. it did have the foundation mostly right with how it created the attributes though. */
INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS,BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
 SELECT 
    OFFICE_NUM, 
    ADDRESS, 
    BDRMS, 
    FLOORS, 
    MONTHLY_RENT + 50, 
    OWNER_NUM
 FROM PROPERTY
  WHERE SQR_FT > 800;

--3.After increasing the monthly rent of each large property by $50 (in exercise 2), 
--StayWell decides to decrease the monthly rent of any property 
--whose monthly fee is more than $1750 by 3 percent. 
--Update the monthly rents in the LARGE_PROPERTY table accordingly.
/*chat gpt generated */
UPDATE LARGE_PROPERTY
SET MONTHLY_RENT = MONTHLY_RENT * 0.97
WHERE MONTHLY_RENT > 1750;
/*updated the formatting a little with some spacing but chat gpt already effectively reduced the monthly rent of properties that had more then 1750 monthly rent it just didn't format. */
UPDATE LARGE_PROPERTY
 SET MONTHLY_RENT = MONTHLY_RENT * 0.97
 WHERE MONTHLY_RENT > 1750;


--4.Insert a row into the LARGE_PROPERTY table for a new property. The office number is 1, 
--the address is 2643 Lugsi Dr, the number of bedrooms is 3, the number of floors is 2, 
--the monthly rent is $775, and the owner number is MA111.
/*You SHOULD NOT paste this contents into GenAI, which would be data leak. 
Instead, you can create similar example, or ask it to generate a generic insert and modify*/
 /* chat gpt generated*/
 INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BED_ROOMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
VALUES (1, '2643 Penoe Va', 3, 2, 775, 'MA222');
/*adjusted formatting with the right spacing and changed value to the actual row that is needed to be added instead of a similar one */
INSERT INTO LARGE_PROPERTY (OFFICE_NUM, ADDRESS, BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM)
 VALUES (1, '2643 Lugsi Dr', 3, 2, 775, 'MA111');

--5.Delete all properties in the LARGE_PROPERTY table for which the owner number is BI109.
  /* chat gpt generated  */
  DELETE FROM LARGE_PROPERTY
WHERE OWNER_NUM = 'BI109';
/* formatting adjusted with the right spacing but no other change needed since it does deleted those properties without issue*/
DELETE FROM LARGE_PROPERTY
 WHERE OWNER_NUM = 'BI109';
--6.The property in LARGE_PROPERTY table with the address '891 Alton Dr.' is 
--in the process of being remodeled and not rentable and should not have a rent amount listed. 
--Change the monthly rent value in the LARGE_PROPERTY table to null.
/*You SHOULD NOT paste the specific contents into GenAI, which would be data leak. 
Instead, you can create similar example to prompt GenAi, or ask it to generate a generic code for the request and modify according to task*/
/* chat gpt generated */
UPDATE LARGE_PROPERTY
SET MONTHLY_RENT = NULL
WHERE ADDRESS = '891 Panto Dr';
/*updated formatting with some spacing and changed the address to the one in the database that actually needs the change*/
UPDATE LARGE_PROPERTY
 SET MONTHLY_RENT = NULL
 WHERE ADDRESS = '891 Alton Dr';


--7. Delete the LARGE_PROPERTY table from the database.
 /*chat gpt generated */ 
 /* no change needed since this already removes the table from the database entirely */
  DROP TABLE LARGE_PROPERTY;
