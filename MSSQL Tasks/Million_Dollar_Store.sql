--Write a query that returns all of the stores whose average yearly revenue is greater than one million dollars.

--Output the store ID and average revenue. Round the average to 2 decimal places.

--Order by store ID.

SELECT store_id,ROUND(avg(CAST(revenue AS DECIMAL(10, 2))), 2) FROM stores
group by store_id
HAVING avg(revenue) >1000000
order by store_id

