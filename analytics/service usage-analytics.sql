-- Most used services across all clinics
SELECT 
    sc.service_name,
    COUNT(cv.visit_id) AS usage_count
FROM 
    clinic_visit cv
JOIN 
    service_category sc ON cv.service_category_id = sc.service_category_id
GROUP BY 
    sc.service_name
ORDER BY 
    usage_count DESC;  -- descending, so most used first


--- Most used services per clinic
SELECT 
    c.clinic_name,
    sc.service_name,
    COUNT(cv.visit_id) AS usage_count
FROM 
    clinic_visit cv
JOIN 
    service_category sc ON cv.service_category_id = sc.service_category_id
JOIN 
    clinic c ON cv.clinic_id = c.clinic_id
GROUP BY 
    c.clinic_name,
    sc.service_name
ORDER BY 
    c.clinic_name,
    usage_count DESC;  -- descending per clinic
