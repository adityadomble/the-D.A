CREATE DATABASE SUMASOFT_LOAN;
USE  SUMASOFT_LOAN;




-- 1 Total loan applications
SELECT COUNT(*) AS total_applications
FROM test_loan_db;


-- 2. Unique Loan IDs

SELECT COUNT(DISTINCT Loan_ID) AS unique_loans
FROM test_loan_db;





-- 3. Different property areas

SELECT DISTINCT Property_Area
FROM test_loan_db;


-- 4. Male vs Female applicants


SELECT Gender, COUNT(*) AS total
FROM test_loan_db
GROUP BY Gender
order by  total desc;


-- 5 Married vs Unmarried applicants
select married,count(*) as total 
from test_loan_db
group by married
order by  total desc;






-- 7. Applicants with dependents

SELECT Dependents, COUNT(*) AS total
FROM test_loan_db
GROUP BY Dependents
order by  total desc;


-- 8. Education levels


select education,count(*) as  total
from test_loan_db
group by education
order by  total desc;


-- 9. Loan amount terms available

SELECT DISTINCT Loan_Amount_Term
FROM test_loan_db;


-- 10. Applicants with valid credit history


SELECT Credit_History, COUNT(*) AS total
FROM test_loan_db
GROUP BY Credit_History
order by  total desc ;



-- 11. Average Applicant Income

SELECT AVG(ApplicantIncome) AS avg_applicant_income
FROM test_loan_db;


-- 12. Average Coapplicant Income

SELECT AVG(CoapplicantIncome) AS Avg_coapplicant_income
FROM test_loan_db;


-- 13. Total income per applicant


SELECT Loan_ID,
       ApplicantIncome + CoapplicantIncome AS total_income
FROM test_loan_db;



-- 14. Highest income applicant


SELECT *
FROM test_loan_db
ORDER BY ApplicantIncome DESC
LIMIT 1;



-- 15. Lowest income applicant

SELECT *
FROM test_loan_db
ORDER BY ApplicantIncome ASC
LIMIT 1;


-- 16. Avg income: Self-employed vs Not


SELECT Self_Employed,
       AVG(ApplicantIncome) AS avg_income
FROM test_loan_db
GROUP BY Self_Employed;



-- 17 Avg income: Graduate vs Non-graduate

select education, avg( applicantincome) as avg_income
from test_loan_db
group by education;


-- 18. Avg income: Married vs Unmarried

select married , avg(applicantincome) as avg_Income
from test_loan_db
group by married;


-- 19. Income by property area


select property_area, avg(applicantincome) as Avg_Income
from test_loan_db
group by property_area;



-- 20. Applicants with zero coapplicant income

select * from test_loan_db
where coapplicantincome ="0";




-- 21. Average loan amount

select avg(loanamount) as avg_loan_Amount
from test_loan_db;


-- 22. Maximum loan amount

select max(loanamount) as max_loan_amount
from test_loan_db;



-- 22. Minimum loan amount

SELECT Min(LoanAmount) AS max_loan
FROM test_loan_db;


-- 24. Avg loan by property area

select property_area,round(avg(loanamount),2) as loan_by_property_area
from test_loan_db
group by  property_area
order by loan_by_property_area desc;



-- 25. Avg loan: Graduate vs Non-graduate

select education, round(avg(loanamount),2) as Loan_amount
from test_loan_db
group by education;




-- 26. Loan amount by credit history

select credit_history , round(avg(loanamount),2) as avg_loan_amount
from test_loan_db
group by credit_history
order by avg_loan_amount desc;



-- 27. Most common loan term

select loan_amount_term, count(*) as total
from test_loan_db
group by loan_amount_term
order by  total desc 
limit 1;



-- 28. Average loan term


select avg(loan_amount_term) as Avg_loan_term
From test_loan_db;




-- 29. Income vs Loan amount


SELECT 
   applicantincome, loanamount
FROM test_loan_db
group by applicantincome, loanamount ;



-- 30. Loan amount by gender


SELECT gender,
    avg(loanamount) as Loan_amount
FROM
    test_loan_db
GROUP BY gender;
   
   
   
   
   
--    31. Applicants with good credit




SELECT 
    COUNT(*) AS good_credit
FROM
    test_loan_db
WHERE
    Credit_History = 1;
    
    
    
--     32. Applicants with poor credit


SELECT COUNT(*) AS poor_credit
FROM test_loan_db
WHERE Credit_History = 0;




-- 33. Percentage of good credit applicants


SELECT 
    (COUNT(CASE
        WHEN credit_history = 1 THEN 1
    END) * 100 / COUNT(*)) AS good_credit_percentsge
FROM
    test_loan_db;





-- 34. Loan amount: good vs poor credit



SELECT 
    credit_history, ROUND(AVG(loanamount), 2) AS avg_loan_AMount
FROM
    test_loan_db
GROUP BY credit_history
ORDER BY avg_loan_AMount DESC;



-- 35. Credit history by education


select education, count(*) as total from test_loan_db
group by education,credit_history
order by  total desc;



-- 36. Credit history by self-employment



SELECT Self_Employed,
       Credit_History,
       COUNT(*) AS total
FROM test_loan_db
GROUP BY Self_Employed, Credit_History
order by total desc ;


-- 37. Credit history by marital status

SELECT 
    married, credit_history, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY married , credit_history
ORDER BY total DESC;



-- 38. Best property area by credit history


SELECT 
    property_area, credit_history, COUNT(*) AS total
FROM
    test_loan_db
GROUP BY property_area,credit_history
order by total  desc;



-- 39. Credit history by dependents

select dependents,credit_history ,count(*) as total  from test_loan_db
group by dependents,credit_history
order by total  desc;




-- 40. High income but poor credit

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




-- 41. Safest applicants 

SELECT 
    *
FROM
    test_loan_db
WHERE
    credit_history = 1 AND loanamount > 200
        AND applicantincome > 5000;





-- 42. Property area with highest loan demand



select property_area, avg(loanamount) as avg_loan_amount
from test_loan_db
group by property_area
order by  avg_loan_amount desc;




-- 43. Income vs loan amount correlation


select applicantincome,loanamount from test_loan_db;




-- 44. Impact of coapplicant income

select coapplicantincome,loanamount from test_loan_db;


-- 45. High-risk borrowers

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



-- 46. Group taking largest loans

SELECT Education, Married,
       AVG(LoanAmount) AS avg_loan
FROM test_loan_db
GROUP BY Education, Married
ORDER BY avg_loan DESC;



-- 47. Education vs loan amount

SELECT 
    education, AVG(loanamount) AS avg_loan_amount
FROM
    test_loan_db
GROUP BY education , loanamount
ORDER BY avg_loan_amount DESC;




-- 48. Marital status vs loan term


SELECT Married,
       AVG(Loan_Amount_Term) AS avg_term
FROM test_loan_db
GROUP BY Married;




-- 49. Key features for loan approval

SELECT Credit_History, ApplicantIncome, LoanAmount
FROM test_loan_db;



-- 50. Business insight query(property_area,applicantincome,education)

SELECT Property_Area,
       AVG(ApplicantIncome) AS avg_income,
       AVG(LoanAmount) AS avg_loan
FROM test_loan_db
GROUP BY Property_Area;

