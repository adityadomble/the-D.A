create database customer_churn;
use customer_churn;
select * from telco_customer_churn; 




#1. How many customers are there in the dataset?
  
  select  count(*)as NO_of_Customer
  from telco_customer_churn;
  
  #INSIGHT 
  # Total No.of Customers is 7032
  
#2. How many customers have churned?

  select count(*) as Churn_Customers
  from telco_customer_churn
  where Churn="yes";
  
#INSIGHT 
# The Total Number Of Churn Customer 1869 customer
  
  
  
# 3. How many customers have been retained?

  select count(*) as Retained_Customer
  from telco_customer_churn
  where Churn="No";
  
#INSIGHT 
# the Total Number Of Retained  Customer  are 5163 Customer 



#Q4. What is the overall churn rate (%)?

select round(count(case When Churn ="Yes" Then 1 End)* 100.0 / Count(*) ,2)
as Churn_Rate
from telco_customer_churn;

 #INSIGHT
 #The Overall Churn rate Of the Data Is 26.58%
 
 
 

  
#5.. What is the average monthly charge?

SELECT
ROUND(AVG(`Monthly_Charges`), 2) AS Avg_Monthly_Charge
FROM  telco_customer_churn; 


 #INSIGHT
 #The  Avg Monthly Charges is 64.8 rs
 
 
 
 #Q6  What is the average total charge?
 
 select avg(total_charges) as avg_Total_Charges
 from telco_customer_churn;
 
 
#INSIGHT 
#the Average Total Charges is 2279



#Q7. What is the average customer tenure?

Select avg(tenure) as Avg_tenure from telco_customer_churn;

#INSIGHT
# The average customer tenure 32.42 yrs




#Q8. How many customers belong to each gender?

select gender  ,count(*)  as Gender_Wise_Customer  from telco_customer_churn
group by Gender;


#INSIGHT 
# The Gender Wise  Customer  Female	3483 Custumer Male 3549 Customers


#Q10. What are the minimum, maximum, and average monthly charges?

SELECT MIN(monthly_charges) AS Minimum_Charge,
MAX(monthly_charges) AS Maximum_Charge,
ROUND(AVG(monthly_charges),2) AS Average_Charge
FROM telco_customer_churn;

#INSIGHT 
# The Minimum Charge  118.75 
#Minimum Charge 18.25
#Average Charge 64.76



#Q11. Which gender has the highest churn?

select gender ,count(*) as Churn_Customers
from telco_customer_churn
where churn = "Yes"
group by gender
order by gender asc;

#INSIGHT 
#The Female 939 Customer Churn 
# Male 930 Customer Churn 


#Q12. Are senior citizens more likely to churn?

select senior_citizen,count(*)as Senior_Citizen_Churn
from telco_customer_churn
where Churn= "Yes"
group by senior_citizen;


# INSIGHT 
# Senior Citizen 476 customers churn
# Non Senior Citizen  1393 customers churn




#Q13. Do customers with partners churn less?

select partner , count(*) as Partner_Churn from telco_customer_churn
group by partner 
;

#INSIGHT 
# the Cusotmer Who HAve Partner 3402 churn
# The Customer Who Dont Have  Partnerr 3641 Churn




#Q14. Do customers with dependents churn less?

select dependents,count(*) as Customers_Has_dependent from telco_customer_churn
group by dependents;

#INSIGHT 
#The Customer who are Dependent churn Frequently whereas THose Are Not Independent Retained
# customers with dependents churn   - 2110
# customers with dependents churn   - 4933




# Q15. What is the churn rate by gender


select gender,
    count(case when churn='Yes' then 1 end) as  churned,
    count(*) as total_customers,
    round(
        count(case when churn='Yes' then 1 end )*100.0/count(*),
        2
    ) as churn_rate
from telco_customer_churn
group by gender;


#INSIGHT
# The churn Rate of Female 26.92%
#The Churn Rate Of Male 26.16 %
# that shows It IS Equallyy Churned In Both Gender 



#16. What is the churn rate among senior citizens and non-senior citizens?


select senior_citizen,
count(case when senior_citizen= 'yes'then 1 end) as churned ,count(*) as total_customer,
round(count(case when churn ="yes" then 1 end )*100.0/count(*),2)as churn_rate 
from telco_customer_churn
group by senior_citizen;



#INSIGHT 
#THe total non- senior customer are 5901 and Churn Rate 23.61%
#The Total senior Customer Are 1142 and Churn Rate 41.68%



#Q17. What is the average monthly charge by gender?


Select gender ,round(avg(monthly_charges),2) as Average_monthly_Charges
from telco_customer_churn
group by gender;


#INSIGHT
#The Average monthly charges Female - 65.2
# Male - 64.33 


#Q18. What is the average tenure by gender?

select gender,round(avg(tenure) ,2) as Avg_Tenure from telco_customer_churn
group by gender;

#INSIGHT 
#THe average Tenure OF Male 32.5~ 33 yrs
# average Tenure of Female  32 yrs
# It shows Both GEnder HAS Same Avg Tenure 


#19.What is the average monthly charge for churned vs retained customers?

select churn ,round(avg(monthly_charges),2) AS AVg_Monthly_Charges
from telco_customer_churn
group by churn;

#INSIGHT 
#The AVg_Monthly_Charges churned customer 74.5 
# The Retained_customers is 61.27 




#20 Q What is the average tenure of churned vs retained customers?


select churn ,round(avg(tenure),2) AS AVg_tenure
from telco_customer_churn
group by churn;


#INSIGHT 
#The AVg_Tenure churned customer 17.98 yrs
# The Retained_customers is 37.57 yrs





#Q21. Which Internet Service has the highest churn?


select  internet_service,count(*) as HIghest_Churn
from telco_customer_churn
where churn="yes"
group by internet_service
order by HIghest_Churn desc;


#INSIGHT
#The highest Churn in Fiber optic 1297 customer
#DSL churn 459 customer



#Q22. What is the churn rate by Internet Service? 


select internet_service,
    count(case when churn='Yes' then 1 end) as  churned,
    count(*) as total_customers,
    round(
        count(case when churn='Yes' then 1 end )*100.0/count(*),
        2
    ) as churn_rate
from telco_customer_churn
group by internet_service
order by  churn_rate desc;



#INSIGHT 
#The Fiber Otpic has Highest Churn Rate 41.69%
#dsl with 18.96% thats Indicate Customer are 


#23. Does Phone Service affect customer churn?





select phone_service,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by phone_service;
 
 
 
 #INSIGHT 
 #Phone service  Churn_Rate 26.71 %
 # phone_Service who dont use Service it Has rate 24.93 % 
 
# total_customer_6361 churn Customer 1699 customer 



 #24 . Does having Multiple Lines affect churn?
 
 select multiple_lines,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by multiple_lines;
 



#INSIGHT
#Customer Who Had No Phoone Service 682 customer 170 Churned churn Rate 24.93 %
#Customer Who Has No Lines  3390 Customer Out Off 849 customer and Churn Rate 25.04 %
#WHo HHAve Multiple Lines 2971 Customer Out Off 850 customer and Churn Rate 28.61 %



#25  Does Online Security reduce churn?



 select online_security,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by online_security;




#INSIGHT
#Customer Who Had No online security 3498 customer 1461 are Churned  & churn Rate 41.77 %
#Customer Who HasOnline  Security 2019  Customer Out Off 295 customer and Churn Rate 14.61 %
#WHo have no Internet Service 1526 customrs 113 are churned  churn RAte 7.40 %





#Q26. Does Online Backup reduce churn?


select online_backup,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by online_backup;



# #INSIGHT
#Customer Who Had No online backup  3087 customer 1233 are Churned  & churn Rate 39.94 %
#Customer Who Has Online  backup 523  Customer Out Off 2429 customer are churn and Churn Rate 21.53%
#WHo have no Internet Service 1526 customrs 113 are churned  churn RAte 7.40 %


#Q27. Does Device Protection reduce churn?


select device_protection,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by device_protection;


# #INSIGHT
#Customer Who Had No device_protection  3095 customer 1211 are Churned  & churn Rate 39.13 %
#Customer Who Has device_protection Customer 2422 Out Off 545 customer are churn and Churn Rate 222.50%
#WHo have no Internet Service 1526 customrs 113 are churned  churn RAte 7.40 %



#Q28. Does Tech Support reduce churn?


select tech_support,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by tech_support;


# #INSIGHT
#Customer Who Had No tech_support 3473 customer 1446 are Churned  & churn Rate 41.64 %
#Customer Who Has   tech_support Customer 2044 Out Off 310 customer are churn and Churn Rate 15.10%
#WHo have no Internet Service 1526 customrs 113 are churned  churn RAte 7.40 %



# Q29. Do customers with Streaming TV churn more?m,


select streaming_tv,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by streaming_tv;



#INSIGHT
#Customer Who Had No Streaming_tv had 2810 customer 942 are Churned  & churn Rate 33.50 %
#Customer Who Had  Customer 2707 Out Off 814 customer are churn and Churn Rate 30.07%
#WHo have no Internet Service 1526 customrs 113 are churned  churn RAte 7.40 %





#Q31. Which contract type has the highest churn?


select contract, count(*) AS customer_churn
from telco_customer_churn
where churn ="yes"
group by contract
order by customer_churn desc
;


#INSIGHT 
#Month-to-month churn 1655
#One year - 166
#Two year - 48


#Q32. Which contract type has the highest churn rate ?

select contract,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by contract
order by  Churn_Rate desc;


#Q33. Which payment method has the highest churn?

select payment_method,
count(case when churn = "Yes" Then 1 End ) as churn_customer,count(*) as total_Customer ,
round(count(case When churn="Yes" then 1 end) *100.0/count(*),2)as Churn_Rate
from telco_customer_churn
group by payment_method
order by  Churn_Rate desc;

#INSIGHT
# Electronic check- 1071 customer Churn
#Mailed check - 308 customer Churn
# Bank transfer (automatic) - 258 customer Churn
# Credit card (automatic) - 232 customer Churn


# Q34. Which contract type generates the highest total revenue?


select contract,
round(sum(total_charges),2)as Total_revenue
from telco_customer_churn
group by contract
order by Total_revenue desc ;

#INSIGHT
# One Year- 4467053.5
#  Month-to-month  -  5305861.5
#    Two year    - 6283253.7

# Two Year Contract Type Has Highest revenue





#Q40. Which payment method generates the highest total revenue?


select payment_method,
round(sum(total_charges),2)as Total_revenue
from telco_customer_churn
group by payment_method
order by Total_revenue desc ;

#INSIGHT
# The Electronic check - generate Highest Revenue 
