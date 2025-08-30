Create table Store_channels(
channel varchar(50),
Description varchar(50)
);

drop table if exists Store_Customer;
Create table Store_Customer(
Customer_id serial not null primary key, 
country varchar(50),
Age_Range Varchar(40),
Signup_date date

);

Create table Store_Products(
Product_id serial not null primary key, 
product_name varchar(50),
Category Varchar(40),
Brand varchar(50),
Size varchar(50),
color varchar(50),
catalog_price decimal(10,2),
cost_price decimal(10,2),
gender varchar(50)

);

SELECT * FROM Store_customer;
drop table if exists Store_SalesItems;

Create table Store_Sales(
Sales_id int not null primary key, 
channel varchar(50),
discounted int,
total_amount numeric(20,3),
sale_date date,
customer_id serial  references Store_Customer(customer_id),
country varchar(50)
);

Select * from Store_Sales;

Create table Store_SalesItems(
item_id int not null primary key,
Sales_id int References Store_Sales(Sales_id), 
Product_id serial References Store_Products(Product_id),
Quantity int,
Original_price numeric(20,3),
Unit_price numeric (20,3),
discount_applied decimal(10,3),
discount_percent varchar(50),
discounted int,
item_total decimal(20,2),
Sale_date date,
channel varchar (50),
channel_compaigns varchar(50)
);


Create table Store_Stock(
 
country varchar(50),
Product_id serial References Store_Products(Product_id),
Stock_quantity int

);
select * from Store_SalesItems;

ALTER table Store_SalesItems
Add column Total_sales Numeric(20,2);

UPDATE Store_SalesItems
set Total_sales=quantity*unit_price;
