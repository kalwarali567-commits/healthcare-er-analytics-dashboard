--Healthcare Revenue Analysis by Payment Status
SELECT
	payment_status,
	SUM(bill_amount) AS total_revenue
FROM hospital_er_visits
GROUP BY payment_status
ORDER BY total_revenue DESC;



--Emergency Room Wait Time Analysis by Shift
SELECT
	visit_shift,
	ROUND(AVG(wait_time_min),2) AS avg_wait_time
FROM hospital_er_visits
GROUP BY visit_shift
ORDER BY avg_wait_time DESC;




--Patient Satisfication Analysis Across Hospital Departments
SELECT
	department,
	ROUND(AVG(patient_satisfication),2) AS avg_patient_satisfication
FROM hospital_er_visits
GROUP BY department
ORDER BY avg_patient_satisfication DESC;






--High-Risk Diagnosis & Hospital Admission Analysis
SELECT
	diagnosis,
	COUNT(*) AS total_admissions
FROM hospital_er_visits
WHERE admitted = 'Yes'
GROUP BY diagnosis
ORDER BY total_admissions DESC;


--Insurance Claim & Pending Revenue Analysis
SELECT
	insurance_provider,
	COUNT(*) AS total_pending_cases,
	SUM(bill_amount) AS pending_revenue
FROM hospital_er_visits
WHERE payment_status = 'Pending'
GROUP BY insurance_provider
ORDER BY pending_revenue DESC;

