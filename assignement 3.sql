You work for a data analytics company, and your client is a food delivery platform similar to Jomato. They have provided you with a dataset containing information about various
restaurants in a city. Your task is to analyze this dataset using SQL queries to extract valuable insights and generate reports for your client.

Tasks to be performed:

1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.

CREATE PROCEDURE DisplayRestaurantsWithTableBooking
AS BEGIN SELECT 
        RestaurantName, 
        RestaurantType, 
        CuisinesType 
    FROM 
        jomato 
    WHERE 
        TableBooking <> 0;
       END
	   EXEC DisplayRestaurantsWithTableBooking;

2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
	   -- Start the transaction
BEGIN TRANSACTION;
UPDATE jomato
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';
SELECT * FROM jomato WHERE CuisinesType = 'Cafeteria';

-- Rollback the transaction if necessary
-- ROLLBACK;

3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.

WITH RankedRestaurants AS (
    SELECT  Area,
    ROW_NUMBER() OVER (ORDER BY AVG(Rating) DESC) AS Rank
    FROM  jomato
    GROUP BY Area
)
SELECT Area,
    Rank FROM  RankedRestaurants WHERE Rank <= 5;

4. Use the while loop to display the 1 to 50.

DECLARE @counter INT
SET @counter = 1

WHILE @counter <= 50
BEGIN
    PRINT @counter
    SET @counter = @counter + 1
END;

5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.

CREATE VIEW TopRating AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNum
    FROM Jomato
) AS RankedRestaurants
WHERE RowNum <= 5;
SELECT *FROM TopRating

6. Create a trigger that give an message whenever a new record is inserted.

CREATE TRIGGER NewRecordInserted
ON Jomato
AFTER INSERT
AS
BEGIN
    DECLARE @message NVARCHAR(255);
    SET @message = 'A new record has been inserted into Jomato table.';
    PRINT @message;
END;
















