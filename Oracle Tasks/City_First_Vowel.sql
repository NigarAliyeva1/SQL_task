--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

--Input Format

--The STATION table is described as follows:

select city from station
where lower(substr(city,1,1)) in ('i','e', 'a', 'e', 'i','o','u')
and lower(substr(city,-1,1)) in ('i','e', 'a', 'e', 'i','o','u');
