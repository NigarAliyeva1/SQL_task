--Tesla just provided their quarterly sales for their major vehicles.

--Determine which Tesla Model has made the most profit.

--Include all columns with the "profit" column at the end.

SELECT TOP 1 tesla_model, car_price, cars_sold, production_cost, 
    CAST((CAST(car_price AS DECIMAL(18, 2)) - CAST(production_cost AS DECIMAL(18, 2))) * CAST(cars_sold AS DECIMAL(18, 2)) AS DECIMAL(18, 2)) AS profit
FROM tesla_models
ORDER BY profit DESC;
