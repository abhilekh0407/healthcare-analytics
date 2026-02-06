CREATE VIEW vw_hospital_base AS
SELECT
    a.admission_id,
    a.patient_id,
    c.name AS patient_name,
    c.gender,
    c.city,
    c.state,
    a.department,
    a.admission_type,
    a.admission_date,
    a.discharge_date,
    DATEDIFF(a.discharge_date, a.admission_date) AS length_of_stay,
    b.total_amount,
    b.insurance_covered,
    b.patient_paid,
    b.payment_mode
FROM patient.admission a
JOIN patient.cust c
    ON a.patient_id = c.patient_id
JOIN patient.billing b
    ON a.admission_id = b.admission_id;


SELECT * FROM vw_hospital_base LIMIT 10;
