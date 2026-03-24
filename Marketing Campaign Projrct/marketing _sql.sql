create database  marketing_campaign;
use  marketing_campaign;


 select count(*) from marketing_db;
 
 
 #1. total_records

select count(*) as total_record 
from marketing_db;

# INSIGHT
# There are 10k records are in campaign dataset


#2. total revenue

SELECT  SUM(revenue) AS total_revenue
FROM marketing_db;
-
#INSIGHT
#total revenue of marketing campaign is $197 million



#3. total campaign cost

select sum(campaign_cost) as campaigning_cost
from marketing_db;

# INSIGHT
# the cost of marketing campaign $52 million 

#4. overall roi

select (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as roi
from marketing_db;

#INSIGHT
# The Roi of this campaign is 2.79 % which is low  and Indiacates too much money  spend on marketing  



#5. overall conversion rate   

select sum(conversions) * 1.0 / sum(clicks) as overall_conversion_rate
from marketing_db;
    
# INSIGHT    
# the conversion rate 0.06% which indicates Users are interested BUT not converting  because Of Different Reason


#6. revenue by channel

select channel, sum(revenue) as revenue_by_channel
from marketing_db
group by channel
order by revenue_by_channel desc;

# INSIGHT

# The rvenue by channel on top google ads with $34 million which show that ads campaign are likely users browing  on google  which generating revenue 
# In 2nd position Influencer  with $33.5 million these show users are follows influencer. 
# On 3rd Position Email With $33.4 Million 



#7. roi by channel

select channel,(sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as roi
from marketing_db
group by channel
order by roi desc;

#INSIGHT
# ROI means  at  Less cost more revenue ,email has 2.90%  roi which show better than other channel google ads is also there with 2.86% 
# On google ads marketing much less money spent on ads the lowest roi channel affiliate which is 2.69% which lower than other monney spend but not revenue





#8. top performing channel by revenue

select channel, sum(revenue) as channel_by_revenue
from marketing_db
group by channel 
order by channel_by_revenue desc;

#INSIGHT
# Top performing channel google ads with $34 million which shows good growth in revenue  or user activity on google and also follows influencer with $33.5 million , 
# Email with $33.4 million and organic $33 million



#9. lowest performing channel by roi

select channel,(sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as lowest_performing_channel_by_roi
from marketing_db
group by channel
order by lowest_performing_channel_by_roi asc;

#INSIGHT
# Lowest performing channel by roi Affiliate 2.69%  which shows Low return on investment too much money spends , 
# Organic 2.72%  ,Influencer with 2.75%  ,Social Media 2.84% 



#10. revenue by device

select device, sum(revenue) as revenue_by_device
from marketing_db
group by device
order by revenue_by_device desc;

#INSIGHT
# Revenue by device shows users activity mobile with $67 million which show more users are Preffered Mobile ,
# Also tablet with $66 milion and desktop  $63 million which low user activity Maybe there are Reason Mobile is Cheap  thats Why User Afforder Mobile Device.




#11. conversion rate by device

select device,sum(conversions) * 1.0 / sum(clicks) as conversion_rate_by_device
from marketing_db
group by device
order by conversion_rate_by_device desc;

#INSIGHT
# Conversion by device that desktop with 0.068% that shows people are purchase product on desktop device desktop users are likely to maybe Financialy stable 
# Than other than tablet 0.066%  which is low And Mobile With  0.06523%


#12. revenue by customer type

select customer_type, sum(revenue) as revenue_by_customer_type
from marketing_db
group by customer_type
order by revenue_by_customer_type desc;

# INSIGHT
# Customer type new customer $99.5 million revenue which is highest campare to returning revenue with $99.1 million which shows New Users Are Purchasing product 


#13. average revenue per customer

select avg(revenue) as avg_revenue_Per_custmer
from marketing_db;

# INSIGHT
# Avg revenue  Per Customer $20k  which is customer is spending More
# Customer are likely  to be Loyal Customer 


#14. top 10 high revenue customers

SELECT customer_id, sum(revenue) as top_10_high_revenue_customers 
from marketing_db
group by customer_id
order by top_10_high_revenue_customers desc
limit 10;

# INSIGHT
# Top 10 customer are With $40k revenue 


#15. revenue by age group

select case when age between 18 and 25 then "18-25"
when age between 25 and 30 then "18-30"
when age between 30 and 40 then "30-40"
when age between 240 and 50 then "40-50"
else '50 +' end as age_group,
sum(revenue) as revenue_by_age_group 
from marketing_db 
group by age_group;

#INSIGHT
# Revenue by age group 50+ age revenue add $90 million as senior likely to to purchase power , 30-40 age group $48 million
# Where as  adult group 18-30 seems low conversion rate need to focus On this.alter


#16. gender wise conversion rate

select gender, sum(conversions) * 1.0 / sum(clicks) as gender_wise_conversion_rate 
from marketing_db
group by gender;

# INSIGHT
# Both Gender have same  purchase Power show  marketing strategy is balance MEN - 0.067% And Female - 0.066%



#17. revenue by campaign type

select campaign_type, sum(revenue) as revenue_by_campaign_type 
from marketing_db
group by campaign_type;

# INSIGHT
# Campaign type Consideration with  $66 million , but In the Brand Awareness Seem revenue generator With highest $67 million Dollar
# Also Conversion $65 million dollar 

#18. roi by campaign type

select campaign_type, (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as roi_by_campaign_type 
from marketing_db
group by campaign_type
order by roi_by_campaign_type desc;

#INSIGHT 
# Consideration campaign 2.89% , Conversion with 2.77% and Awareness has Lowest Roi 2.72% 
# Consideration is Highest In Terms Of Roi  


#19. click through rate (ctr)

select sum(clicks) * 1.0 / sum(impressions) as click_through_rate
from marketing_db;

# INSIGHT
# CTR shows How many People Click On Ad with is 0.07% it is Too low May be the Content Is Weak need To Improve Content 
# Reason Behind Low CTR Content Quality


#20. conversion funnel by channel

select channel, sum(conversions) as total_conversion,
sum(clicks) as clicks,
sum(impressions) as total_impression  from marketing_db 
group by channel;

# INSIGHT
# we can clearly see Impression ,clicks,conversiion despite of all channel google ads is the most successful strategy to we can clearly see highrst impreseeion But Low  conversion rate seem offer or Pricing Power.
# But  In Some Cases Click are Low It Seems ads Are Attractive  need to change thats why click rate is low 



#21. rank channels by revenue

select channel, sum(revenue) as total_revenue_by_channel 
from marketing_db 
group by channel
order by total_revenue_by_channel desc;

# INSIGHT
# Rank Channel By Revenue google Ads with $34 million , Influencer $33.5 million Influencer ,  email  $33.4 million ,   Organic with $33 million
# 1.google ads 2. Influencer 3.email 4.organic



#22. running total revenue by date

select date, sum(revenue) as total_revenue_by_date
from marketing_db
group by date;

# INSIGHT
# Daywise revenue it clearly shows Revenue also Monthly 

#23. month wise revenue

select month, sum(revenue) as month_wise_revenue
from marketing_db
group by month
order by month_wise_revenue desc;


# INSIGHT
# Highest revenue In the Month of August which is  $17 Million  and the Lowest In the Month Of February which is $14 million 


#25. revenue when discount used

select discount_used, sum(revenue) as revenue_when_used_discount 
from marketing_db
group by discount_used;


# INSIGHT
# When Discount is Used the Revenue $98 million and discount isn't used $99 million.


#27. customers above average revenue

select customer_id, revenue from marketing_db
where revenue > (select avg(revenue) from marketing_db);

# INSIGHT
#Some customer has Above Avg revenue above $20k 





#29. find duplicate customers

select customer_id, count(*)
from marketing_db
group by customer_id
having count(*) > 1;

# INSIGHT
# There Are No Duplicate In This In Records


#30. best channel per location

select channel, location, sum(revenue) as best_channel_per_location
from marketing_db
group by location, channel
order by best_channel_per_location desc;


# INSIGHT
# Best Channel as  Per locaction best             channel           locaction  Revenue  
#                                                Influencer       Kolkata     $51.5 million
#                     Email             Delhi      $47 million




#31. total revenue %    
  
select channel,sum(revenue) * 100.0 / (select sum(revenue) from marketing_db) as total_revenue_percentage
from marketing_db
group by channel
order by total_revenue_percentage desc;

# INSIGHT
# Revenue Percentage In Marketing Campaign Google ads 17.41% and Influencer with 16.95%, Email -16.91% 


#33. customers with no conversions

select *
from marketing_db
where conversions = "0";

# INSIGHT
# There are 74 Customers with no comnversion.



#34. average session duration by channel

select channel, avg(session_duration_sec) as average_session_duration 
from marketing_db
group by channel
order by average_session_duration desc;

# INSIGHT
# Avg session Duration in campaign Social Media has highest avg session 


#35. correlation proxy (high click low conversion)

select *
from marketing_db
where clicks > 100 and conversions < 10;

# INSIGHT 
# There are 36 Records have High Click And Low Low Conversion


#36. top 5 days by revenue

select date, sum(revenue) as highest_revenue_by_days 
from marketing_db
group by date
order by highest_revenue_by_days desc
limit 5;  

# INSIGHT 
# Top days With Revenue 2024-03-31 revenue $900k
# Day be On these Date HoliDay Thats Why revenue Increases


#37. year wise revenue

select year(date), sum(revenue) as yearly_revenue 
from marketing_db
group by year(date);


#INSIGHT
-- total Revenue Year 2024 is 197741902 ($197 million )


# Project Insight 

#The project aims to acess the performance of a given marketing campaign using SQL, based on a database
 #Containing 10,000 records. The analysis reveals that the campaigns are profitable, with a positive ROI, 
# But still have space for improvement. Among the channels, Google Ads is found to perform best in terms of revenue generation,
 #But some channels still need to improve. Mobile devices are found to perform the best in terms of engagement and revenue generation, which is a clear indicator of the importance of mobile marketing strategies.
# Funnel analysis also reveals strong performance in terms of impressions and clicks, but a decline in conversions, which again indicates a need to enhance the conversion strategies.


