--Sarah's Bike Shop sells a lot of bikes and wants to know what the average sale price is of her bikes.

--She sometimes gives away a bike for free for a charity event and if she does she leaves the price of the bike as blank, but marks it sold.

--Write a query to show her the average sale price of bikes for only bikes that were sold, and not donated.

--Round answer to 2 decimal places.

SELECT ROUND(AVG(CAST(bike_price AS DECIMAL(10,2))),2) FROM inventory
Where bike_price is not NULL and bike_sold='Y'
