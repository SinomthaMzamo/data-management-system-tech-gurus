-- Drop trigger/function if exists
DROP TRIGGER IF EXISTS sync_visit_status ON status_log;
DROP FUNCTION IF EXISTS trg_sync_visit_status();

-- Trigger function
CREATE OR REPLACE FUNCTION trg_sync_visit_status()
RETURNS TRIGGER AS $$
BEGIN
    -- Update clinic_visit status when a new status_log entry is added
    UPDATE clinic_visit
    SET visit_status = NEW.new_status
    WHERE visit_id = NEW.visit_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger after insert on status_log
CREATE TRIGGER sync_visit_status
AFTER INSERT ON status_log
FOR EACH ROW
EXECUTE FUNCTION trg_sync_visit_status();
