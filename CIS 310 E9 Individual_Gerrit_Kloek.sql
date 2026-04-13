--======================================================================================================================
--====================================================Bike Exercise=====================================================
--======================================================================================================================
/*
STUDENT NAME:Gerrit Kloek
STUDENT ID:5491577
Which Questions did you answer? e.g. 1-5, 10, 12....  11-21
*/


/*
Note: your query should be based on the actual data. It is good to gain familiarity with table contents before starting to query. 
Query should use as few tables as possible if a JOIN is required. Sometimes a single table may contain all the attribute you need.
*/

/*
Grading: 
No Credit- If you provide no query, or ONLY the query without explanation, even if is fully correct.

Full Credit 1 - Provide your working/thinking process via comments
		Your intermediate steps/queries while building the query, 
		And the fully correct query for the query

Full Credit 2 - If you cannot arrive at a fully correct query, 
		Still, provide your working/thinking process via comments, which tables have you checked, which may contain data, which do not
		Your intermediate steps/queries while attemptiong to build the query, and at least 3+ relevant, trying queries 
		*they don't need to execute properly, but should be relevant, and demonstrate your thinking progression. Simple queries such as Select * from table do NOT count
*/


--====================================================Exercise Questions =====================================================
--==========================================& Expected output table columns ===================================================

--1. List the customers from California who bought red mountain bikes in September 2003. 
--Use order date as date bought. Multi-color bikes with red are considered red bikes.

--CustomerID	LastName	FirstName	ModelType	ColorList	OrderDate	SaleState
 
--2. List the employees who sold race bikes shipped to Wisconsin without the help of a retail store in 2001, 
--Without help of retail store means rders completed without the help of a retail store are walk-in or direct sales.
--EmployeeID	LastName	SaleState	ModelType	StoreID	OrderDate
 
--3. List all of the (distinct) rear derailleurs installed on road bikes sold in Florida in 2002.
--ComponentID	ManufacturerName	ProductNumber
 
--4. Who bought the largest (frame size) full suspension mountain bike sold in Georgia in 2004?
--CustomerID	LastName	FirstName	ModelType	SaleState	FrameSize	OrderDate
 
--5. Which manufacturer gave us the largest discount on an order in 2003?
--ManufacturerID	ManufacturerName
 
--6. What is the most expensive road bike component we stock that has a quantity on hand greater than 200 units?
--ComponentID	ManufacturerName	ProductNumber	Road	Category	ListPrice	QuantityOnHand
 
--7. Which inventory item represents the most money sitting on the shelf—based on estimated cost?
--Inventory value is defined as [EstimatedCost]*[QuantityOnHand] in Component.
--ComponentID	ManufacturerName	ProductNumber	Category	Year	Value
 
--8. What is the greatest number of components ever installed in one day by one employee?
--EmployeeID	LastName	DateInstalled	CountOfComponentID
 
--9. What was the most popular letter style on race bikes in 2003?
--LetterStyleID	CountOfSerialNumber
 
--10. Which customer spent the most money with us and how many bicycles did that person buy in 2002?
--Use 2002 for both amount spent and number of bikes bought. Use OrderDate when determining year. Use SalePrice as amount spent.
--CustomerID	LastName	FirstName	Number of Bikes	Amount Spent
 
--11. Have the sales of mountain bikes (full suspension or hard tail) increased or decreased from 2000 to 2004 (by count not by value)?
--We are looking for any bike with a model type that starts with the word Mountain.
--SaleYear	CountOfSerialNumber
/* used chat gpt to get a start and eventually with some tweaking and trying out some queries managed to find that mountain bicycle sales increased from 2000 to 2004. tried a basic select and count query at first but it only showed the total count of both and then went for the final result, going for two seperate counts with the use of ones from the first part. and the addition of group by and order by.  */
SELECT 
  YEAR(OrderDate) AS SaleYear, 
  COUNT(SerialNumber) AS MountainBikesSold
FROM Bicycle
WHERE ModelType LIKE 'Mountain%'
  AND (YEAR(OrderDate) = 2000 OR YEAR(OrderDate) = 2004)
GROUP BY YEAR(OrderDate)
ORDER BY SaleYear;
--12. Which component did the company spend the most money on in 2003?
--The amount spent on a component is the sum of purchase price * quantity. Note the same component may have been purchased multiple times in a time period.
--ComponentID	ManufacturerName	ProductNumber	Category	Value
 /*looked for a way to use one table but just couldn't find any other way besides joining a few tables  and finding the sum using the method provided by the question followed by selecting top 1 and accounts for components being processed multiple times. requiring a total of three different tables to get the values right also had help from chat gpt*/
 /* The Company spent the most on Frames and specifically from Kremlin Metalworks with the total amount being $1,021,093.43*/
 SELECT TOP 1
    c.ComponentID,
    c.ProductNumber,
    c.Category,
    m.ManufacturerName,
    SUM(pi.PricePaid * pi.Quantity) AS TotalAmountSpent
FROM PurchaseItem pi
    JOIN Component c ON pi.ComponentID = c.ComponentID
    JOIN Manufacturer m ON c.ManufacturerID = m.ManufacturerID
GROUP BY 
    c.ComponentID, 
    c.ProductNumber, 
    c.Category, 
    m.ManufacturerName
ORDER BY TotalAmountSpent DESC;
--13. Which employee painted the most red race bikes in May 2003?
--EmployeeID	LastName	Number Painted
 /*attempt 1 Selected the top employee who painted the most red race bikes with some help from Joining and Sorting through GROUP BY and ORDER BY also got help from chat gpt*/
SELECT TOP 1
    e.EmployeeID,
    e.LastName,
    COUNT(*) AS RedRaceBikesPainted
FROM Bicycle b
    JOIN Employee e ON b.EmployeeID = e.EmployeeID
WHERE b.ModelType = 'Race'
     AND b.PaintID = 14
GROUP BY e.EmployeeID, e.LastName
ORDER BY RedRaceBikesPainted DESC;
/*attempt 2, after a realization from doing another question i had to rework this one to now use painter and the numbers from that to find which employees matched those numbers and count each of those times to see who actually painted the most bikes.  */
/*Jugnauth painted the most Red Race Bikes with a crazy 1311206 bikes painted red */
SELECT TOP 1 e.EmployeeID, e.LastName, COUNT(*) AS RedBikesPainted
FROM Bicycle bt
JOIN Bicycle b ON b.SerialNumber = b.SerialNumber
JOIN Employee e ON b.Painter = e.EmployeeID
WHERE b.ModelType = 'Race'
  AND b.PaintID = 14
GROUP BY e.EmployeeID, e.LastName
ORDER BY RedBikesPainted DESC;
--14. Which California bike shop helped sell the most bikes (by value) in 2003?
--StoreID	StoreName	City	SumOfSalePrice
/* assistance from chat gpt. selects the top 1 californian bike shop by filtering for bikes sold in california, joining retal store with store and City with Store Through CITY ID. */
/* The Result was found to be "THE FRENCH BICYCLE SHOP" who sold the most bikes in 2003*/
SELECT TOP 1
    rs.StoreID,
    rs.StoreName,
    SUM(b.SalePrice) AS TotalSales
FROM Bicycle b
   JOIN RetailStore rs ON b.StoreID = rs.StoreID
   JOIN City c ON rs.CityID = c.CityID
    WHERE c.State = 'CA'
      AND YEAR(b.OrderDate) = 2003
GROUP BY rs.StoreID, rs.StoreName
ORDER BY TotalSales DESC;
--15. What is the total weight of the components on bicycle 11356?
 --TotalWeight
 /* found the total weight by adding each of the weights of the components that made up the bike, through getting each component ID that was also tied to the Serial Number the Bike had as well as joining Component and Bike Parts tables. also chat gpt assistance. */
 /*Total Weight was 5811 */
SELECT SUM(c.Weight) AS TotalWeight
FROM BikeParts bp
 JOIN Component c ON bp.ComponentID = c.ComponentID
  WHERE bp.SerialNumber = 11356;
--16. What is the total list price of all items in the 2002 Campy Record groupo?
--GroupName	SumOfListPrice
/*tried to get the sum through converting component group id to group id then to component id to find the price of each individual component and then the list price that way but it came out as null. */
/* with help from chat gpt*/
 SELECT SUM(c.ListPrice) AS SumOfListPrice
FROM Groupo g
JOIN GroupComponents cg ON g.ComponentGroupID = cg.GroupID
JOIN Component c ON cg.ComponentID = c.ComponentID
WHERE g.GroupName = '2002 Campy Record';
/* attempt 2 tried to find a distinct list price that could correspond to the group that might've been a bike apart of the components involved in that group, or bikes but there was no luck. */
SELECT SUM(DISTINCT b.ListPrice) AS TotalBicycleListPrice
FROM BikeParts bp
JOIN GroupComponents cg ON bp.ComponentID = cg.ComponentID
JOIN Groupo g ON cg.GroupID = g.ComponentGroupID
JOIN Bicycle b ON bp.SerialNumber = b.SerialNumber
WHERE g.GroupName = '2002 Campy Record';

/* attempt 3  tried taking from Total List which is pretty much list price from the purchase order table to try to get something from this group somehow and transerring to purchase id instead of serial number*/
SELECT SUM(po.TotalList) AS TotalListPrice
FROM PurchaseItem pi
 JOIN GroupComponents cg ON pi.ComponentID = cg.ComponentID
 JOIN Groupo g ON cg.GroupID = g.ComponentGroupID
 JOIN PurchaseOrder po ON pi.PurchaseID = po.PurchaseID
  WHERE g.GroupName = '2002 Campy Record'
   AND po.TotalList IS NOT NULL;
   /*Got null again, unable to find the total list price of the group */
--17. In 2003, were more race bikes built from carbon or titanium (based on the down tube)?
--As output you may show the number of bikes for both materials. Use OrderDate.
--Material	CountOfSerialNumber 
/* help from chat gpt once again, joined both of the tube tables, Bike Tubes and Tube material and selected only distinct serial numbers and checked their materials to see how many were built of what material. grouped them up by material and ordered by serial number count  */
/*total count was 794 and the winner was Titanium!!! */
SELECT tm.Material, COUNT(DISTINCT b.SerialNumber) AS CountOfSerialNumber
FROM Bicycle b
 JOIN BikeTubes bt ON b.SerialNumber = bt.SerialNumber
  JOIN TubeMaterial tm ON bt.TubeID = tm.TubeID
   WHERE b.ModelType = 'Race'
     AND tm.Material IN ('Titanium', 'Carbon')
     GROUP BY tm.Material
      ORDER BY CountOfSerialNumber DESC;
--18. What is the average price paid for the 2001 Shimano XTR rear derailleurs?
--AvgOfPricePaid
/*help from chat gpt. got the average by joining Component table which then joined Manufacturer table and then the component id was used to find the average price paid for shimano xtr rear derailleurs */
/* the result was an average price of 51.7617*/
SELECT AVG(pi.PricePaid) AS AvgPricePaid
FROM PurchaseItem pi
JOIN Component c ON pi.ComponentID = c.ComponentID
JOIN Manufacturer m ON c.ManufacturerID = m.ManufacturerID
WHERE c.Category = 'Rear Derailleur'
  AND m.ManufacturerName = 'Shimano (USA)'
  AND YEAR = 2001;
--19. What is the average top tube length for a 54 cm (frame size) road bike built in 1999?
--AvgOfTopTube
/*an attempt was made with chat gpt by finding the average with various conditions and joining bicycle and bike tubes to try to find the average top tube length for a road bike made in 1999 */
SELECT AVG(bt.Length) AS AvgTopTubeLength
FROM Bicycle b
  JOIN BikeTubes bt ON b.SerialNumber = bt.SerialNumber
   WHERE b.ModelType = 'Road'
     AND b.FrameSize = 54
      AND YEAR(b.StartDate) = 1999
       AND bt.TubeName = 'Top';
 /* attempt 2 was where i realized Top Tube existed */
 /* it was actually simpler then believed, just had to get the average of the top tube Attribute which was already listing out the length of each as well as filling out each parameter for road as the type, 1999 as the year and frame size as 54. */
 /* the average top tube length was 55! */
SELECT AVG(b.TopTube) AS AvgTopTubeLength
FROM Bicycle b
 WHERE b.ModelType = 'Road'
   AND b.FrameSize = 54
    AND YEAR(b.StartDate) = 1999;
--20. On average, which costs (list price) more: road tires or mountain bike tires?
--Road	AvgOfListPrice
 /*used a select to find and setup the average price as well as select model types and filter so that only mountain and road show up along with each price being displayed. assisted by chat gpt. */
 /* Road won with 3194.7073 Average list Price.*/
SELECT b.ModelType, AVG(b.ListPrice) AS AvgListPrice
FROM Bicycle b
 WHERE b.ModelType IN ('Mountain', 'Road')
  GROUP BY b.ModelType
   ORDER BY AvgListPrice DESC;
--21. In May 2003, which employees sold road bikes that they also painted?
--EmployeeID	LastName
/* selected only unique employee id's and last names to then join Employee table with the bicycle table and then make sure its road only and check that employee id is equal to painter id as well as the year and month may aka 5 is correct. chatgpt was assisting. */
/*Venetiaan, Stenheim, Tudjman, and Dehaene were all ones that painted and sold a road bike */
 SELECT DISTINCT e.EmployeeID, e.LastName
FROM Bicycle b
JOIN Employee e ON b.EmployeeID = e.EmployeeID
WHERE b.ModelType = 'Road'
  AND YEAR(b.OrderDate) = 2003
  AND MONTH(b.OrderDate) = 5
  AND b.EmployeeID = b.Painter;
--22. In 2002, was the Old English letter style more popular with some paint jobs?
--PaintID	ColorName	Number of Bikes Painted
 
--23. Which race bikes in 2003 sold for more than the average price of race bikes in 2002?
--SerialNumber	ModelType	OrderDate	SalePrice
 
 
--24. Which component that had no sales (installations) in 2004 has the highest inventory value (cost basis)?
--ManufacturerName	ProductNumber	Category	Value	ComponentID
 
--25. Create a vendor contacts list of all manufacturers and retail stores in California.
--Include only the columns for VendorName and Phone. 
--The retail stores should only include stores that participated in the sale of at least one bicycle in 2004
--Store Name Or Manufacturer Name	Phone
 
--26. List all of the employees who report to Venetiaan.
--LastName	EmployeeID	LastName	FirstName	Title
 
--27. List the components where the company purchased at least 25 percent more units than it used through June 30, 2000.
--ComponentID	ManufacturerName	ProductNumber	Category	TotalReceived	TotalUsed	NetGain	NetPct	ListPrice
 
--28. In which years did the average build time for the year exceed the overall average build time for all years? 
--The build time is the difference between order date and ship date.
--Use the difference between OrderDate and ShipDate.
--Year	BuildTime

