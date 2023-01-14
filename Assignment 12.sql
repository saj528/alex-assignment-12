CREATE DATABASE pizzarestaurant;

CREATE TABLE pizzarestaurant.customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    customer_name varchar(255),
    phone_number varchar(255)
);

CREATE TABLE pizzarestaurant.orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_time_stamp datetime
);

CREATE TABLE pizzarestaurant.menu(
	item_id INT PRIMARY KEY AUTO_INCREMENT,
    price decimal(6,2),
    MenuItem varchar(255)
);

CREATE TABLE pizzarestaurant.order_items(
	item_count INT,
    order_id int,
    item_id int,
    customer_id int,
	FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (item_id) REFERENCES Menu (item_id),
    FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);

insert into pizzarestaurant.customer (customer_id,customer_name,phone_number)
values(1,'Trevor Page','226-555-4982'),(2,'John Doe','555-555-9498');

insert into pizzarestaurant.orders(order_id,order_time_stamp)
values(1,'2014/9/10/ 9:47:00'),(2,'2014/9/10 13:20:00'),(3,'2014/9/10/ 9:47:00');


insert into pizzarestaurant.menu(item_id,price,MenuItem)
values(1,'7.99', 'Pepperoni & Cheese'),(2,'9.99','Vegetarian'),(3,'14.99','Meat Lovers'),(4,'12.99','Hawaiian');


insert into pizzarestaurant.order_items(item_count,order_id,item_id,customer_id)
values(1,1,1,1),(1,1,3,1),(1,2,2,2),(2,2,3,2),(1,3,3,1),(1,3,4,1);


select c.customer_id, c.customer_name,o.order_time_stamp,sum(m.price * ot.item_count) from pizzarestaurant.order_items ot
LEFT JOIN pizzarestaurant.customer c on c.customer_id = ot.customer_id
JOIN pizzarestaurant.orders o on o.order_id = ot.order_id
JOIN pizzarestaurant.menu m on m.item_id = ot.item_id
group by c.customer_id, o.order_time_stamp;








