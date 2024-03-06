--Data was input incorrectly into the database. The ID was combined with the First Name.

--Write a query to separate the ID and First Name into two separate columns.

--Each ID is 5 characters long.
SELECT 
  SUBSTRING(ID,1,5) as ID,
  SUBSTRING(id,6,len(id)) as First_Name
  FROM bad_data;
