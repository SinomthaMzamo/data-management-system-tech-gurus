CREATE TABLE IF NOT EXISTS geography (
    geography_id SERIAL PRIMARY KEY,
    suburb VARCHAR(100),
    ward_number VARCHAR(20),
    district VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS clinic (
    clinic_id SERIAL PRIMARY KEY,
    clinic_name VARCHAR(100),
    geography_id INTEGER,
    health_district VARCHAR(100),
    CONSTRAINT fk_clinic_geography
        FOREIGN KEY (geography_id)
        REFERENCES geography(geography_id)
);

CREATE TABLE IF NOT EXISTS staff (
    staff_id SERIAL PRIMARY KEY,
    clinic_id INTEGER,
    role VARCHAR(50),
    employment_type VARCHAR(50),
    CONSTRAINT fk_staff_clinic
        FOREIGN KEY (clinic_id)
        REFERENCES clinic(clinic_id)
);

CREATE TABLE IF NOT EXISTS service_category (
    service_category_id SERIAL PRIMARY KEY,
    service_name VARCHAR(100),
    description VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS patient (
    patient_id SERIAL PRIMARY KEY,
    gender VARCHAR(10),
    date_of_birth DATE,
    nationality VARCHAR(50),
    vulnerable_group_flag VARCHAR(10)
);

CREATE TABLE  IF NOT EXISTS clinic_visit (

    visit_id SERIAL PRIMARY KEY,

    patient_id INTEGER,

    clinic_id INTEGER,

    staff_id INTEGER,

    service_category_id INTEGER,

    visit_date DATE,

    check_in_time TIME,

    check_out_time TIME,

    visit_status VARCHAR(50),
 
    CONSTRAINT fk_visit_patient

        FOREIGN KEY (patient_id)

        REFERENCES patient(patient_id),
 
    CONSTRAINT fk_visit_clinic

        FOREIGN KEY (clinic_id)

        REFERENCES clinic(clinic_id),
 
    CONSTRAINT fk_visit_staff

        FOREIGN KEY (staff_id)

        REFERENCES staff(staff_id),
 
    CONSTRAINT fk_visit_service

        FOREIGN KEY (service_category_id)

        REFERENCES service_category(service_category_id)

);

 
CREATE TABLE IF NOT EXISTS service_category (

    service_category_id SERIAL PRIMARY KEY,

    service_name VARCHAR(100),

    description VARCHAR(255)

);


CREATE TABLE IF NOT EXISTS status_log (
    status_log_id SERIAL PRIMARY KEY,
    visit_id INTEGER,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    status_change_datetime TIMESTAMP,
    changed_by VARCHAR(50),
 
    CONSTRAINT fk_status_visit
        FOREIGN KEY (visit_id)
        REFERENCES clinic_visit(visit_id)
);


------- DELETE WITH CASCADE
--- STATUS LOG
-- Drop the existing FK
ALTER TABLE status_log
DROP CONSTRAINT fk_status_visit;

-- Recreate it with ON DELETE CASCADE
ALTER TABLE status_log
ADD CONSTRAINT fk_status_visit
FOREIGN KEY (visit_id)
REFERENCES clinic_visit(visit_id)
ON DELETE CASCADE;

--- CLINIC
-- Drop the existing FK
-- ALTER TABLE clinic
-- DROP CONSTRAINT fk_clinic_geography;

-- -- Recreate it with ON DELETE CASCADE
-- ALTER TABLE clinic
-- ADD CONSTRAINT fk_clinic_geography
-- FOREIGN KEY (geography_id)
-- REFERENCES geography(geography_id)
-- ON DELETE CASCADE;
