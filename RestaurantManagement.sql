Drop table customer_login;
Drop table customer_profile;
Drop table order;
Drop table items;
Drop table chef;
Drop table waiter;
Drop table bill;
Drop table cart;
Drop table dinning_table;
Drop table order_status;
Drop table card;
Drop table payment_mode;

Create table customer_login(
    customerid          int,
    username            varchar(40),
    password 		    varchar(20),
    status              int,
    constraint 	        customer_login_customerid_pk 	PRIMARY KEY(customerid)
); 


Create table customer_profile(
    customerid  		int,
    name 		        varchar(40),
    DateofBirth 		Date,
    contact_number   	longint,
    email 		        varchar(30),
    gender 		        varchar(15),
    credits		        longint,
    constraint 	        customer_profile_order_id_fk 	FOREIGN KEY(order_id) REFERENCES order (order_id),
    constraint 	        customer_profile_customerid_fk	FOREIGN KEY(customerid) REFERENCES customer_login (customerid) 
);

Create table address(
    customerid          int,
    doorno              int,
    street              varchar(30),
    city                varchar(30),
    pincode             int,
    constraint 	        address_customerid_fk	FOREIGN KEY(customerid) REFERENCES customer_login (customerid)
)


Create table order(
    order_id 	 	    int,
    customerid          int, 
    Table_number 		longint,
    price  			    double,
    ordered_time        time,
    constraint 	        order_order_id_pk 	PRIMARY KEY(order_id),
    constraint 	        order_customerid_fk	FOREIGN KEY(customerid) REFERENCES customer_login (customerid) 

);

Create table Items(
    Item_id		        int,
    name 	            varchar(30) ,
    price 	            double,
    category	        varchar(30),
    session             varchar(30),
    constraint 	        Items_Item_id_pk 	PRIMARY KEY(Item_id)
);

Create table order_Details(
    order_id             int;
    Item_id              int;
    quantity             int,
    constraint 	         order_Details_order_id_fk 	FOREIGN KEY(order_id) REFERENCES order (order_id),
    constraint 	         order_Details_Item_id_fk 	FOREIGN KEY(Item_id) REFERENCES Items (Item_id)
)

/* Remove
Create table cheff(
    chef_name 	         varchar(255),
    Id_number	         int,
    constraint 	         cheff 	PRIMARY KEY(chef_name)
);
*/

Create table waiter(
    waiter_id  	        int,
    name 	            varchar(255),
    constraint 	        waiter_waiter_id_pk 	PRIMARY KEY(waiter_id)
);

Create table bill(
    bill_id 		    int,
    amount 	            double,
    bill_date 		    DATE, 
    Discount 	        int,
    order_id            int,
    Constraint	        bill_order_id_fk FOREIGN KEY(order_id)	 REFERENCES order(order_id)
    constraint 	        bill_bill_id_pk PRIMARY KEY(bill_id)
);

/*
Create table payment_mode(
    payment_id 			int ,
    amount 			    double, 
    card 				int,
    cash		 		int,
    balance_amount 		double
    constraint 	        payment_mode PRIMARY KEY(payment_id)
);
*/

Create table card(
    account_number 	    varchar(20),
    customerid          int,
    valid_to 		    DATE,
    holder_name 	    varchar(40)
    constraint	        card_customerid_fk FOREIGN KEY(customerid) REFERENCES  customer_profile(customerid);                        
);

Create table dinningtable (
    table_status 		varchar(20),
    table_number		int
    constraint 	        dinningtable_table_number_pk PRIMARY KEY(table_number)
);

/* Remove
Create table cart(
    order_status 	    varchar(255),
    order_id 	        int,
    Constraint 	        cart FOREIGN KEY(order_id)	 REFERENCES order(order_id)
 	
);
*/

Insert into customer_login("admin","admin@123");
Insert into customer_profile(1,"dharani","Coimbatore",11.5.1998,12345677890,"example@gmail.com","male",100);
Insert into items  values(1,"Idly",9.5,"veg"),(2,"noodles",50,"nonveg");
Insert into cheff values (123,"velu");
Insert into waiter values(456,"venu");
Select username ,password  from customer_login;
