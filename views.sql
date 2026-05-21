

--Revenue Summary
CREATE VIEW vw_revenue_summary AS
SELECT
    payment_status,
    COUNT(*) AS total_patients,
    SUM(bill_amount) AS total_revenue
FROM hospital_er_visits
GROUP BY payment_status;



--Wait Time Analysis
CREATE VIEW wait_time_analysis AS
SELECT
	 visit_shift,
    ROUND(AVG(wait_time_min),2) AS avg_wait_time
FROM hospital_er_visits
GROUP BY visit_shift;

SELECT * FROM hospital_er_visits

--Patient Satisfaction
CREATE VIEW vw_patient_satisfication AS
SELECT
    department,
    ROUND(AVG(patient_satisfication),2) AS avg_satisfaction
FROM hospital_er_visits
GROUP BY department;





--High-Risk Admissions
CREATE VIEW vw_high_risk_admissions AS
SELECT
    diagnosis,
    COUNT(*) AS total_admissions
FROM hospital_er_visits
WHERE admitted = 'Yes'
GROUP BY diagnosis
ORDER BY total_admissions DESC;


--Insurance Pending Revenue
CREATE VIEW vw_insurance_pending_revenue AS
SELECT
    insurance_provider,
    COUNT(*) AS total_pending_cases,
    SUM(bill_amount) AS pending_revenue
FROM hospital_er_visits
WHERE payment_status = 'Pending'
GROUP BY insurance_provider
ORDER BY pending_revenue DESC;


