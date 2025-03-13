USE Dataset
GO

SELECT * FROM train

/*Find the average price of cars in the dataset.*/
SELECT AVG(price) AS AveragePrice
FROM train;

/*Calculate the number of cars with leather interior that are cheaper than $1400.*/
SELECT COUNT(*) AS NumberOfCars
FROM train
WHERE Leather_interior = 1 
AND price < 1400;

/*Get the maximum price of Toyota cars produced in 2011.*/
SELECT MAX(price) AS MaxPrice
FROM train
WHERE Manufacturer = 'TOYOTA' 
AND Prod_Year = 2011;

/*Sort the car manufacturers according to the average price of their cars descendingly.*/
SELECT Manufacturer, AVG(Price) AS AveragePrice
FROM train
GROUP BY Manufacturer
ORDER BY AveragePrice DESC;

/*Calculate the percentage of cars that use petrol fuel only among cars with category Jeep.*/
SELECT 
    (COUNT(CASE WHEN fuel_type = 'Petrol' THEN 1 END) * 100.0 / COUNT(*)) AS PetrolPercentage
FROM train
WHERE category = 'Jeep';

/*Find the cheapest car(s) in the dataset. (If multiple cars have the same lowest price, return all of them.)*/
SELECT * 
FROM train
WHERE Price = (SELECT MIN(Price) FROM train);

/*Find the percentage of Toyota cars that are above the average price of all cars.*/
SELECT 
    (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM train WHERE Manufacturer = 'TOYOTA') AS Per_above_avg
FROM train
WHERE Manufacturer = 'TOYOTA'
AND Price > (SELECT AVG(Price) FROM train);






