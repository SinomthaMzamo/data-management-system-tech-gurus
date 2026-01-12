-- ===============================================
-- FUNCTION: seed_clinics()
-- Inserts all main Cape Town clinics using the geography table
-- ===============================================
CREATE OR REPLACE FUNCTION seed_clinics()
RETURNS void AS $$
BEGIN
    -- Khayelitsha Clinics
    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Khayelitsha Site B Clinic', geography_id, district
    FROM geography WHERE suburb = 'Site B (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Khayelitsha Site C Clinic', geography_id, district
    FROM geography WHERE suburb = 'Site C (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Mayenzeke Clinic', geography_id, district
    FROM geography WHERE suburb = 'Mayenzeke (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Zakhele Clinic', geography_id, district
    FROM geography WHERE suburb = 'Zakhele (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Kuyasa Clinic', geography_id, district
    FROM geography WHERE suburb = 'Kuyasa (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Town 2 Clinic', geography_id, district
    FROM geography WHERE suburb = 'Town 2 CDC (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Site B Male Clinic', geography_id, district
    FROM geography WHERE suburb = 'Site B Male (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Site B Youth Clinic', geography_id, district
    FROM geography WHERE suburb = 'Site B Youth (Khayelitsha)'
    ON CONFLICT DO NOTHING;

    -- Mitchells Plain Clinics
    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Mitchells Plain CHC', geography_id, district
    FROM geography WHERE suburb = 'Mitchells Plain Central'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Strandfontein Clinic', geography_id, district
    FROM geography WHERE suburb = 'Strandfontein'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Westridge Clinic', geography_id, district
    FROM geography WHERE suburb = 'Westridge'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Wesbank Clinic', geography_id, district
    FROM geography WHERE suburb = 'Wesbank'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Tafelsig Clinic', geography_id, district
    FROM geography WHERE suburb = 'Tafelsig'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Tafelsig CDC', geography_id, district
    FROM geography WHERE suburb = 'Tafelsig CDC'
    ON CONFLICT DO NOTHING;

    -- Gugulethu / Nyanga Clinics
    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Gugulethu CHC', geography_id, district
    FROM geography WHERE suburb = 'Gugulethu'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Nyanga CHC', geography_id, district
    FROM geography WHERE suburb = 'Nyanga'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Masincedane Clinic', geography_id, district
    FROM geography WHERE suburb = 'Masincedane (Nyanga)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Vuyani Clinic', geography_id, district
    FROM geography WHERE suburb = 'Vuyani (Gugulethu)'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Ikhwezi CDC', geography_id, district
    FROM geography WHERE suburb = 'Ikhwezi CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Luvuyo CDC', geography_id, district
    FROM geography WHERE suburb = 'Luvuyo CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Matthew Goniwe CDC', geography_id, district
    FROM geography WHERE suburb = 'Matthew Goniwe CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Pelican Park CDC', geography_id, district
    FROM geography WHERE suburb = 'Pelican Park CDC'
    ON CONFLICT DO NOTHING;

    -- Langa / Hanover Park / Athlone / Bonteheuwel Clinics
    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Langa CHC', geography_id, district
    FROM geography WHERE suburb = 'Langa'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Hanover Park Clinic', geography_id, district
    FROM geography WHERE suburb = 'Hanover Park'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Athlone Clinic', geography_id, district
    FROM geography WHERE suburb = 'Athlone'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Athlone South Clinic', geography_id, district
    FROM geography WHERE suburb = 'Athlone South'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Bonteheuwel CDC', geography_id, district
    FROM geography WHERE suburb = 'Bonteheuwel'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Rocklands Clinic', geography_id, district
    FROM geography WHERE suburb = 'Rocklands'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Manenberg Clinic', geography_id, district
    FROM geography WHERE suburb = 'Manenberg'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Lavender Hill Clinic', geography_id, district
    FROM geography WHERE suburb = 'Lavender Hill'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Lansdowne Clinic', geography_id, district
    FROM geography WHERE suburb = 'Lansdowne'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Claremont Clinic', geography_id, district
    FROM geography WHERE suburb = 'Claremont'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Rondebosch Clinic', geography_id, district
    FROM geography WHERE suburb = 'Rondebosch'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Wynberg Clinic', geography_id, district
    FROM geography WHERE suburb = 'Wynberg'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Hout Bay Clinic', geography_id, district
    FROM geography WHERE suburb = 'Hout Bay'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Fish Hoek Clinic', geography_id, district
    FROM geography WHERE suburb = 'Fish Hoek'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Muizenberg Clinic', geography_id, district
    FROM geography WHERE suburb = 'Muizenberg'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Albow Gardens CDC', geography_id, district
    FROM geography WHERE suburb = 'Albow Gardens CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Dr Ivan Toms CDC', geography_id, district
    FROM geography WHERE suburb = 'Dr Ivan Toms CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Gordon''s Bay CDC', geography_id, district
    FROM geography WHERE suburb = 'Gordon''s Bay CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Sir Lowry''s Pass CDC', geography_id, district
    FROM geography WHERE suburb = 'Sir Lowry''s Pass CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'St Vincent CDC', geography_id, district
    FROM geography WHERE suburb = 'St Vincent CDC'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Masiphumelele Clinic', geography_id, district
    FROM geography WHERE suburb = 'Masiphumelele'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Ocean View Clinic', geography_id, district
    FROM geography WHERE suburb = 'Ocean View'
    ON CONFLICT DO NOTHING;

    INSERT INTO clinic (clinic_name, geography_id, health_district)
    SELECT 'Site C Youth Clinic', geography_id, district
    FROM geography WHERE suburb = 'Site C Youth (Salt River)'
    ON CONFLICT DO NOTHING;

    RAISE NOTICE 'All Cape Town clinics seeded successfully.';
END;
$$ LANGUAGE plpgsql;
