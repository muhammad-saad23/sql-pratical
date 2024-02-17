create database pratical;
use pratical;

CREATE TABLE customers (
    customerID INT IDENTITY PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255),
    phonenumber varchar(255),
	foreign key(customerID) references customers(customerID)
);
drop table customers;
INSERT INTO customers (firstname, lastname, email, phonenumber)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '9876543210'),
    ('Michael', 'Johnson', 'michael.johnson@example.com', '5551234567'),
    ('Emily', 'Davis', 'emily.davis@example.com', '9998887777'),
    ('David', 'Brown', 'david.brown@example.com', '4445556666'),
    ('Sarah', 'Wilson', 'sarah.wilson@example.com', '7778889999'),
    ('Chris', 'Martinez', 'chris.martinez@example.com', '3216549870'),
    ('Jessica', 'Taylor', 'jessica.taylor@example.com', '1112223333'),
    ('Matthew', 'Anderson', 'matthew.anderson@example.com', '9991112222'),
    ('Amanda', 'Thomas', 'amanda.thomas@example.com', '3334445555');
	select * from customers;

	create table orders(
	orderID int primary key identity(10,2),
	customerID int,
	orderDate varchar(255),
	tableamount varchar(255),
	);

	INSERT INTO orders (customerID, orderDate, tableamount)
VALUES
    ( 1,'2024-02-17', '100'),
    ( 3,'2024-02-16', '150'),
    ( 2,'2024-02-15', '200'),
    (6,'2024-02-14', '175'),
    ( 7,'2024-02-13', '120'),
    ( 10,'2024-02-12', '180'),
    ( 4,'2024-02-11', '220'),
    ( 5,'2024-02-10', '130'),
    ( 9,'2024-02-09', '190'),
    ( 8,'2024-02-08', '210');

	select * from orders;

	create table orderDetails(
	orderdetails int identity(100,2) primary key,
	orderID int,
	productID int,
	quantity varchar(255),
	unitprice varchar(255)
	);

	INSERT INTO orderDetails (orderID, productID, quantity, unitprice)
VALUES
    (12, 101, '2', '10.99'),
    (16, 102, '1', '24.99'),
    (14, 103, '3', '8.99'),
    (18, 104, '4', '12.99'),
    (24, 105, '2', '19.99'),
    (26, 106, '1', '14.99'),
    (20, 107, '5', '29.99'),
    (22, 108, '2', '9.99'),
    (28, 109, '3', '6.99'),
    (10, 110, '1', '16.99');
	select * from orderDetails;

	create table products(
	productID int identity(100,2) primary key,
	productname varchar(255),
	unitprice varchar(255),
	instockquantity varchar(255)
	foreign key(productID) references products(productID)
	);
	drop table products;
	INSERT INTO products (productname, unitprice, instockquantity)
VALUES
    ('Product A', '10.99', '100'),
    ('Product B', '15.99', '150'),
    ('Product C', '20.99', '200'),
    ('Product D', '25.99', '250'),
    ('Product E', '30.99', '300'),
    ('Product F', '35.99', '350'),
    ('Product G', '40.99', '400'),
    ('Product H', '45.99', '450'),
    ('Product I', '50.99', '500'),
    ('Product J', '55.99', '550');
	select * from products;

	create login order_clerk with password='password';
	create user order_clerk for login order_clerk;
	grant insert,all to order_clerk;
	grant update on orderDetails to order_clerk;

	create trigger tr_update_stock_audit
	after update
	as
	begin
	select * from deleted
	select * from inserted
	end


	select firstname,lastname,orderdate,tableamount from customers as c inner join orders as o on c.customerID=o.customerID;
	select productname,quantity,totalprice from products inner join orderDetails as od on p.productID=od.productID;

	create view ordersummary
	as
	select orderID ,orderdate,customerID,tableamount from orders;

	select * from ordersummary;

	create view productInventory
	as
	select productname,instockquantity from products;

	select * from productInventory;

	alter procedure getsomebycustomers
	@id int
	as
	begin
	select * from customers as c inner join orders as o on c.customerID=o.customerID where c.customerID=@id;
	end
	exec getsomebycustomers @id=2;