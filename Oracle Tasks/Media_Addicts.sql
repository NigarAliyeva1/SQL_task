--Social Media Addiction can be a crippling disease affecting millions every year.

--We need to identify people who may fall into that category.

--Write a query to find the people who spent a higher than average amount of time on social media.

--Provide just their first names alphabetically so we can reach out to them individually.

SELECT u.first_name FROM user_time t join users u on t.user_id=u.user_id
WHERE t.media_time_minutes> (Select avg(media_time_minutes) from user_time)
order by u.first_name
