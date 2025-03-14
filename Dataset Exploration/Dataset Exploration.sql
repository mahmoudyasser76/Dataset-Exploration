USE Dataset
GO

SELECT * FROM train

/* 1- Find the average price of cars in the dataset.*/
SELECT AVG(price) AS AveragePrice
FROM train;
/* Answer: 18555 */

/* 2- Calculate the number of cars with leather interior that are cheaper than $1400.*/
SELECT COUNT(*) AS NumberOfCars
FROM train
WHERE Leather_interior = 1 
AND price < 1400;
/* Answer: 2532 */

/* 3- Get the maximum price of Toyota cars produced in 2011.*/
SELECT MAX(price) AS MaxPrice
FROM train
WHERE Manufacturer = 'TOYOTA' 
AND Prod_Year = 2011;
/* Answer: 54882 */

/* 4- Sort the car manufacturers according to the average price of their cars descendingly.*/
SELECT Manufacturer, AVG(Price) AS AveragePrice
FROM train
GROUP BY Manufacturer
ORDER BY AveragePrice DESC;
/* Answer: output of Q-4.png */

/* 5- Calculate the percentage of cars that use petrol fuel only among cars with category Jeep.*/
SELECT 
    (COUNT(CASE WHEN fuel_type = 'Petrol' THEN 1 END) * 100.0 / COUNT(*)) AS PetrolPercentage
FROM train
WHERE category = 'Jeep';
/* Answer: 47.907911565868 */

/* 6- Find the cheapest car(s) in the dataset. (If multiple cars have the same lowest price, return all of them.)*/
SELECT * 
FROM train
WHERE Price = (SELECT MIN(Price) FROM train);
/* Answer: output of Q-6 */

/* 7- Find the percentage of Toyota cars that are above the average price of all cars.*/
SELECT 
    (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM train WHERE Manufacturer = 'TOYOTA') AS Per_above_avg
FROM train
WHERE Manufacturer = 'TOYOTA'
AND Price > (SELECT AVG(Price) FROM train);
/* Answer: 29.601310759148 */






