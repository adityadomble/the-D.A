use superstore_db;

select * from superstore;

#Display all records from the superstore table.

select count(*) as Total_Records from superstore;

#INSIGHT 
#There Are 9694 recors


#Display only the columns:




#Find the total number of unique orders.

select count(distinct Order_ID) as unique_orders from superstore;


#INSIGHT 
# The Unique Order Are 4931 customer




# Find the total number of unique customers.
select count(distinct Customer_ID) as total_number_of_unique_customers from superstore;


#INSIGHT
#The Total Unique Customer are 793 customers


# Find the total sales.

select sum(Sales)as Total_sales from superstore;

#INSIGHT
#The Total Revenue/ Total_sales is $2272450.7


#7. Find the total profit.

select sum(Profit) as Total_Profit from superstore;

#ISIGHT 
#The Total Profit Is $282857.75 

#8. Find the average sales.

select avg(Sales) as Avg_sales
from 
superstore;

#INSIGHT
#The Average Sales Per Customer $234.48

#9. Find the highest sales.

select max(Sales) as Highest_Sales
from superstore;

#INSIGHT
#The Highest Sales amount Of $22638.48



#10. Find the lowest profit.

select min(Profit) as lowest_profit
 from superstore;
 
 
 #INSIGHT
 #The lowest profit #-6599.97 which Is In Loss 
 
 
 #11.Display orders where Sales > 500
 
 select * from superstore
 where Sales > 500;
 
 #INSIGHT
 #There Are 1151 orders where Sales > 500
 
 
 #12. Find all loss-making orders
 
 #INSIGHT
 select * from superstore
 where Profit < 0;
 
 #INSIGHT
 #There are 1808 Records are still loss Making
 
 
#13. Display orders from the West region.

select * 
from superstore
where Region ="West";

#INSIGHT
#There Are 3099 orders Are from WEst region which IS majority In Any region



#14. Display Technology category orders.

select * from superstore
Where Category="Technology";

#iNSIGHT
#the Total Technology category order are 1839 orders



#15  Find all orders placed in 2017.

select * from superstore
where year( Order_date) = '2017';

#INSIGHT 
#The  orders placed in YEAR 2017 are 3201 orders 



#16. Find orders with no discount.

select * from superstore
where Discount= 0;

#INSIGHT
#There are 4657 orderes orders with no discount.
#approx.Half Orders with No Dicsount


#17. Find orders where quantity is 5 or more.

select * from superstore
where Quantity >="5";

#INSIGHT
# there are 3006 Orders where quantity is 5 or more.


# 18. Display Second Class shipments.

select * from superstore
where Ship_Mode ="Second Class";

#INSIGHT
#There are 1886 Orders that have  ship Mode Second Class shipments.

#19. Display California orders.
select * from superstore
where  State="California";

#INSIGHT
#there 1942 Order From California state


#20. Display returned orders.

select * from superstore
where Returned  ="Yes";


#INSIGHT
# There are 773 Records who have returned Order 


#  21.Find the total sales by region.

select Region,sum(Sales) as total_sales_by_region from superstore
group by Region
order by  total_sales_by_region desc;

#INSIGHT 
# The West- $713471.45
# the East - $672194.15
#The  Central -$497800.88
# the  South - $388983.59  The West Region HAs The Highest with $713k 



#22. Find the total profit by region.

select Region,sum(Profit) as total_profit_by_region from superstore
group by region
order by total_profit_by_region desc;


#INSIGHT 
#total profit West- $106021.14
  #            East -$90672.01
  #            South - $46035.68
  #            Central - $40128 The West Region Has Most Profit 
  
  
  
  
  #23. Find the total sales by category.
  
  select Category ,sum(Sales) as Total_sales_By_category from superstore
  group by Category;
  
  
#INSIGHT
#The Furniture - $733047.06 ~ $733k
# Office Supplies - $703502.87 ~ $703k
#Technology       - $835900.14 ~ $835k Technology category Has The Highest Sales In the Category



#24  Find the total profit by category.

select Category ,sum(Profit) as total_profit_by_category
from superstore
group by Category
order by total_profit_by_category desc;


#INSIGHT
#The total_profit_by_category
  
#Technology - $145387.09 ~ $145k 
#Office Supplies -$120489.88 ~ $120k 
# Furniture-  16980.77 ~ $17k


#25. Find the total sales by sub-category.

select Sub_Category,sum(Sales) as total_sales_by_sub_category from superstore
group by Sub_category
order by  total_sales_by_sub_category desc;


# INSIGHT
# The  total sales by sub-category.
# Phones - $329753.14
# Chairs - $328449.13 this Are the Sales InSUb_category


#26. Find the average discount by category.


select Category,avg(Discount)as average_discount_by_category from superstore
group by Category
order by average_discount_by_category desc ;

#INSIGHT 
# The average_discount_by_category 
# Furniture - 0.17 %
# Office Supplies -0.15%
# Technology - 0.13  %  The Furniture HAs A Highest 


#27. Find the total quantity sold by category.


select Category,sum(Quantity) as Total_quantity from superstore
group by Category
order by Total_quantity desc;


#INSIGHT
#The total quantity sold by category.
# Office Supplies - 21990
#Furniture        - 7855
#Technology       - 6904 The Office Supplies - 21990 has The  Highest Sold By Category


# 28. Find the number of unique orders in each region.

select Region ,count(distinct Order_ID) as  unique_orders from superstore
group by Region
order by unique_orders desc ;

#INSIGHT
#The West - 1578
# East   - 1376
# Central - 1161
# South  - 816
#West region Has Highest Number Of Unique Orders Its alredy  highest sales in west Region




#29. Find the total sales by customer segment.

select   segment,sum(Sales) as  total_sales_by_customer_segment from superstore
group by Segment
order by total_sales_by_customer_segment desc;


# INSIGHT
# The Consumer - $1150166.18 ~ $1.1 Million 
# Corporate    - $696604.60 ~ $700k
# Home Office -  $425679.29 ~  $420k      Consumer with $1.1 Million  highest total sales by customer segment.



# 30. Find the average profit by ship mode.

select Ship_Mode,avg(Profit) as  average_profit from superstore
group by Ship_Mode
order by average_profit desc;


#INSIGHT
#The First Class- $32.49
#Same Day       - $30.40
#Second Class   - $29.96
#Standard Class - $27.94   the average profit by ship mode is highest Of First Class




#31. Find the Top 10 customers based on total sales.

select Customer_Name ,sum(Sales)as Total_sales 
from superstore 
group by Customer_Name
order by Total_sales desc
limit 10;


#INSIGHT
# The  Seantotal Miller Sales $25k 
# 2nd Highest Tamara Chand - $19k



#32. Find the Top 10 products based on total sales.

select Product_Name,sum(Sales) as total_sales
from superstore
group by Product_Name
order by total_sales desc
limit  10;

#INSIGHT 
#the cannon advanced Copier with $61k 
# fellowes machine - $27k



#34. Find the Bottom 5 products by profit.

select Product_Name,sum(Profit) as products_by_profit
from superstore
group by Product_Name
order by  products_by_profit asc
limit 5;


#INSIGHT
#the Cubify CubeX 3D Printer Double Head Print- $-8879.97
#Lexmark MX611dhe Monochrome Laser Printer- $-4589.97
# Cubify CubeX 3D Printer Triple Head Print - $ -3839.99 
# Chromcraft Bull-Nose Wood Oval Conference Tables & Bases- $ -2876.11
# Bush Advantage Collection Racetrack Conference Table - $-1934.39




#35. Find the category with the highest total sales.


select Category ,sum(Sales) as total_sales
from superstore
group by Category
order by total_sales desc
limit 5;


#INSIGHT
# The Technology - $835900.0
# Furniture   - $733047.06
# Office Supplies -$703502.8 


#36. Find customers who placed more than 10 unique orders.

select Customer_Name,count(distinct Order_ID)as unique_orders
from superstore
group by Customer_Name
having count(distinct Order_ID)>10
order by unique_orders desc;

#INSIGHT
#The Emily Phan with 17 unique Orders 
# Chloris Kastensmidt - 13 Unique Orders



# 37. Find products sold more than 100 times.

select Product_Name,sum(Quantity)as products_sold
from superstore
group by Product_Name
having sum(Quantity)>100
order by products_sold desc;


#IJNSIGHT
#products sold more than 100 times
#Staples - 215 Quantity
#Staple envelope -  Quantity 
#Easy-staple paper - 150  Quantity


#43. Find the average sales per customer.

select Customer_Name,round(sum(Sales),2)as  average_sales_per_customer
from superstore
group by Customer_Name
order by average_sales_per_customer desc;


#INSIGHT
#The Sean Miller - $25k
# Tamara Chand   - $19k
# Raymond Buch   - $15k




#44. Find the average order value.

select round(sum(Sales)/ count(distinct Order_ID),2)as average_order_value from superstore;

#IINSIGHT
# The average order value $ 460.8  thats Shows the Order value Amount Is Big 



#45. Find all products with a negative total profit.

select Product_Name,sum(Profit)as total_profit
from superstore
group by Product_Name
having sum(Profit)< 0
order by total_profit asc ;




#INSIGHT
# There are 289 records are With  products That are negative total profit
# Cubify CubeX 3D Printer Double Head Print - with  -$8.9 k Loss




#46. Find the profit margin (%) for each category.


select Category,round((sum(Sales)/sum(Profit) /100),2)
as Profit_margin from superstore
group by Category 
order by Profit_margin desc ;


#INSIGHT
#the Furniture - 0.43 %
#	Office Supplies	- 0.06%
# Technology - 0.06% The Furniture has Highest Profit_margin
# 47. Find each region's contribution to total sales (%).


select Region,round(sum(Sales)*100/ (select sum(Sales) from superstore),2)
 as sales_percentage  from superstore
group by Region
order by sales_percentage   desc;


#INSIGHT
#The West Region Has 31.40%  contribution to sales
#The east Region Has 30%  contribution to sales
#Central region has 21.91%
# Southb region has  17.12%


#48. Find the percentage of returned orders.\\

select round(count(case when Returned="Yes"then 1 end)*100/count(*),2) as return_customers
from superstore ;

#INSIGHT
#the percentage of returned orders 7.97% of order are return.alter

# 48. Find the average shipping time (in days).

select round(avg(datediff(Ship_Date,Order_Date)),2)as  average_shipping_days
from superstore;

#INSIGHT
#  average shipping dauys Is 4 days 


