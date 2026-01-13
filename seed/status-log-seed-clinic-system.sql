-- STATUS LOG CLEAN UP
-- check-in -> in-progress -> completed
-- INSERT INTO status_log (
--     visit_id,
--     old_status,
--     new_status,
--     status_change_datetime,
--     changed_by
-- )
-- SELECT
--     visit_id,
--     NULL,
--     'Checked In',
--     visit_date + check_in_time,
--     'Reception'
-- FROM clinic_visit
-- WHERE visit_status = 'Completed';

-- ----- in-progress
-- INSERT INTO status_log (
--     visit_id,
--     old_status,
--     new_status,
--     status_change_datetime,
--     changed_by
-- )
-- SELECT
--     visit_id,
--     'Checked In',
--     'In Progress',
--     visit_date + check_in_time + INTERVAL '30 minutes',
--     'Nurse'
-- FROM clinic_visit
-- WHERE visit_status = 'Completed';

-- ------ completed
-- INSERT INTO status_log (
--     visit_id,
--     old_status,
--     new_status,
--     status_change_datetime,
--     changed_by
-- )
-- SELECT
--     visit_id,
--     'In Progress',
--     'Completed',
--     visit_date + check_out_time,
--     'System'
-- FROM clinic_visit
-- WHERE visit_status = 'Completed';

----------------------------------------------------------------------

-- --- waiting logs
-- INSERT INTO status_log (
--     visit_id,
--     old_status,
--     new_status,
--     status_change_datetime,
--     changed_by
-- )
-- SELECT
--     visit_id,
--     NULL,
--     'Checked In',
--     visit_date + check_in_time,
--     'Reception'
-- FROM clinic_visit
-- WHERE visit_status = 'Waiting';

----------------------------------------------------------------------

---- HOPEFUL: CHECK-IN --> CANCELLED (TODO: work on this later!)
-- ===============================================
-- SEED STATUS_LOG FOR CANCELLED VISITS (REALISTIC)
-- ===============================================
-- DO $$
-- DECLARE
--     i INT;
--     genders TEXT[] := ARRAY['Male', 'Female'];
--     nationalities TEXT[] := ARRAY['South African', 'Zimbabwean', 'Mozambican'];
--     vulnerable_flags TEXT[] := ARRAY['Yes', 'No'];
-- BEGIN
--     FOR i IN 1..18 LOOP
--         PERFORM add_patient_and_checkin_cancel(
--             genders[1 + (i % 2)],
--             DATE '1990-01-01' + (i * 365),
--             nationalities[1 + (i % array_length(nationalities,1))],
--             vulnerable_flags[1 + (i % 2)]
--         );
--     END LOOP;
-- END;
-- $$;





