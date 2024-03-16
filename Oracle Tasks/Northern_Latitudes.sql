--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

--Input Format

--The STATION table is described as follows:

--where LAT_N is the northern latitude and LONG_W is the western longitude.


select MAX(trunc(LAT_N,4)) from station
where LAT_N<137.2345;
