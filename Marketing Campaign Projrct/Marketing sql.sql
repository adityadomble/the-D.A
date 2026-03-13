create database mkt ;
use mkt;
select * from marketing_db;
select count(*) from marketing_db;






#1.total_records

select count(*) as total_record from marketing_db;


#2️.Total Revenue

SELECT 
    SUM(Revenue) AS total_revenue
FROM
    marketing_db;
    
    
    
    
#3 Total Campaign Cost


SELECT 
    SUM(Campaign_Cost) AS Campaigning_Cost
FROM
    marketing_db;



#4.Overall ROI
SELECT 
    (SUM(Revenue) - SUM(Campaign_Cost)) / SUM(Campaign_Cost) AS roi
FROM
    marketing_db;
    
    
    
 #5.Overall Conversion Rate   

SELECT 
    SUM(Conversions) * 1.0 / SUM(Clicks) AS overall_conversion_rate
FROM
    marketing_db;



#6. Revenue by Channel

	SELECT 
    Channel, SUM(Revenue) AS Revenue_By_Channel
FROM
    marketing_db
GROUP BY Channel
ORDER BY Revenue_By_Channel DESC;
    
    
    
 #7.ROI by Channel
SELECT 
    Channel,
    (SUM(Revenue) - SUM(Campaign_Cost)) / SUM(Campaign_Cost) AS Roi
FROM
    marketing_db
GROUP BY Channel
ORDER BY Roi DESC;
 
# 8.Top Performing Channel by Revenue


SELECT 
    Channel, SUM(Revenue) AS Channel_by_Revenue
FROM
    marketing_db
GROUP BY Channel
ORDER BY Channel_by_Revenue DESC;


#9. Lowest Performing Channel by ROI


SELECT 
    Channel,
    (SUM(Revenue) - SUM(Campaign_Cost)) / SUM(Campaign_Cost) AS Lowest_Performing_Channel_by_ROI
FROM
    marketing_db
GROUP BY Channel
ORDER BY Lowest_Performing_Channel_by_ROI ASC;


#10. Revenue by Device

SELECT 
    Device, SUM(revenue) AS Revenue_by_Device
FROM
    marketing_db
GROUP BY Device
ORDER BY Revenue_by_Device DESC;



# 11. Conversion Rate by Device


SELECT 
    Device,
    SUM(Conversions) * 1.0 / SUM(Clicks) AS Conversion_Rate_by_Device
FROM
    marketing_db
GROUP BY Device
ORDER BY Conversion_Rate_by_Device DESC;






#12 .Revenue by Customer Type


SELECT 
    Customer_Type, SUM(Revenue) AS Revenue_by_Customer_Type
FROM
    marketing_db
GROUP BY Customer_Type;


#13.Average Revenue per Customer


select  avg(revenue) as avg_revenue from marketing_db ;



#14 . Top 10 High Revenue Customers
select Customer_ID, sum(Revenue) as Top_10_High_Revenue_Customers FROM marketing_db
GROUP BY Customer_ID
ORDER BY Top_10_High_Revenue_Customers  desc
LIMIT 10;




#15. Revenue by Age Group


SELECT CASE
WHEN AGE BETWEEN  18 AND 25 THEN "18-25"
WHEN AGE BETWEEN  25 AND 30 THEN "18-30"
WHEN AGE BETWEEN  30 AND 40 THEN "30-40"
WHEN AGE BETWEEN  240 AND 50 THEN "40-50"
ELSE '50 +'
END AS AGE_GROUP,
SUM(Revenue)AS Revenue_by_Age_Group FROM marketing_db 
GROUP BY AGE_GROUP;



#16.Gender Wise Conversion Rate


SELECT Gender,sum(Conversions) *1.0 /sum(Clicks) AS Gender_Wise_Conversion_Rate FROM marketing_db
GROUP BY Gender;



#17 . Revenue by Campaign Type


SELECT Campaign_Type, sum(Revenue) AS Revenue_by_Campaign_Type FROM marketing_db
GROUP BY Campaign_Type;


#18 . ROI by Campaign Type

SELECT Campaign_Type,sum(Revenue) - sum(Campaign_Cost) / sum(Campaign_Cost)AS ROI_by_Campaign_Type FROM marketing_db
GROUP BY Campaign_Type
ORDER BY ROI_by_Campaign_Type DESC ;




#19. Click Through Rate (CTR)


SELECT SUM(Clicks) *1.0 / sum(Impressions) AS Click_Through_Rate
FROM marketing_db;



#20.Conversion Funnel by Channel


SELECT Channel, 
SUM(Conversions) AS TOTAL_CONVERSION,
SUM( Clicks) AS CLICKS,
sum(Impressions) AS TOTAL_IMPRESSION 
FROM marketing_db 
group by Channel;




#21 .  Rank Channels by Revenue


SELECT Channel ,SUM(Revenue) AS TOTAL_REVENUE_BY_CHANNEL FROM marketing_db 
group by Channel
ORDER BY TOTAL_REVENUE_BY_CHANNEL DESC;



#22. Running Total Revenue by Date

SELECT Date,SUM(Revenue) AS TOTAL_Revenue_by_Date
FROM marketing_db
GROUP BY Date;


#23.Month Wise Revenue

select Month,sum(Revenue) AS Month_Wise_Revenue
FROM marketing_db
GROUP BY Month
ORDER BY Month_Wise_Revenue DESC;


#25. Revenue When Discount Used

SELECT Discount_Used ,sum(Revenue) AS REVENUE_WHEN_used_discount from marketing_db
group by Discount_Used;


#26. high Bounce Rate Campaigns (>70%)



#27 . Customers Above Average Revenue


select Customer_ID , Revenue
from marketing_db
where Revenue > (select(avg(Revenue)) from marketing_db);



#28 . Channels Above Overall ROI


SELECT Channel from marketing_db 
group by Channel
having  (SUM(Revenue) - SUM(Campaign_Cost))/ SUM(Campaign_Cost) > (SELECT (sum(Revenue) -sum(Campaign_Cost)/SUM(Campaign_Cost)) 
from marketing_db);


use mkt;
select * from marketing_db;

#29 .  Find Duplicate Customers

select Customer_ID, count(*)
from marketing_db
group by Customer_ID
having count(*)> 1;


#30 .Best Channel Per Location.


SELECT 
    Channel, Location, SUM(Revenue) AS Best_Channel_Per_Location
FROM
    marketing_db
GROUP BY Location , Channel
ORDER BY Best_Channel_Per_Location DESC;



# 31 total_revenue %


SELECT 
    Channel,
    SUM(Revenue) * 100.0 / (SELECT 
            SUM(Revenue)
        FROM
            marketing_db) AS total_Revenue_Percentage
FROM
    marketing_db
GROUP BY Channel;


#33 .Customers with No Conversions

select *
 from marketing_db
where Conversions="0";


# 34. Average Session Duration by Channel


select Channel,avg(Session_Duration_sec)as Average_Session_Duration from marketing_db
group by Channel
order by Average_Session_Duration desc;


#35 Correlation Proxy (High Click Low Conversion)



SELECT *
FROM marketing_db
WHERE Clicks > 100 AND Conversions < 10;





#36.Top 5 Days by Revenue


select Date, sum(Revenue)as highest_revenue_By_days from marketing_db
group by Date
order by highest_revenue_By_days desc
limit 5;



#37 . Year Wise Revenue


select year(Date),sum(Revenue) as Yearly_revenue from marketing_db
group by year(Date); 
