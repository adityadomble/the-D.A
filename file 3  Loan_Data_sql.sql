CREATE DATABASE LOAN_DATA;
USE  LOAN_DATA;




# 1 Total loan applications
SELECT count(*) AS total_applications
FROM test_loan_db;


SELECT 
    COUNT(DISTINCT Loan_ID) AS unique_loans
FROM
    test_loan_db;





SELECT DISTINCT
    Property_Area
FROM
    test_loan_db;


SELECT 
    Gender, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY Gender
ORDER BY total DESC;


SELECT 
    married, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY married
ORDER BY total DESC;






SELECT 
    Dependents, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY Dependents
ORDER BY total DESC;


SELECT 
    education, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY education
ORDER BY total DESC;


# 9. Loan amount terms available

SELECT DISTINCT
    Loan_Amount_Term
FROM
    test_loan_db;


# 10. Applicants with valid credit history


SELECT 
    Credit_History, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY Credit_History
ORDER BY total DESC;



# 11. Average Applicant Income

SELECT 
    AVG(ApplicantIncome) AS avg_applicant_income
FROM
    test_loan_db;


# 12. Average Coapplicant Income

SELECT 
    AVG(CoapplicantIncome) AS Avg_coapplicant_income
FROM
    test_loan_db;


# 13. Total income per applicant


SELECT 
    Loan_ID, ApplicantIncome + CoapplicantIncome AS total_income
FROM
    test_loan_db;



# 14. Highest income applicant


SELECT 
    *
FROM
    test_loan_db
ORDER BY ApplicantIncome DESC
LIMIT 1;



# 15. Lowest income applicant

SELECT 
    *
FROM
    test_loan_db
ORDER BY ApplicantIncome ASC
LIMIT 1;


# 16. Avg income: Self-employed vs Not


SELECT Self_Employed,
       AVG(ApplicantIncome) AS avg_income
FROM test_loan_db
GROUP BY Self_Employed;



# 17 Avg income: Graduate vs Non-graduate

SELECT 
    education, AVG(applicantincome) AS avg_income
FROM
    test_loan_db
GROUP BY education;


# 18. Avg income: Married vs Unmarried

SELECT 
    married, AVG(applicantincome) AS avg_Income
FROM
    test_loan_db
GROUP BY married;


# 19. Income by property area


SELECT 
    property_area, AVG(applicantincome) AS Avg_Income
FROM
    test_loan_db
GROUP BY property_area;



# 20. Applicants with zero coapplicant income

SELECT 
    *
FROM
    test_loan_db
WHERE
    coapplicantincome = 0;




# 21. Average loan amount

SELECT 
    AVG(loanamount) AS avg_loan_Amount
FROM
    test_loan_db;


# 22. Maximum loan amount

SELECT 
    MAX(loanamount) AS max_loan_amount
FROM
    test_loan_db;



# 23. Minimum loan amount

SELECT 
    MIN(LoanAmount) AS max_loan
FROM
    test_loan_db;


# 24. Avg loan by property area

SELECT 
    property_area,
    ROUND(AVG(loanamount), 2) AS loan_by_property_area
FROM
    test_loan_db
GROUP BY property_area
ORDER BY loan_by_property_area DESC;




# 25. Avg loan: Graduate vs Non-graduate

SELECT 
    education, ROUND(AVG(loanamount), 2) AS Loan_amount
FROM
    test_loan_db
GROUP BY education;




# 26. Loan amount by credit history

SELECT 
    credit_history, ROUND(AVG(loanamount), 2) AS avg_loan_amount
FROM
    test_loan_db
GROUP BY credit_history
ORDER BY avg_loan_amount DESC;



# 27. Most common loan term

SELECT 
    loan_amount_term, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY loan_amount_term
ORDER BY total DESC
LIMIT 1;



# 28. Average loan term


SELECT 
    AVG(loan_amount_term) AS Avg_loan_term
FROM
    test_loan_db;




# 29. Income vs Loan amount


SELECT 
    applicantincome, loanamount
FROM
    test_loan_db
GROUP BY applicantincome , loanamount;



# 30. Loan amount by gender


SELECT gender,
    avg(loanamount) as Loan_amount
FROM
    test_loan_db
GROUP BY gender;
   
   
   
   
   
#   31. Applicants with good credit


SELECT 
    Count(*) AS good_credit
FROM
    test_loan_db
WHERE
    Credit_History = 1;
    
    
    
# 32. Applicants with poor credit

SELECT 
    COUNT(*) AS poor_credit
FROM
    test_loan_db
WHERE
    Credit_History = 0;




# 33. Percentage of good credit applicants


SELECT 
    (COUNT(CASE
        WHEN credit_history = 1 THEN 1
    END) * 100 / COUNT(*)) AS good_credit_percentsge
FROM
    test_loan_db;




# 34. Loan amount: good vs poor credit



SELECT 
    credit_history, ROUND(AVG(loanamount), 2) AS avg_loan_AMount
FROM
    test_loan_db
GROUP BY credit_history
ORDER BY avg_loan_AMount DESC;



# 35. Credit history by education


SELECT 
    education, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY education , credit_history
ORDER BY total DESC;



# 36. Credit history by self-employment



SELECT Self_Employed,
       Credit_History,
       COUNT(*) AS total
FROM test_loan_db
GROUP BY Self_Employed, Credit_History
order by total desc ;



# 37. Credit history by marital status

SELECT 
    married, credit_history, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY married , credit_history
ORDER BY total DESC;



# 38. Best property area by credit history


SELECT 
    property_area, credit_history, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY property_area,credit_history
order by total  desc;



# 39. Credit history by dependents

SELECT 
    dependents, credit_history, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY dependents , credit_history
ORDER BY total DESC;




# 40. High income but poor credit

SELECT 
    *
FROM
    test_loan_db
WHERE
    applicantincome > (SELECT 
            AVG(applicantincome)
        FROM
            test_loan_db)
        AND credit_history = 0;




# 41. Safest applicants 

SELECT 
    *
FROM
    test_loan_db
WHERE
    credit_history = 1 AND loanamount > 200
        AND applicantincome > 5000;





# 42. Property area with highest loan demand


SELECT 
    property_area, AVG(loanamount) AS avg_loan_amount
FROM
    test_loan_db
GROUP BY property_area
ORDER BY avg_loan_amount DESC;




# 43. Income vs loan amount correlation


SELECT 
    applicantincome, loanamount
FROM
    test_loan_db;




# 44. Impact of coapplicant income

SELECT 
    coapplicantincome, loanamount
FROM
    test_loan_db;


# 45. High-risk borrowers

SELECT 
    *
FROM
    test_loan_db
WHERE
    credit_history = 0
        AND loanamount > (SELECT 
            AVG(loanamount)
        FROM
            test_loan_db);



# 46. Group taking largest loans

SELECT Education, Married,
       AVG(LoanAmount) AS avg_loan
FROM test_loan_db
GROUP BY Education, Married
ORDER BY avg_loan DESC;



# 47. Education vs loan amount

SELECT 
    education, AVG(loanamount) AS avg_loan_amount
FROM
    test_loan_db
GROUP BY education , loanamount
ORDER BY avg_loan_amount DESC;




# 48. Marital status vs loan term


SELECT Married,
       AVG(Loan_Amount_Term) AS avg_term
FROM test_loan_db
GROUP BY Married;




# 49. Key features for loan approval

SELECT 
    Credit_History, ApplicantIncome, LoanAmount
FROM
    test_loan_db;



# 50. Business insight query(property_area,applicantincome,education)

SELECT 
    Property_Area,
    AVG(ApplicantIncome) AS avg_income,
    AVG(LoanAmount) AS avg_loan
FROM
    test_loan_db
GROUP BY Property_Area;




