--Kroger's is a very popular grocery chain in the US. They offer a membership card in exchange for a discount on select items. Customers can still shop at Krogers without the card.

--Write a query to find the percentage of customers who shop at Kroger's who also have a Kroger's membership card. Round to 2 decimal places.

SELECT 
    ROUND(CAST(COUNT(CASE WHEN has_member_card = 'Y' THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS Percentage_with_Membership
FROM customers
WHERE kroger_id IS NOT NULL;
