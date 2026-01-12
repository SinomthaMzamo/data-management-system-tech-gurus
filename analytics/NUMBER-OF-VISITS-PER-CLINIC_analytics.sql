-- TOTAL NUMBER OF VISITS PER CLINIC (DAILY)  
SELECT 
    clinic_id,
    visit_date,
    COUNT(*) AS visit_count
FROM 
    clinic_visit
GROUP BY 
    clinic_id,
    visit_date
ORDER BY 
    clinic_id,
    visit_date;


-- TOTAL NUMBER OF VISITS PER CLINIC (WEEKLY)
SELECT 
    clinic_id,
    DATE_TRUNC('week', visit_date) AS week_starting,
    COUNT(*) AS visit_count
FROM 
    clinic_visit
GROUP BY 
    clinic_id,
    DATE_TRUNC('week', visit_date)
ORDER BY 
    clinic_id,
    week_starting;


-- TOTAL NUMBER OF VISITS PER CLINIC (MONTHLY)
SELECT 
    clinic_id,
    DATE_TRUNC('month', visit_date) AS month,
    COUNT(*) AS visit_count
FROM 
    clinic_visit
GROUP BY 
    clinic_id,
    DATE_TRUNC('month', visit_date)
ORDER BY 
    clinic_id,
    month;


-- TOTAL NUMBER OF VISITS PER CLINIC (ANNUALLY)
SELECT 
    clinic_id,
    DATE_TRUNC('year', visit_date) AS year,
    COUNT(*) AS visit_count
FROM 
    clinic_visit
GROUP BY 
    clinic_id,
    DATE_TRUNC('year', visit_date)
ORDER BY 
    clinic_id,
    year;

