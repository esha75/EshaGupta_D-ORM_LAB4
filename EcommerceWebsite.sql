
-- Question 1 ,2,3 
create database ECommerce_Website;
use ECommerce_Website;

CREATE TABLE IF NOT EXISTS category (
  cat_id int NOT NULL DEFAULT '0' primary key,
  cat_name varchar(30) DEFAULT NULL
);
INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONIC'),
(5, 'CLOTHES');

CREATE TABLE IF NOT EXISTS customer (
  cus_id int NOT NULL DEFAULT '0' primary key,
  cus_name varchar(20) DEFAULT NULL,
  cus_phone varchar(20) DEFAULT NULL,
  cus_city varchar(20) DEFAULT NULL,
  cus_gender char(1) DEFAULT NULL
) ;

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M'),
(7, 'ROHIT', '8888111222', 'MUMBIA', 'M');



CREATE TABLE IF NOT EXISTS orders (
  ord_id int NOT NULL DEFAULT '0',
  ord_date date DEFAULT NULL,
  cus_id int DEFAULT NULL,
  pricing_id int DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  Foreign Key (cus_id) references customer(cus_id),
  Foreign Key (pricing_id) references supplier_pricing(pricing_id)
) ;

INSERT INTO `orders` (`ord_id`, `ord_date`, `cus_id`, `pricing_id`) VALUES
(101, '2021-10-06', 2, 1),
(102, '2021-10-12', 3, 5),
(103, '2021-09-16', 5, 2),
(104, '2021-10-05', 1, 1),
(105, '2021-08-16', 4, 3),
(106, '2021-08-18', 1, 9),
(107, '2021-09-01', 3, 7),
(108, '2021-09-07', 5, 6),
(109, '2021-09-10', 5, 3),
(110, '2021-09-10', 2, 4),
(111, '2021-09-15', 4, 5),
(112, '2021-09-16', 4, 7),
(113, '2021-09-16', 1, 8),
(114, '2021-09-16', 3, 5),
(115, '2021-09-16', 5, 3),
(116, '2021-09-17', 2, 14),
(117, '2023-05-02', 4, 3);

CREATE TABLE IF NOT EXISTS product (
  pro_id int(5) NOT NULL DEFAULT '0',
  pro_name varchar(20) DEFAULT NULL,
  pro_desc varchar(60) DEFAULT NULL,
  `cat_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id` (`cat_id`)
);

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_desc`, `cat_id`) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

CREATE TABLE IF NOT EXISTS rating (
  rat_id int(5) NOT NULL DEFAULT '0',
  ord_id int(5) DEFAULT NULL,
  stars int(5) DEFAULT NULL,
  PRIMARY KEY (`rat_id`),
  KEY `ord_id` (`ord_id`)
);

INSERT INTO `rating` (`rat_id`, `ord_id`, `stars`) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

CREATE TABLE IF NOT EXISTS supplier (
  supp_id int NOT NULL DEFAULT '0',
  supp_name varchar(20) DEFAULT NULL,
  supp_city varchar(20) DEFAULT NULL,
  supp_phone varchar(20) DEFAULT NULL,
  PRIMARY KEY (`supp_id`)
);

INSERT INTO `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');


CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `pricing_id` int(5) NOT NULL DEFAULT '0',
  `pro_id` int(5) DEFAULT NULL,
  `supp_id` int(5) DEFAULT NULL,
  `supp_price` int(5) DEFAULT NULL,
  PRIMARY KEY (`pricing_id`),
  KEY `pro_id` (`pro_id`),
  KEY `supp_id` (`supp_id`)
) ;

INSERT INTO `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);


-- Question 4 
select * from customer as c join orders as o using (cus_id) join supplier_pricing using(pricing_id);
select count(cus_id) as "Total Number Of Customer" , cus_gender as Gender from customer as c join orders as o using (cus_id) join supplier_pricing using(pricing_id) where supp_price>=3000 group by cus_gender;

-- Question 5

select * from customer as c join orders as o using (cus_id) join supplier_pricing using(pricing_id) join product using(pro_id);
select pro_name, pro_desc,ord_id,ord_date from customer as c join orders as o using (cus_id) join supplier_pricing using(pricing_id) join product using(pro_id) where cus_id=2;

-- Question 6
select supp_name, supp_city , supp_phone , count(supp_id) as "Number of Product" from supplier as s join supplier_pricing using(supp_id) join product using(pro_id) group by supp_id having count(supp_id) >1;


-- Question 7 
select * from category  join  product using (cat_id) join supplier_pricing using(pro_id) ;
select  cat_id , cat_name, min(pro_name), min(supp_price) from category join product using (cat_id) join supplier_pricing using(pro_id) group by cat_id ;
select  min(cat_id) as cat_id, cat_name , min( pro_name) as pro_name, min( pro_desc) as pro_desc, min(supp_price) as "Least Expensive Product" from category join product using (cat_id) join supplier_pricing using(pro_id) group by cat_name order by cat_id;

-- Question 8
select * from product join supplier_pricing using(pro_id) join orders using (pricing_id);
select pro_id,pro_name ,ord_date from product join supplier_pricing using(pro_id) join orders using (pricing_id) where ord_date>="2021-10-05";

-- Question 9
select cus_name from customer where cus_name like 'A%' or cus_name like '%A';

-- Question 10 
-- step1 
select supp_name, avg( stars ) from supplier join supplier_pricing using ( supp_id ) join orders using ( pricing_id ) join rating using ( ord_id ) group by supp_name;
-- step2
select supp_name, avg( stars ),
Case
when AVG( stars )=5 then 'Excellent Service'
when AVG( stars )>4 then 'Good Service'
when AVG( stars )>3 then 'Average Service'
else 'Poor Service'
end as 'Supplier Category'
From supplier join supplier_pricing using ( supp_id ) join orders using ( pricing_id ) join rating using ( ord_id ) group by supp_name;
-- step3
DELIMITER &&  
	CREATE PROCEDURE supplierValue()
	BEGIN
	SELECT supp_name, AVG( stars ),
	Case
	when AVG( stars )=5 then 'Excellent Service'
	when AVG( stars )>4 then 'Good Service'
	when AVG( stars )>3 then 'Average Service'
	else 'Poor Service'
	end as 'Supplier Category'
	FROM supplier join supplier_pricing using ( supp_id ) join orders using ( pricing_id ) join rating using ( ord_id ) group by supp_name;
END &&  
DELIMITER ;


call supplierValue()
