-- SEED THE DATABASE
-- GEOGRAPHY SAMPLE DATA
-- INSERT INTO geography (suburb, ward_number, district) VALUES
-- -- Khayelitsha Area
-- ('Khayelitsha', '18', 'Khayelitsha Health District'),
-- ('Site B (Khayelitsha)', '19', 'Khayelitsha Health District'),
-- ('Site C (Khayelitsha)', '20', 'Khayelitsha Health District'),
-- ('Mayenzeke (Khayelitsha)', '21', 'Khayelitsha Health District'),
-- ('Zakhele (Khayelitsha)', '22', 'Khayelitsha Health District'),
-- ('Kuyasa (Khayelitsha)', '23', 'Khayelitsha Health District'),

-- -- Mitchells Plain Area
-- ('Mitchells Plain Central', '81', 'Mitchells Plain Health District'),
-- ('Strandfontein', '82', 'Mitchells Plain Health District'),
-- ('Westridge', '83', 'Mitchells Plain Health District'),
-- ('Wesbank', '84', 'Mitchells Plain Health District'),
-- ('Tafelsig', '85', 'Mitchells Plain Health District'),

-- -- Gugulethu / Nyanga Area
-- ('Gugulethu', '44', 'Eastern Substructure'),
-- ('Nyanga', '37', 'Eastern Substructure'),
-- ('Masincedane (Nyanga)', '38', 'Eastern Substructure'),
-- ('Vuyani (Gugulethu)', '45', 'Eastern Substructure'),

-- -- Langa / Hanover Park / Athlone Area
-- ('Langa', '51', 'Eastern Substructure'),
-- ('Hanover Park', '48', 'Southern Substructure'),
-- ('Athlone', '46', 'Southern Substructure'),
-- ('Bonteheuwel', '45', 'Southern Substructure'),
-- ('Rocklands', '47', 'Southern Substructure'),

-- -- Delft / Kraaifontein / Northern Substructure
-- ('Delft', '15', 'Northern Substructure'),
-- ('Kraaifontein', '2', 'Northern Substructure'),
-- ('Northpine (Brackenfell)', '3', 'Northern Substructure'),
-- ('Bloekombos', '4', 'Northern Substructure'),

-- -- Other Cape Town suburbs
-- ('Claremont', '10', 'Southern Substructure'),
-- ('Rondebosch', '11', 'Southern Substructure'),
-- ('Wynberg', '12', 'Southern Substructure'),
-- ('Table View', '50', 'Northern Substructure'),
-- ('Melkbosstrand', '5', 'Northern Substructure'),
-- ('Hout Bay', '6', 'Southern Substructure'),
-- ('Fish Hoek', '7', 'Southern Substructure'),
-- ('Muizenberg', '8', 'Southern Substructure'),
-- ('Brackenfell', '1', 'Northern Substructure'),
-- ('Kuilsriver', '16', 'Northern Substructure'),
-- ('Athlone South', '49', 'Southern Substructure'),
-- ('Lansdowne', '52', 'Southern Substructure'),
-- ('Lavender Hill', '53', 'Southern Substructure'),
-- ('Manenberg', '54', 'Southern Substructure'),
-- ('Elsies River', '55', 'Northern Substructure'),

-- -- Philippi / Mzamomhle / surrounding
-- ('Philippi', '56', 'Southern Substructure'),
-- ('Phumlani (Phillipi East)', '57', 'Southern Substructure'),
-- ('Mzamomhle (Phillipi/Browns Farm)', '58', 'Southern Substructure'),

-- -- Ocean View / Masiphumelele / Kommetjie
-- ('Masiphumelele', '59', 'Southern Substructure'),
-- ('Ocean View', '60', 'Southern Substructure'),

-- -- CDCs & Special Clinics
-- ('Albow Gardens CDC', '30', 'Southern Substructure'),
-- ('Dr Ivan Toms CDC', '31', 'Southern Substructure'),
-- ('Gordon''s Bay CDC', '32', 'Southern Substructure'),
-- ('Ikhwezi CDC', '33', 'Eastern Substructure'),
-- ('Luvuyo CDC', '34', 'Eastern Substructure'),
-- ('Matthew Goniwe CDC', '35', 'Eastern Substructure'),
-- ('Pelican Park CDC', '36', 'Eastern Substructure'),
-- ('Sir Lowry''s Pass CDC', '39', 'Southern Substructure'),
-- ('St Vincent CDC', '40', 'Southern Substructure'),
-- ('Tafelsig CDC', '41', 'Mitchells Plain Health District'),
-- ('Town 2 CDC (Khayelitsha)', '42', 'Khayelitsha Health District'),
-- ('Site B Male (Khayelitsha)', '43', 'Khayelitsha Health District'),
-- ('Site B Youth (Khayelitsha)', '50', 'Khayelitsha Health District'),
-- ('Site C Youth (Salt River)', '26', 'Southern Substructure');

-------------------------------------------------------


-- CLINICS SAMPLE DATA
-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Khayelitsha Site B Clinic', geography_id, district
-- FROM geography WHERE suburb = 'Khayelitsha';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Khayelitsha Site C Clinic', geography_id, district
-- FROM geography WHERE suburb = 'Khayelitsha';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Mitchells Plain CHC', geography_id, district
-- FROM geography WHERE suburb = 'Mitchells Plain';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Gugulethu CHC', geography_id, district
-- FROM geography WHERE suburb = 'Gugulethu';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Nyanga CHC', geography_id, district
-- FROM geography WHERE suburb = 'Nyanga';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Langa CHC', geography_id, district
-- FROM geography WHERE suburb = 'Langa';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Delft South Clinic', geography_id, district
-- FROM geography WHERE suburb = 'Delft';

-- INSERT INTO clinic (clinic_name, geography_id, health_district)
-- SELECT 'Bonteheuwel CDC', geography_id, district
-- FROM geography WHERE suburb = 'Bonteheuwel';

-- SELECT seed_clinics();

---------------------------------------------------------------


-- SERVICE CATEGORY SAMPLE DATA
-- INSERT INTO service_category (service_name, description) VALUES
-- ('Primary Healthcare', 'General outpatient services'),
-- ('Maternal Health', 'Antenatal and postnatal care'),
-- ('Child Health', 'Immunisations and growth monitoring'),
-- ('HIV/TB Services', 'Testing, treatment and counselling'),
-- ('Chronic Care', 'Management of chronic illnesses'),
-- ('Emergency Care', 'Urgent and emergency services');

---------------------------------------------------------------


-- STAFF SAMPLE DATA
-- INSERT INTO staff (clinic_id, role, employment_type)
-- SELECT clinic_id, 'Professional Nurse', 'Permanent'
-- FROM clinic;

-- INSERT INTO staff (clinic_id, role, employment_type)
-- SELECT clinic_id, 'Enrolled Nurse', 'Permanent'
-- FROM clinic;

-- INSERT INTO staff (clinic_id, role, employment_type)
-- SELECT clinic_id, 'Medical Officer', 'Sessional'
-- FROM clinic;

-- INSERT INTO staff (clinic_id, role, employment_type)
-- SELECT clinic_id, 'Admin Clerk', 'Contract'
-- FROM clinic;
-- SELECT seed_staff();

-------------------------------------------------------

-- PATIENT SAMPLE DATA
-- INSERT INTO patient (gender, date_of_birth, nationality, vulnerable_group_flag) VALUES
-- ('Female', '1992-06-14', 'South African', 'No'),
-- ('Male', '1985-03-22', 'South African', 'No'),
-- ('Female', '2001-11-02', 'Zimbabwean', 'Yes'),
-- ('Male', '1978-09-10', 'South African', 'No'),
-- ('Female', '2018-05-30', 'South African', 'Yes'),
-- ('Male', '1999-01-17', 'Somali', 'Yes');

-------------------------------------------------------

-- CLINIC VISIT SAMPLE DATA
-- COMPLETED VISITS
-- INSERT INTO clinic_visit (
--     patient_id,
--     clinic_id,
--     staff_id,
--     service_category_id,
--     visit_date,
--     check_in_time,
--     check_out_time,
--     visit_status
-- )
-- SELECT
--     p.patient_id,
--     c.clinic_id,
--     s.staff_id,
--     sc.service_category_id,
--     CURRENT_DATE - (RANDOM() * 30)::INT,
--     TIME '07:30' + (RANDOM() * INTERVAL '2 hours'),
--     TIME '09:00' + (RANDOM() * INTERVAL '3 hours'),
--     'Completed'
-- FROM patient p
-- CROSS JOIN LATERAL (
--     SELECT * FROM clinic ORDER BY RANDOM() LIMIT 1
-- ) c
-- CROSS JOIN LATERAL (
--     SELECT * FROM staff 
--     WHERE staff.clinic_id = c.clinic_id 
--     ORDER BY RANDOM() LIMIT 1
-- ) s
-- CROSS JOIN LATERAL (
--     SELECT * FROM service_category ORDER BY RANDOM() LIMIT 1
-- ) sc
-- LIMIT 50;

----------

-- IN-PROGRESS CLINIC VISIT
-- INSERT INTO clinic_visit (
--     patient_id,
--     clinic_id,
--     staff_id,
--     service_category_id,
--     visit_date,
--     check_in_time,
--     visit_status
-- )
-- SELECT
--     p.patient_id,
--     c.clinic_id,
--     s.staff_id,
--     sc.service_category_id,
--     CURRENT_DATE,
--     TIME '07:00' + (RANDOM() * INTERVAL '3 hours'),
--     'Waiting'
-- FROM patient p
-- JOIN clinic c ON TRUE
-- JOIN staff s ON s.clinic_id = c.clinic_id
-- JOIN service_category sc ON TRUE
-- ORDER BY RANDOM()
-- LIMIT 20;

----------
-- CANCELLED CLINIC VISITS
-- INSERT INTO clinic_visit (
--     patient_id,
--     clinic_id,
--     staff_id,
--     service_category_id,
--     visit_date,
--     visit_status
-- )
-- SELECT
--     p.patient_id,
--     c.clinic_id,
--     s.staff_id,
--     sc.service_category_id,
--     CURRENT_DATE - (RANDOM() * 15)::INT,
--     'Cancelled'
-- FROM patient p
-- JOIN clinic c ON TRUE
-- JOIN staff s ON s.clinic_id = c.clinic_id
-- JOIN service_category sc ON TRUE
-- ORDER BY RANDOM()
-- LIMIT 10;

-- SELECT seed_clinic_visits_realistic();

-------------------------------------------------------


