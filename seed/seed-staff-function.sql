CREATE OR REPLACE FUNCTION seed_staff()
RETURNS void AS $$
DECLARE
    c RECORD;
    num_staff INT;
    i INT;
    role_list TEXT[] := ARRAY['Nurse', 'Doctor', 'Admin Clerk', 'Counselor'];
    employment_list TEXT[] := ARRAY['Permanent', 'Contract', 'Temporary'];
BEGIN
    -- Loop through all clinics
    FOR c IN SELECT clinic_id FROM clinic LOOP
        
        -- Random number of staff per clinic (5–15)
        num_staff := (5 + FLOOR(RANDOM() * 11))::INT;

        FOR i IN 1..num_staff LOOP
            INSERT INTO staff (clinic_id, role, employment_type)
            VALUES (
                c.clinic_id,
                role_list[FLOOR(1 + RANDOM() * ARRAY_LENGTH(role_list,1))::INT],
                employment_list[FLOOR(1 + RANDOM() * ARRAY_LENGTH(employment_list,1))::INT]
            );
        END LOOP;

    END LOOP;

    RAISE NOTICE 'Staff seeding complete.';
END;
$$ LANGUAGE plpgsql;
