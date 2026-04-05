Q1. Total Fraud Cases 

SELECT COUNT(*) FROM healthcare_fraud WHERE fraud_flag = 1;

Q2. Fraud Percentage 

SELECT (COUNT(CASE WHEN fraud_flag=1 THEN 1 END)*100.0/COUNT(*)) AS fraud_rate
FROM healthcare_fraud

Q3. Top Fraud Providers

SELECT provider_id , COUNT(*) AS fraud_cases 
FROM healthcare_fraud
WHERE fraud_flag = 1
GROUP BY provider_id
ORDER BY fraud_cases DESC
LIMIT 5; 

Q4. Average Fraud Claim Amount 

SELECT AVG(claim_amount)
FROM healthcare_fraud
WHERE fraud_flag = 1;

Q5. Insurance Type with Highest Fraud

SELECT insurance_type , COUNT(*)
FROM healthcare_fraud
WHERE fraud_flag = 1
GROUP BY insurance_type
ORDER BY COUNT(*) DESC;

Q6. Fraud by Age Group 

SELECT 
    CASE 
        WHEN patient_age BETWEEN 18 AND 35 THEN 'Young'
        WHEN patient_age BETWEEN 36 AND 60 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS fraud_count
FROM healthcare_fraud
WHERE fraud_flag = 1
GROUP BY age_group
ORDER BY age_group DESC ;

Q7. High Claim Difference Fraud 

SELECT * FROM healthcare_fraud
WHERE fraud_flag = 1 AND (claim_amount - approved_amount)>5000;

Q8. Monthly Fraud Trend 

SELECT TO_CHAR(claim_date, 'Mon') AS month_name,
COUNT(*) AS fraud_count
FROM healthcare_fraud
WHERE fraud_flag = 1
GROUP BY TO_CHAR(claim_date, 'Mon'), EXTRACT(MONTH FROM claim_date)
ORDER BY EXTRACT(MONTH FROM claim_date);

Q9. Hospitals with Fraud

SELECT hospital_id , Count(*)
FROM healthcare_fraud
WHERE fraud_flag = 1
GROUP BY hospital_id
ORDER BY COUNT(*) DESC
LIMIT 5;

Q10. Avg Length of Stay Fraud vs Genuine

SELECT fraud_flag , AVG(length_of_stay)
FROM healthcare_fraud
GROUP BY fraud_flag;

