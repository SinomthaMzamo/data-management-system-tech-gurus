-- Count of visits cancelled after check-in
SELECT 
    COUNT(*) AS cancelled_after_checkin
FROM 
    clinic_visit
WHERE 
    check_in_time IS NOT NULL  -- patient actually checked in
    AND visit_status = 'Cancelled';


-- Breakdown by clinic
SELECT 
    c.clinic_name,
    COUNT(*) AS cancelled_after_checkin
FROM 
    clinic_visit cv
JOIN 
    clinic c ON cv.clinic_id = c.clinic_id
WHERE 
    cv.check_in_time IS NOT NULL
    AND cv.visit_status = 'Cancelled'
GROUP BY 
    c.clinic_name
ORDER BY 
    cancelled_after_checkin DESC;  -- most cancellations first
	

---Weekly cancellations after checking in
SELECT
    DATE_TRUNC('week', cv.visit_date) AS week_starting,
    COUNT(*) FILTER (WHERE cv.visit_status = 'Cancelled') AS cancelled_count,
    COUNT(*) FILTER (WHERE cv.visit_status IN ('Checked In','Cancelled','Completed')) AS total_checked_in,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE cv.visit_status = 'Cancelled') /
        NULLIF(COUNT(*) FILTER (WHERE cv.visit_status IN ('Checked In','Cancelled','Completed')),0),
        2
    ) AS cancellation_percentage
FROM clinic_visit cv
GROUP BY DATE_TRUNC('week', cv.visit_date)
ORDER BY week_starting;


-- Monthly cancellations after checking in per clinic
SELECT
    DATE_TRUNC('month', cv.visit_date) AS month_starting,
    COUNT(*) FILTER (WHERE cv.visit_status = 'Cancelled') AS cancelled_count,
    COUNT(*) FILTER (WHERE cv.visit_status IN ('Checked In','Cancelled','Completed')) AS total_checked_in,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE cv.visit_status = 'Cancelled') /
        NULLIF(COUNT(*) FILTER (WHERE cv.visit_status IN ('Checked In','Cancelled','Completed')),0),
        2
    ) AS cancellation_percentage
FROM clinic_visit cv
GROUP BY DATE_TRUNC('month', cv.visit_date)
ORDER BY month_starting;



-- Weekly cancellations after check-in by health district
SELECT
    c.health_district,
    DATE_TRUNC('week', cv.visit_date) AS week_starting,
    COUNT(*) AS cancelled_count
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
WHERE cv.visit_status = 'Cancelled'
GROUP BY
    c.health_district,
    DATE_TRUNC('week', cv.visit_date)
ORDER BY
    week_starting,
    cancelled_count DESC;

-- Monthly cancellations after check-in by health district

SELECT
    c.health_district,
    DATE_TRUNC('month', cv.visit_date) AS month_starting,
    COUNT(*) AS cancelled_count
FROM clinic_visit cv
JOIN clinic c ON cv.clinic_id = c.clinic_id
WHERE cv.visit_status = 'Cancelled'
GROUP BY
    c.health_district,
    DATE_TRUNC('month', cv.visit_date)
ORDER BY
    month_starting,
    cancelled_count DESC;

	
