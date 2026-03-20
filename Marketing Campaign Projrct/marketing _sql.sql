use mkt;
 select count(*) from marketing_db;
 
 
 #1. total_records

select count(*) as total_record 
from marketing_db;


-- there are 10k records are in campaign dataset


#2. total revenue

select 
    sum(revenue) as total_revenue
from
    marketing_db;


-- total revenue of marketing campaign is $197 million



#3. total campaign cost

select 
    sum(campaign_cost) as campaigning_cost
from
    marketing_db;



-- the cost of marketing campaign $52 million 

#4. overall roi

select 
    (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as roi
from
    marketing_db;



-- the roi of this campaign is 2.79 % which is low  and Indiacates too much money  spend on marketing  

#5. overall conversion rate   

select 
    sum(conversions) * 1.0 / sum(clicks) as overall_conversion_rate
from
    marketing_db;
    
    
--     the conversion rate 0.06% which indicates Users are interested and not converting 


#6. revenue by channel

select 
    channel, sum(revenue) as revenue_by_channel
from
    marketing_db
group by channel
order by revenue_by_channel desc;



-- the rvenue by channel on top google ads with $34 million which show that ads campaign are likely users browing  on google  which generating revenue 
-- in 2nd position Influencer are there with $33.5 million these show users are follows influencer. 



#7. roi by channel

select 
    channel,
    (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as roi
from
    marketing_db
group by channel
order by roi desc;


-- ROI means  at  Less cost more revenue ,email has 2.90%  roi which show better than other channel google ads is also there with 2.86% 
-- on google ads marketing much less money spent on ads the lowest roi channel affiliate which is 2.69% which lower than other monney spend but not revenue





#8. top performing channel by revenue

select 
    channel, sum(revenue) as channel_by_revenue
from
    marketing_db
group by channel
order by channel_by_revenue desc;



-- top performing channel google ads with $34 million which shows good growth in revenue  or user activity on google and also follows influencer with $33.5 million , 
-- email with $33.4 million and organic $33 million



#9. lowest performing channel by roi

select 
    channel,
    (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) as lowest_performing_channel_by_roi
from
    marketing_db
group by channel
order by lowest_performing_channel_by_roi asc;




-- -- lowest performing channel by roi affiliate 2.69%  which shows Low return on investment too much money spends , 
-- organic 2.72%  ,influencer with 2.75%  ,social media 2.84% 




#10. revenue by device

select 
    device, sum(revenue) as revenue_by_device
from
    marketing_db
group by device
order by revenue_by_device desc;



-- revenue by device shows users activity mobile with $67 million which show more users are Preffered Mobile ,
-- also tablet with $66 milion and desktop  $63 million which low user activity




#11. conversion rate by device

select 
    device,
    sum(conversions) * 1.0 / sum(clicks) as conversion_rate_by_device
from
    marketing_db
group by device
order by conversion_rate_by_device desc;




-- conversion by device that desktop with 0.068% that shows peop-- le are purchase product on desktop device desktopusers are likely to maybe Financialy stable than other than tablet 0.066%  
-- which is low  


#12. revenue by customer type

select 
    customer_type, sum(revenue) as revenue_by_customer_type
from
    marketing_db
group by customer_type;



--  customer type new customer $99 million revenue which is highest campare to returning revenue





#13. average revenue per customer

select avg(revenue) as avg_revenue 
from marketing_db;


-- avg revenue $20k  which is customer is spending More sees to be Loyal Customer 




#14. top 10 high revenue customers

select customer_id, sum(revenue) as top_10_high_revenue_customers 
from marketing_db
group by customer_id
order by top_10_high_revenue_customers desc
limit 10;


-- top 10 customer are With $40k revenue 


#15. revenue by age group

select case
when age between 18 and 25 then "18-25"
when age between 25 and 30 then "18-30"
when age between 30 and 40 then "30-40"
when age between 240 and 50 then "40-50"
else '50 +'
end as age_group,
sum(revenue) as revenue_by_age_group 
from marketing_db 
group by age_group;



-- revenue by age group 50+ age revenue add $90 million as senior likely to to purchase power , 30-40 age group $48 million
-- where as  adult group 18-30 seems low conversion rate need to focus On this 

#16. gender wise conversion rate

select gender, sum(conversions) * 1.0 / sum(clicks) as gender_wise_conversion_rate 
from marketing_db
group by gender;

-- both gender have same  purchase Power show  marketing starategy is balance  



#17. revenue by campaign type

select campaign_type, sum(revenue) as revenue_by_campaign_type 
from marketing_db
group by campaign_type;


-- campaign type Consideration with--  $66 million , but In the Brand Awareness Seem revenue generator With highest $67 million Dollar
-- also Conversion $65 million dollar 

#18. roi by campaign type

select campaign_type, sum(revenue) - sum(campaign_cost) / sum(campaign_cost) as roi_by_campaign_type 
from marketing_db
group by campaign_type
order by roi_by_campaign_type desc;


#19. click through rate (ctr)

select sum(clicks) * 1.0 / sum(impressions) as click_through_rate
from marketing_db;


-- -- it shows How many People Click On Ad with is 0.07% it is Too low MAy be the Content IS Weak need To Improve Content 


#20. conversion funnel by channel

select channel, 
sum(conversions) as total_conversion,
sum(clicks) as clicks,
sum(impressions) as total_impression 
from marketing_db 
group by channel;



-- -- we can clearly see Impression ,clicks,conversiion despite of all channel google ads is the most successful strategy to we can clearly see highrst impreseeion But Low  conversion rate seem offer or Pricing Power.
--  But  In Some Cases Click are Low It Seems ads Are Attractive  need to change thats why click rate is low 



#21. rank channels by revenue

select channel, sum(revenue) as total_revenue_by_channel 
from marketing_db 
group by channel
order by total_revenue_by_channel desc;


-- Rank Channel By Revenue google Ads with $-- 34 million , Influencer $33.5 million Influencer ,  email  $33.4 million ,   Organic with $33 million
-- 1.google ads 2. Influencer 3.email 4.organic



#22. running total revenue by date

select date, sum(revenue) as total_revenue_by_date
from marketing_db
group by date;



-- daywise revenue it clearly shows Revenue also Monthly 

#23. month wise revenue

select month, sum(revenue) as month_wise_revenue
from marketing_db
group by month
order by month_wise_revenue desc;



-- highest revenue In the Month of August which is  $17 Million  and the Lowest In the Month Of February which is $14 million 


#25. revenue when discount used

select discount_used, sum(revenue) as revenue_when_used_discount 
from marketing_db
group by discount_used;



-- When Discount is Used the Revenue $98 million and discount isn't used $99 million.


#27. customers above average revenue

select customer_id, revenue
from marketing_db
where revenue > (select avg(revenue) from marketing_db);


-- some customer has Above Avg revenue above $20k 


#28. channels above overall roi

select channel 
from marketing_db 
group by channel
having (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) > 
(select (sum(revenue) - sum(campaign_cost)) / sum(campaign_cost) from marketing_db);


-- -- channel above overall ROI 1.Google Ads 2.Social Media 3.Email




#29. find duplicate customers

select customer_id, count(*)
from marketing_db
group by customer_id
having count(*) > 1;


-- There Are No Duplicate In This In Records


#30. best channel per location

select 
    channel, location, sum(revenue) as best_channel_per_location
from
    marketing_db
group by location, channel
order by best_channel_per_location desc;




--  Best Channel as  Per locaction best             channel           locaction  Revenue  
--                                                 Influencer       Kolkata     $51.5 million
--                      Email             Delhi      $47 million




#31. total revenue %      
select 
    channel,
    sum(revenue) * 100.0 / (select sum(revenue) from marketing_db) as total_revenue_percentage
from
    marketing_db
group by channel
order by total_revenue_percentage desc;

--   Revenue Percentage In Marketing Campaign Google ads 17.41% and Influencer with 16.95%, Email -16.91% 




#33. customers with no conversions

select *
from marketing_db
where conversions = "0";

-- there are 74 Customers with no comnversion



#34. average session duration by channel

select channel, avg(session_duration_sec) as average_session_duration 
from marketing_db
group by channel
order by average_session_duration desc;


#35. correlation proxy (high click low conversion)

select *
from marketing_db
where clicks > 100 and conversions < 10;


#36. top 5 days by revenue

select date, sum(revenue) as highest_revenue_by_days 
from marketing_db
group by date
order by highest_revenue_by_days desc
limit 5;  


-- Top days With Revenue 2024-03-31 revenue $900k
-- may be On these Date HoliDay Thats Why revenue Increases


#37. year wise revenue

select year(date), sum(revenue) as yearly_revenue 
from marketing_db
group by year(date);



-- total Revenue Year 2024 is 197741902 ($197 million )