Select * from Store_SalesItems;
--Revenue..
ALTER TABLE Store_SalesItems
Add column Revenue numeric(20,2);

Update Store_SalesItems

--Profit..
SELECT  Sum((unit_price - p.cost_price ) * quantity) as profit
from Store_SalesItems si
join Store_products p on si.Product_id=p.product_id;

--Sales by month...
SELECT DATE_TRUNC('Month',si.sale_date) AS MONTH,
	SUM(si.unit_price * si.quantity) AS REVENUE
FROM Store_SalesItems si
GROUP BY month
order by month;

--Gender revenue generated..
SELECT p.gender, Sum(si.quntity *si.unit_price) as revenue
from Store_products p, Store_SalesItems si
join Store_products p on si.product_id=p.product_id;


--Discount,Without Discount performance

ALTER TABLE Store_SalesItems
Add column Discount_status varchar(50);


update Store_SalesItems
set Discount_status= CASE
WHEN Discounted>0 then 'With discount applied' else 'No_discount_applied'
end;

