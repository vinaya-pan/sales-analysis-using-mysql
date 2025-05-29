
create database company;
#right click on tables then click table data import wizard choose dataset click next finish

select * from sales;
#find all orders shipped via 'economy' with a total amount greater than 25000.
select *from sales where Ship_Mode="Economy" and Total_Amount>25000;
#retrive all sales data for 'technology' category in 'ireland' made after 2020-01-01.
select *from sales where Category='Technology' and Country='Ireland' and STR_TO_DATE(Order_Date,'%d/%m/%Y') > '2020-01-01';
#list the top most profitable sales transactions in descending order.
select *from sales order by Unit_Profit desc limit 10,20; #1st 10 it will skip and proceed with next records.
select *from sales order by Unit_Profit desc limit 10;
#find all customers whose name starts with j and ends with n:
select Order_ID,Customer_Name from sales where Customer_Name like 'J%n';
select Order_ID,Product_Name from sales where Product_Name like '%Acco%';
#get the top 5 cities with highest total sales amount
select City,SUM(Total_Amount) as sal from sales group by City order by sal limit 5;
#dsiplay the second set 10 records from customer name and total amount in decreasing order
select Customer_Name,Total_Amount from sales order by Total_Amount desc limit 10,20;
#find the total revenue,avg unit cost and count all orders
select sum(Total_Amount) as 'revenue',avg(Unit_Cost) as 'cost',count(Order_ID) as 'count' from sales;
#how many unique regions are there  
select count(distinct Region)as count from sales;
#count number of orders placed by each customer 
select count(Order_ID),Customer_Name from sales group by Customer_Name order by count(Order_ID);
#rank 5 products based on total sales using rank()
select Product_Name,sum(Total_Amount) as total_sales,Rank() over (order by sum(Total_Amount) desc) as salesrank from sales group by Product_Name limit 5; 
