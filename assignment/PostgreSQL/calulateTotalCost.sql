CREATE OR REPLACE FUNCTION CalculateTotalCost(
    ad_id INT,
    start_date DATE,
    number_of_runs INT,
    region_id INT
) RETURNS DECIMAL AS $$
DECLARE
    total_cost DECIMAL;
BEGIN
    SELECT 
        SUM(ad_rate * number_of_runs * region_rate)
    INTO 
        total_cost
    FROM 
        ad
    JOIN 
        region ON ad.region_id = region.region_id
    WHERE 
        ad.ad_id = ad_id
        AND region.region_id = region_id;
    RETURN total_cost;

    -- make sure to do the exception handling and the trigger
END;
$$ LANGUAGE plpgsql;
