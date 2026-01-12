-- 🕒 Average waiting time per clinic (weekly)
SELECT
    c.clinic_name,
    DATE_TRUNC('week', cv.visit_date) AS week_starting,
    AVG(
        EXTRACT(EPOCH FROM (cv.check_out_time - cv.check_in_time)) / 60
    ) AS avg_waiting_time_minutes
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
WHERE
    cv.visit_status = 'Completed'
    AND cv.check_in_time IS NOT NULL
    AND cv.check_out_time IS NOT NULL
GROUP BY
    c.clinic_name,
    DATE_TRUNC('week', cv.visit_date)
ORDER BY
    c.clinic_name,
    week_starting;

-- 🕒 Average waiting time per clinic (monthly)
SELECT
    c.clinic_name,
    DATE_TRUNC('month', cv.visit_date) AS month_starting,
    AVG(
        EXTRACT(EPOCH FROM (cv.check_out_time - cv.check_in_time)) / 60
    ) AS avg_waiting_time_minutes
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
WHERE
    cv.visit_status = 'Completed'
    AND cv.check_in_time IS NOT NULL
    AND cv.check_out_time IS NOT NULL
GROUP BY
    c.clinic_name,
    DATE_TRUNC('month', cv.visit_date)
ORDER BY
    c.clinic_name,
    month_starting;


-- 🏥 Average waiting time per health district (weekly)
SELECT
    c.health_district,
    AVG(
        EXTRACT(EPOCH FROM (cv.check_out_time - cv.check_in_time)) / 60
    ) AS avg_waiting_time_minutes
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
WHERE
    cv.visit_status = 'Completed'
    AND cv.check_in_time IS NOT NULL
    AND cv.check_out_time IS NOT NULL
    AND cv.visit_date >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY
    c.health_district
ORDER BY
    avg_waiting_time_minutes DESC;


-- 🏥 Average waiting time per health district (monthly)
SELECT
    c.health_district,
    AVG(
        EXTRACT(EPOCH FROM (cv.check_out_time - cv.check_in_time)) / 60
    ) AS avg_waiting_time_minutes
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
WHERE
    cv.visit_status = 'Completed'
    AND cv.check_in_time IS NOT NULL
    AND cv.check_out_time IS NOT NULL
    AND cv.visit_date >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY
    c.health_district
ORDER BY
    avg_waiting_time_minutes DESC;


