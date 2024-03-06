--Write a query to determine how many direct reports each Manager has.

--Note: Managers will have "Manager" in their title.

--Report the Manager ID, Manager Title, and the number of direct reports in your output.

SELECT m.employee_id,m.position,COUNT(r.employee_id) FROM direct_reports m join direct_reports r on m.employee_id=r.managers_id
WHERE m.position like '%Manager%'
group by m.employee_id,m.position
