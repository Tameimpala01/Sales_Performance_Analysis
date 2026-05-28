create table samples_superstores(
	ship_mode varchar(50),
	segment VARCHAR(50),
	country varchar(50),
	city varchar(50),
	state  varchar (100),
	postal_code text,
	region varchar (50),
	category varchar(100),
	sub_category varchar(100),
	sales NUMERIC,
	QUANTITY INT,
	DISCOUNT Numeric,
	profit Numeric
);
select * from samples_superstores

select * from samples_superstores
where sales is null
or profit is null
or quantity is null;

select * from samples_superstores
where profit < 0;

select round(sum(sales),2) as total_revenue
from samples_superstores                     #total revenue

select round(sum(profit),2) as total_profit
from samples_superstores


select region, round(sum(sales),2) as total_sales
from samples_superstores
group by region
order by total_sales DESC;                        #BEST PERFORMING REGION


SELECT CATEGORY, round(sum(profit),2)
as total_profit
from samples_superstores 
group by category 
order by total_profit desc;                #BEST PERFORMING CATEGORY




Select sub_category, round(sum(sales),2)
as total_sales
from samples_superstores
group by sub_category
order by total_sales desc
limit 10;                                    #BEST PERFORMING SUB_CATEGORY(PRODUCT)



CREATE VIEW sales_summary as 
select
region, category,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit
from samples_superstores 
group  by region, category                 # SALES KEY PERFORMANCE INDEX 


select * from sales_summary



SELECT 
sub_category, profit, 
case
when profit < 0 then 'Loss'
else 'Profit'
end as profit_status
from samples_superstores
