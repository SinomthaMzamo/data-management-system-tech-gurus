CREATE OR REPLACE FUNCTION add_patient_and_checkin_cancel(
    p_gender VARCHAR,
    p_dob DATE,
    p_nationality VARCHAR,
    p_vulnerable_group_flag VARCHAR
)
RETURNS VOID AS $$
DECLARE
    v_patient_id INT;
    v_clinic_id INT;
    v_staff_id INT;
    v_service_category_id INT;
    v_visit_id INT;
BEGIN
    -- 1. Add a new patient
    INSERT INTO patient (gender, date_of_birth, nationality, vulnerable_group_flag)
    VALUES (p_gender, p_dob, p_nationality, p_vulnerable_group_flag)
    RETURNING patient_id INTO v_patient_id;

    -- 2. Pick a random clinic
    SELECT clinic_id INTO v_clinic_id
    FROM clinic
    ORDER BY RANDOM() LIMIT 1;

    -- 3. Pick a random staff for that clinic
    SELECT staff_id INTO v_staff_id
    FROM staff
    WHERE clinic_id = v_clinic_id
    ORDER BY RANDOM() LIMIT 1;

    -- 4. Pick a random service category
    SELECT service_category_id INTO v_service_category_id
    FROM service_category
    ORDER BY RANDOM() LIMIT 1;

    -- 5. Create the clinic visit (initially 'checked-in')
    INSERT INTO clinic_visit (
        patient_id,
        clinic_id,
        staff_id,
        service_category_id,
        visit_date,
        check_in_time,
        visit_status
    )
    VALUES (
        v_patient_id,
        v_clinic_id,
        v_staff_id,
        v_service_category_id,
        CURRENT_DATE,
        CURRENT_TIME,
        'Checked In'
    )
    RETURNING visit_id INTO v_visit_id;

    -- 6. Log the check-in
    INSERT INTO status_log (
        visit_id,
        old_status,
        new_status,
        status_change_datetime,
        changed_by
    )
    VALUES (
        v_visit_id,
        NULL,
        'Checked In',
        NOW(),
        'System'
    );

    -- 7. Log the cancellation (this will also update clinic_visit due to trigger)
    INSERT INTO status_log (
        visit_id,
        old_status,
        new_status,
        status_change_datetime,
        changed_by
    )
    VALUES (
        v_visit_id,
        'Checked In',
        'Cancelled',
        NOW(),
        'System'
    );

END;
$$ LANGUAGE plpgsql;
