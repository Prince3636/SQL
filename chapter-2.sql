-- DML

Create database test;

use test;

Create table test1(
	Id Int Primary key,
    name varchar(50)
    );
    
    
Insert Into test1 values
(101,'Prince'),
(102,'Rohit'),
(103,'Sachin'),
(104,'Rakesh');

select *
From test1;

update test1
Set name = 'alex'
where id = 101;


-- Imp concept
-- transformation

-- Numeric transformation
select 
	unit_price * 0.90 as Sale_Price,
    unit_price + 10 as Tax_Price,
    unit_price / 10 as Fraction_Price,
    Round(Unit_price,1) as Rounded_Price
from
	dim_product;



-- Date trandformation
-- 1)
Select 
	date,
    now() as 'Current_Time_Stamp',
    utc_date(),
    utc_time(),
    utc_timestamp()
from
	dim_date;
    
    
-- 2)

Select 
	date,
    day(date), -- extract day of date col
    month(date), -- month in date col
    year(date), -- year in date col
    week(date), -- week in date col
    weekday(date), -- extract weekday in date col
    dayname(date), -- extract the dayname in date col
    date(utc_timestamp()), -- extract only the date in utc_timestamp()
    adddate(date,2),-- we can add 2 day in your date col
    subdate(date,2), -- we can subtract 2 day in date col
    datediff(utc_timestamp(),date) as Differnce_date,
    cast('2003-01-01'as datetime)
from 
	dim_date;
    
    
    
-- 3)
select
	date,
    date_format(date,"%W %M %e %y")
from
	dim_date;
    
    
-- Type Casting
select 
	customer_key,
    Cast(customer_key as Char(100))
From
	dim_customer;
    
    
-- string function 
select 
	Concat(first_name,' ',last_name) as fullName,
    country,
    length(country) as country_len,
    city,
    LOWER(city),
    email,
    substring(email,1,4),
    replace(email,'@','**')
From
	dim_customer;