-- Create a constraint trigger for the program table
CREATE OR REPLACE FUNCTION check_program_constraints()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if the program date isn't before the current date
    IF NEW."Date" < CURRENT_DATE THEN
        RAISE EXCEPTION 'Invalid program data: Program date cannot be in the past';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS enforce_program_constraints ON program;

-- Create a constraint trigger that invokes the function
CREATE CONSTRAINT TRIGGER enforce_program_constraints
AFTER INSERT OR UPDATE ON program
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_program_constraints();


GRANT EXECUTE ON FUNCTION add_program(VARCHAR, TIMESTAMP, INTEGER) TO your_username;
GRANT EXECUTE ON FUNCTION check_program_constraints() TO your_username;
GRANT INSERT, UPDATE ON TABLE program TO your_username;
