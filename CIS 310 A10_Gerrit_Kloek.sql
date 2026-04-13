--===========================================================================
--============================= CIS310 ASSIGNMENT 10 =========================
--===========================================================================

/*
STUDENT NAME:Gerrit Kloek
STUDENT ID:5491577
SUBMISSION DATE:4/18/2025


For each of the following business request PROVIDE THE SQL Query that adequtely performs the tasks.
**These queries are based on STAYWELL DB, and KIMTAY Tables and their data contents**

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
Also, what new capabilities can you now use GenAI to assist in Stored Procedure and Triggers?
How were your roles in improving or peer reviewing it to make it suitable for the tasks?
What are your overall thoughts on GenAI as a tool to facilitate productivity, and your capability to use it, (or limitations thereof)?
*/

/* Chat gpt lacks a bit of creativity even in its most recent model. it just isn't super imaginative as to be expected for an AI. it also almost requires specifics to be somewhat accurate otherwise it will fail to account for slightly different attribute and table names. Chatgpt as always is good for getting started and getting ideas flowing. however it cannot be relied upon too much.*/

--===========================================================================
--============================= Business Requests =========================
--===========================================================================
-- 1. Create a Stored Procedure DISPLAY_OWNER_YOURFIRSTNAMELASTNAME (E.G. DISPLAY_OWNER_JIAOTAPIA), 
--AND its corresponding execution/test code.
--This Stored Procedure takes a single parameter/variable named INPUT_PROPERTY_ID to store user input value of a PROPERTY_ID. 
--It should output OFFICE_NUM, ADDRESS, OWNER_NUM and OWNER_NAME (concatenated FirstName LastName in proper format) 
--from the PROPERTY and OWNER tables for the given PROPERTY_ID.
/* chat gpt generated*/ wasn't sure if data leak or not so i just went with a fake name */ 
CREATE OR ALTER PROCEDURE DISPLAY_OWNER_JackKane
AS
BEGIN
    SELECT 
        P.OFFICE_NUM,
        P.ADDRESS,
        O.OWNER_NUM,
        CONCAT(
            UPPER(LEFT(O.FIRST_NAME, 1)) + LOWER(SUBSTRING(O.FIRST_NAME, 2, LEN(O.FIRST_NAME))),
            ' ',
            UPPER(LEFT(O.LAST_NAME, 1)) + LOWER(SUBSTRING(O.LAST_NAME, 2, LEN(O.LAST_NAME)))
        ) AS OWNER_NAME
    FROM 
        PROPERTY P
    INNER JOIN 
        OWNER O ON P.OWNER_NUM = O.OWNER_NUM;
END;
DROP PROCEDURE IF EXISTS DISPLAY_OWNER_JackKane;
/*made the formatting just a bit better so things were aligned correctly and changed name to what it should be instead of a fake one.   */
CREATE OR ALTER PROCEDURE DISPLAY_OWNER_GerritKloek
 AS
  BEGIN
    SELECT 
        P.OFFICE_NUM,
        P.ADDRESS,
        O.OWNER_NUM,
        CONCAT(
             UPPER(LEFT(O.FIRST_NAME, 1)) + LOWER(SUBSTRING(O.FIRST_NAME, 2, LEN(O.FIRST_NAME))),
             ' ',
             UPPER(LEFT(O.LAST_NAME, 1)) + LOWER(SUBSTRING(O.LAST_NAME, 2, LEN(O.LAST_NAME)))
        ) AS OWNER_NAME
    FROM 
        PROPERTY P
    INNER JOIN 
        OWNER O ON P.OWNER_NUM = O.OWNER_NUM;
   END;
EXEC DISPLAY_OWNER_GerritKloek;
-- 2. Create a Stored Procedure UPDATE_OWNER_YOURFIRSTNAMELASTNAME (E.G. UPDATE_OWNER_JIAOTAPIA), 
-- AND its corresponding execution/test code.
--This Stored Procedure takes 2 parameters/variables:  
--I_OWNER_NUM to store user input value of a OWNER_NUM, and I_LAST_NAME to store user input value of a new LAST_NAME. 
--This stored procedure should update/change the last name to the given value, for the given owner num.	
/*chat gpt generated */ 
 CREATE OR ALTER PROCEDURE UPDATE_OWNER_LASTNAME_JackKane
    @I_OWNER_NUM INT,
    @I_LAST_NAME VARCHAR(50)
AS
BEGIN
    UPDATE OWNER
    SET LAST_NAME = @I_LAST_NAME
    WHERE OWNER_NUM = @I_OWNER_NUM;
    
    PRINT 'Owner last name updated successfully.';
END;
EXEC UPDATE_OWNER_LASTNAME_JackKane @I_OWNER_NUM=100, @I_LAST_NAME='Kane';
/*changed names to the ones in the database as well as adjusting OWNER_NUM to Char(5) since thats what it is in the database instead of INT. tested if it actually changed a name and it did infact with these adjustments and formatting was improved.*/
 CREATE OR ALTER PROCEDURE UPDATE_OWNER_LASTNAME_GerritKloek
    @I_OWNER_NUM Char(5),
    @I_LAST_NAME VARCHAR(50)
   AS
    BEGIN
     UPDATE OWNER
     SET LAST_NAME = @I_LAST_NAME
     WHERE OWNER_NUM = @I_OWNER_NUM;
    
     PRINT 'Owner last name updated successfully.';
    END;
EXEC UPDATE_OWNER_LASTNAME_GerritKloek @I_OWNER_NUM='BU106', @I_LAST_NAME='Kane';

SELECT OWNER_NUM, FIRST_NAME, LAST_NAME
FROM OWNER
WHERE OWNER_NUM = 'BU106';
--3.  What other TRIGGER may be appropriate for the PETS OR PROPERTY MANAGEMENT Databases? 
--Describe detailed logics/steps with specific references OR write the trigger query & test codes.
/* chat gpt generated but i came up with the idea to an extent to check if the next service date is within a week */
CREATE OR ALTER TRIGGER trg_ServiceDateReminder
ON PROPERTY_SERVICE
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @NextServiceDate DATETIME;
    DECLARE @PropertyID INT;

    -- Get the NEXT_SERVICE_DATE and PROPERTY_ID from the inserted record(s)
    SELECT @NextServiceDate = NEXT_SERVICE_DATE, 
           @PropertyID = PROPERTY_ID
    FROM inserted;

    -- Check if the next service date is within the next 7 days
    IF DATEDIFF(DAY, GETDATE(), @NextServiceDate) BETWEEN 0 AND 7
    BEGIN
        PRINT 'Reminder: Service is due within a week for property ' + CAST(@PropertyID AS VARCHAR) + '.';
    END
END;
INSERT INTO PROPERTY_SERVICE (PROPERTY_ID, NEXT_SERVICE_DATE)
VALUES (101, DATEADD(DAY, 5, GETDATE()));
/* adjusted formatting a little bit and changed the names to what they are in the table instead of chatgpt assumptions. also added placeholder values for each attribute that needed a not null value which chat gpt did not provide*/
CREATE OR ALTER TRIGGER trg_ServiceDateReminder
ON SERVICE_REQUEST
 AFTER INSERT, UPDATE
  AS
   BEGIN
    DECLARE @NextServiceDate DATETIME;
    DECLARE @PropertyID INT;

    -- Get the NEXT_SERVICE_DATE and PROPERTY_ID from the inserted record(s)
    SELECT @NextServiceDate = NEXT_SERVICE_DATE, 
           @PropertyID = PROPERTY_ID
    FROM inserted;

    -- Check if the next service date is within the next 7 days
    IF DATEDIFF(DAY, GETDATE(), @NextServiceDate) BETWEEN 0 AND 7
    BEGIN
        PRINT 'Reminder: Service is due within a week for property ' + CAST(@PropertyID AS VARCHAR) + '.';
    END
END;
INSERT INTO SERVICE_REQUEST(PROPERTY_ID, NEXT_SERVICE_DATE,SERVICE_ID,CATEGORY_NUMBER,OFFICE_ID,DESCRIPTION,STATUS,EST_HOURS,SPENT_HOURS)
VALUES (12, DATEADD(DAY, 5, GETDATE()),10,2,3,'Insert Problem and Repair','empty status',5,7);
Select * From SERVICE_REQUEST;
Select * From PROPERTY;
