CREATE OR REPLACE FUNCTION seed_clinic_visits_realistic()
RETURNS void AS $$
DECLARE
    v_clinic RECORD;
    v_staff RECORD;
    v_service RECORD;
    v_patient_id INT;
    v_gender TEXT;
    v_dob DATE;
    v_nationality TEXT := 'South African';
    v_vulnerable TEXT;
    v_check_in TIME;
    v_check_out TIME;
    v_visit_status TEXT;
    v_num_visits INT;
    i INT;
    existing_patients INT;
BEGIN
    FOR v_clinic IN SELECT * FROM clinic LOOP
        -- Random number of visits per clinic (20–50)
        v_num_visits := 20 + FLOOR(RANDOM() * 31);

        FOR i IN 1..v_num_visits LOOP
            -- Pick a random staff from the clinic
            SELECT staff_id INTO v_staff
            FROM staff
            WHERE clinic_id = v_clinic.clinic_id
            ORDER BY RANDOM()
            LIMIT 1;

            -- Pick a random service category
            SELECT service_category_id INTO v_service
            FROM service_category
            ORDER BY RANDOM()
            LIMIT 1;

            -- Randomly select existing patient
            SELECT patient_id INTO v_patient_id
            FROM patient
            ORDER BY RANDOM()
            LIMIT 1;

            -- If no patients exist, create a new one
            IF v_patient_id IS NULL THEN
                v_gender := CASE WHEN RANDOM() < 0.5 THEN 'Male' ELSE 'Female' END;
                v_dob := CURRENT_DATE - (RANDOM() * 47 + 18)::INT * 365; -- 18–65 years old
                v_vulnerable := CASE WHEN RANDOM() < 0.2 THEN 'Yes' ELSE 'No' END;

                INSERT INTO patient (gender, date_of_birth, nationality, vulnerable_group_flag)
                VALUES (v_gender, v_dob, v_nationality, v_vulnerable)
                RETURNING patient_id INTO v_patient_id;
            END IF;

            -- Random visit status probabilities
            v_visit_status := CASE 
                                WHEN RANDOM() < 0.7 THEN 'Completed'
                                WHEN RANDOM() < 0.9 THEN 'Waiting'
                                ELSE 'Cancelled'
                              END;

            -- Random check-in time 07:00–10:00
            v_check_in := TIME '07:00' + (RANDOM() * INTERVAL '3 hours');

            -- Random check-out time 1–3 hours after check-in (only for Completed)
            IF v_visit_status = 'Completed' THEN
                v_check_out := v_check_in + INTERVAL '1 hour' + (RANDOM() * INTERVAL '2 hours');
            ELSE
                v_check_out := NULL;
            END IF;

            -- Insert the clinic_visit
            INSERT INTO clinic_visit (
                patient_id,
                clinic_id,
                staff_id,
                service_category_id,
                visit_date,
                check_in_time,
                check_out_time,
                visit_status
            ) VALUES (
                v_patient_id,
                v_clinic.clinic_id,
                v_staff.staff_id,
                v_service.service_category_id,
                CURRENT_DATE - (RANDOM() * 30)::INT, -- past 30 days
                v_check_in,
                v_check_out,
                v_visit_status
            );
        END LOOP;
    END LOOP;

    RAISE NOTICE 'Seeding of clinic visits completed!';
END;
$$ LANGUAGE plpgsql;
