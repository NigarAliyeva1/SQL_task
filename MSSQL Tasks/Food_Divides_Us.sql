--In the United States, fast food is the cornerstone of it's very society. Without it, it would cease to exist.

--But which region spends the most money on fast food?

--Write a query to determine which region spends the most amount of money on fast food.

With food_regions_grouped as(
SELECT TOP 1 region, SUM(fast_food_millions) as SUM_FOOD  FROM food_regions
GROUP BY region
ORDER BY SUM_FOOD DESC)
select region from food_regions_grouped
