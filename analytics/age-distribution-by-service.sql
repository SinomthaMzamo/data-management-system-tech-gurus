-- a) Age group distribution per service category (monthly)
SELECT
    c.health_district,
    sc.service_name,
    DATE_TRUNC('month', cv.visit_date) AS month_starting,
    CASE
        WHEN EXTRACT(YEAR FROM AGE(p.date_of_birth)) BETWEEN 0 AND 17 THEN '0-17'
        WHEN EXTRACT(YEAR FROM AGE(p.date_of_birth)) BETWEEN 18 AND 35 THEN '18-35'
        WHEN EXTRACT(YEAR FROM AGE(p.date_of_birth)) BETWEEN 36 AND 50 THEN '36-50'
        ELSE '51+'
    END AS age_group,
    COUNT(*) AS patient_count
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
JOIN patient p ON cv.patient_id = p.patient_id
JOIN service_category sc ON cv.service_category_id = sc.service_category_id
GROUP BY
    c.health_district,
    sc.service_name,
    DATE_TRUNC('month', cv.visit_date),
    CASE
        WHEN EXTRACT(YEAR FROM AGE(p.date_of_birth)) BETWEEN 0 AND 17 THEN '0-17'
        WHEN EXTRACT(YEAR FROM AGE(p.date_of_birth)) BETWEEN 18 AND 35 THEN '18-35'
        WHEN EXTRACT(YEAR FROM AGE(p.date_of_birth)) BETWEEN 36 AND 50 THEN '36-50'
        ELSE '51+'
    END
ORDER BY
    c.health_district,
    sc.service_name,
    month_starting,
    age_group;
