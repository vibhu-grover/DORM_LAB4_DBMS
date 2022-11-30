create database DBMSProject;
use DBMSProject;
Create table Supplier(SUPP_ID INT PRIMARY KEY, SUPP_NAME varchar(50) not null, 
             SUPP_CITY varchar(50) Not Null, SUPP_PHONE varchar(50)); 
Create table Customer(CUST_ID int primary key, CUS_NAME varchar(50) not null,
						CUS_PHONE varchar(10), CUS_CITY varchar(30)not null,
                        CUS_GENDER char);
 Create table Category(CAT_ID int primary key,CAT_NAME varchar(20)not null);
 
 Create table Product(PRO_ID int primary key,PRO_NAME varchar(20)not null default"Dummy",PRO_DESC varchar(60),
               CAT_ID int,  FOREIGN key(CAT_ID) References Category(CAT_ID));
 Create table Supplier_Pricing (PRICING_ID int primary key,PRO_ID int,FOREIGN key(PRO_ID) References Product(PRO_ID),
		      SUPP_ID int,FOREIGN key(SUPP_ID) References Supplier(SUPP_ID),SUPP_PRICE int default 0);
 Create table Orders (ORD_ID int primary key, ORD_AMOUNT int Not Null,ORD_DATE date Not Null,
			  CUST_ID int,FOREIGN key(CUST_ID) References Customer(CUST_ID), PRICING_ID int,
              FOREIGN key(PRICING_ID) References Supplier_Pricing(PRICING_ID));
 Create table Rating(RAT_ID int primary key, ORD_ID int,FOREIGN key(ORD_ID) References Orders(ORD_ID),
                     RAT_RATStARS int NOT NULL);
 insert into Supplier values (1, 'Rajesh Retails','Delhi',1234567890);
 insert into Supplier values (2, 'Appario Ltd','Mumbai',2589631470);
 insert into Supplier values (3, 'Knome products','Banglore',9785462315);
 insert into Supplier values (4, 'Bansal Retails','Kochi',8975463285);
 insert into Supplier values (5, 'Mittal Ltd','Lucknow',7898456532);
 
 insert into Customer values (1,'AAKASH',9999999999,'DELHI','M');
 insert into Customer values (2,'AMAN',9785463215,'NOIDA','M');
 insert into Customer values (3,'NEHA',9999999999,'MUMBAI','F');
 insert into Customer values (4,'MEGHA',9994562399,'KOLKATA','F');
 insert into Customer values (5,'PULKIT',7895999999,'LUCKNOW','M');
 
 insert into Product values(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
 insert into Product values(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
 insert into Product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
 insert into Product values(4,'OATS','Highly Nutritious from Nestle',3);
 insert into Product values(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
 insert into Product values(6,'MILK','1L Toned MIlk',3);
 insert into Product values(7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
 insert into Product values(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
 insert into Product values(9,'Project IGI','compatible with windows 7 and above',2);
 insert into Product values(10,'Hoodie','Black GUCCI for 13 yrs and above',5);
 insert into Product values(11,'Rich Dad Poor Dad', 'Written by RObert Kiyosaki',1);
 insert into Product values(12,'Train Your Brain',	'By Shireen Stephen',1);
 
 insert into Supplier_Pricing values(1,1,2,1500);
 insert into Supplier_Pricing values(2,3,5,30000);
 insert into Supplier_Pricing values(3,5,1,3000);
 insert into Supplier_Pricing values(4,2,3,2500);
 insert into Supplier_Pricing values(5,4,1,1000);
 insert into Supplier_Pricing values(6,10,2,780);
 insert into Supplier_Pricing values(7,12,4,789);
 insert into Supplier_Pricing values(8,8,1,31000);
 insert into Supplier_Pricing values(9,6,5,1450);
 insert into Supplier_Pricing values(10,9,2,999);
 insert into Supplier_Pricing values(11,11,3,549);
 insert into Supplier_Pricing values(12,7,4,529);
 
 insert into Orders values(1,1500,'2021-10-06',2,1);
 insert into Orders values(2,1000,'2021-10-12',3,5);
 insert into Orders values(3,30000,'2021-09-16',5,2);
 insert into Orders values(4,1500,'2021-10-05',1,4);
 insert into Orders values(5,3000,'2021-08-16',4,3);
 insert into Orders values(6,1450,'2021-08-18',1,9);
 insert into Orders values(7,789,'2021-09-01',3,7);
 insert into Orders values(8,7800,'2021-09-07',5,6);
 insert into Orders values(9,3000,'2021-00-10',5,8);
 insert into Orders values(10,2500,'2021-09-10',2,4);
 insert into Orders values(11,1000,'2021-09-15',4,10);
 insert into Orders values(12,789,'2021-09-16',4,12);
 insert into Orders values(13,31000,'2021-09-16',1,11);
 insert into Orders values(14,1000,'2021-09-16',3,5);
 insert into Orders values(15,3000,'2021-09-16',5,2);
 insert into Orders values(16,99,'2021-09-17',2,12);
 
 insert into Rating values(1,1,4);
 insert into Rating values(2,2,3);
 insert into Rating values(3,3,4);
 insert into Rating values(4,4,1);
 insert into Rating values(5,5,2);
 insert into Rating values(6,6,3);
 insert into Rating values(7,7,4);
 insert into Rating values(8,8,4);
 insert into Rating values(9,9,3);
 insert into Rating values(10,10,5);
 insert into Rating values(11,11,3); 
 insert into Rating values(12,12,4);
 insert into Rating values(13,13,2);
 insert into Rating values(14,14,1);
 insert into Rating values(15,15,1);
 insert into Rating values(16,16,0);
 
 select*from Supplier;
 select*from Customer;
 select* from Category;
 select *from Product;
 select*from Supplier_Pricing;
 select*from Orders;
 select*from Rating;
 
 use dbmsproject;
 select CUS_NAME,CUS_GENDER from Customer as C inner join 
        (select CUST_ID, ORD_AMOUNT from Orders where ORD_AMOUNT>=3000  group by CUST_ID)
          as O on C.CUST_ID = O.CUST_Id;

select*from orders;
delete  from Orders where ORD_ID = 101;
         
SELECT C.CUS_GENDER, count(C.CUS_GENDER) as total_Cus FROM Customer as C
       INNER JOIN Orders as O ON C.CUST_ID = O.CUST_ID
       where O.ORD_AMOUNT>=3000 GROUP BY C.CUS_GENDER;    

Select P.PRO_ID , P.PRO_NAME from PRODUCT as P where PRO_ID IN (Select SP.PRO_ID from SUPPLIER_PRICING as SP inner Join orders as O ON SP.PRICING_ID = O.PRICING_ID
where   O.ORD_DATE > "2021-10-05");

-- 4).Display all the orders along with product name ordered by a customer having Customer_Id=2.

SELECT Product.PRO_NAME, Orders.* 
FROM Orders, Supplier_Pricing, Product
WHERE Orders.CUST_ID=2 
AND Orders.PRICING_ID=Supplier_Pricing.PRICING_ID 
AND Supplier_Pricing.PRO_ID=Product.PRO_ID;

-- 5).Display the Supplier details who can supply more than one product.

 SELECT supplier.* 
FROM supplier 
WHERE supplier.SUPP_ID in
( SELECT SUPP_ID
   FROM Supplier_Pricing
   GROUP BY SUPP_ID
   having count(SUPP_ID)>1)
GROUP BY Supplier.SUPP_ID;

-- 6). Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT category.CAT_ID,category.CAT_NAME, MIN(t3.min_price) as Min_Price
 FROM category 
 INNER JOIN
   (SELECT product.CAT_ID, PRO_NAME, t2.*
    FROM  product 
     INNER JOIN
       (SELECT PRO_ID, MIN(SUPP_PRICE) as Min_Price
        FROM  supplier_pricing GROUP BY PRO_ID)
        as t2 WHERE t2.PRO_ID = product.PRO_ID)
        as t3 WHERE t3.CAT_ID = category.CAT_ID GROUP BY t3.CAT_ID;
        
-- 7). Display the Id and Name of the Product ordered after “2021-10-05”.

 SELECT Product.PRO_ID,Product.PRO_NAME
FROM Orders
INNER JOIN
Supplier_Pricing ON Supplier_Pricing.PRICING_ID = Orders.PRICING_ID INNER JOIN
Product on Product.PRO_ID = Supplier_Pricing.PRO_ID
WHERE Orders.ORD_DATE>"2021-10-05";

-- 8). Display customer name and gender whose names start or end with character 'A'.
 
   SELECT Customer.CUS_NAME,Customer.CUS_GENDER
  FROM Customer 
  WHERE Customer.CUS_NAME LIKE 'A%' OR Customer.CUS_NAME LIKE '%A';
  
  -- 9).Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
  
 --  Step-1. Create a new procedure using MySQL Workbench.
DELIMITER //
CREATE PROCEDURE proc()
--  Step-2. Embed the following block of code within the BEGIN and END statements
BEGIN
SELECT report.Supp_Id,report.Supp_Name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service FROM
(SELECT final.SUPP_ID, Supplier.SUPP_NAME, final.Average 
FROM
   (SELECT test2.SUPP_ID, SUM(test2.rat_ratstars)/COUNT(test2.rat_ratstars) AS Average 
	FROM
	(SELECT Supplier_Pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS 
		FROM Supplier_Pricing 
		INNER JOIN
		(SELECT Orders.PRICING_ID, Rating.ORD_ID, Rating.RAT_RATSTARS  
		FROM Orders  INNER JOIN  
	    Rating ON Rating.ORD_ID = Orders.ORD_ID ) AS test
		ON test.PRICING_ID = Supplier_Pricing.PRICING_ID)
			AS test2 group by Supplier_Pricing.SUPP_ID)
			AS final INNER JOIN 
			Supplier WHERE final.SUPP_ID = Supplier.SUPP_ID) AS report;
END 
//
DELIMITER ;
 -- Step-3. Invoke the procedure using the following statement
 call proc();



