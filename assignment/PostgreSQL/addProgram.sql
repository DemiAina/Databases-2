-- Create the add_program function
CREATE OR REPLACE FUNCTION add_program(
    p_program_name VARCHAR,
    p_date TIMESTAMP,
    p_target_audience_id INTEGER)
    RETURNS INTEGER AS 
$$
DECLARE
    v_program_id INTEGER;
BEGIN
    INSERT INTO program (program_name, "Date", target_audience_target_id)
    VALUES (p_program_name, p_date, p_target_audience_id)
    RETURNING program_id INTO v_program_id;
    
    RETURN v_program_id;
EXCEPTION
    WHEN OTHERS THEN
    RAISE info 'Error Description:%',SQLERRM;
    RAISE info 'Error Code:%', SQLSTATE;
END;
$$ LANGUAGE plpgsql;
