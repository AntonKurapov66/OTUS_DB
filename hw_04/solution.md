* Используя операторы DDL создайте на примере схемы интернет-магазина:

  * Базу данных.
    	```sql
		create database vertebraDB owner otusstudent; --создание БД
	```

  * Табличные пространства и роли.
  * Схему данных.
  * Таблицы своего проекта, распределив их по схемам и табличным пространствам.



```sql
create database vertebraDB owner otusstudent; --создание БД
```

create ROLE boss SUPERUSER LOGIN PASSWORD 'boss'; --создание гл.пользователя сети массажных салонов
CREATE ROLE worker with LOGIN password 'test'; --создание пользователя работника

CREATE schema only_vertebra;-- создание схемы под таблицы 

GRANT SELECT ON ALL TABLES IN SCHEMA only_vertebra TO worker; --предоставление на чтение данных для пользователя worker
ALTER DEFAULT PRIVILEGES IN SCHEMA only_vertebra GRANT SELECT ON TABLES TO worker; --предоставление прив. на чтение всех новых создающихся таблиц в схеме only_vertebra

---Создание таблиц
 
CREATE TABLE only_vertebra.clients (
    client_id integer primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	date_registry TIMESTAMP not null CHECK (date_registry >= now()),
	loyalty_id integer not null,
	age_clients integer not null check (age_clients > 10),
	phone integer not null unique
);

CREATE TABLE only_vertebra.personal (
	personal_id integer primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	ob_title varchar(100) not null
);

CREATE TABLE only_vertebra.services (
    services_id integer primary key,
	name varchar(255) not null,
	price integer not null CHECK (price >= 500), 
	duration integer not null CHECK (duration >= 30) 
);

CREATE TABLE only_vertebra.orders (
	order_id integer primary key,
	client_id integer not null,
	personal_id integer not null,
	services_id integer not null,
	date_order TIMESTAMP not null,
	total_price_order integer not null CHECK (total_price_order >= 400)
);

CREATE TABLE only_vertebra.loyalty_program (
    loyalty_id integer primary key,
	name_loyalty varchar(50) not null,
	discount_size integer not null CHECK (discount_size <= 20 and discount_size >= 0)
);

CREATE TABLE only_vertebra.filial_branch (
    filial_id integer primary key,
	name_filial varchar(255) not null,
	address varchar (255) not null,
	phone_number integer not null,
	time_job timestamp not null,
	unique (address,phone_number)
);

CREATE TABLE only_vertebra.filial_personal (
    id integer primary key,
	filial_id integer not null,
	personal_id integer not null
);



SELECT * FROM INFORMATION_SCHEMA.tables where table_schema = 'only_vertebra'; --- проверка таблиц

---Добавление Foreign key

ALTER TABLE only_vertebra.clients
ADD CONSTRAINT loyalty1_x_key FOREIGN KEY (loyalty_id) REFERENCES only_vertebra.loyalty_program(loyalty_id);



ALTER TABLE only_vertebra.orders
ADD CONSTRAINT client1_x_key FOREIGN KEY (client_id) REFERENCES only_vertebra.clients(client_id);

ALTER TABLE only_vertebra.orders
ADD CONSTRAINT personal1_x_key FOREIGN KEY (personal_id) REFERENCES only_vertebra.personal(personal_id);

ALTER TABLE only_vertebra.orders
ADD CONSTRAINT services1_x_key FOREIGN KEY (services_id) REFERENCES only_vertebra.services(services_id);



ALTER TABLE only_vertebra.filial_personal
ADD CONSTRAINT filial_x_key FOREIGN KEY (filial_id) REFERENCES only_vertebra.filial_branch(filial_id);

ALTER TABLE only_vertebra.filial_personal
ADD CONSTRAINT personal_x_key FOREIGN KEY (personal_id) REFERENCES only_vertebra.personal(personal_id);

---Создание индексов

CREATE INDEX idx_clients_phone ON only_vertebra.clients(phone);

CREATE INDEX idx_orders_total_price ON only_vertebra.orders(total_price_order);

CREATE INDEX idx_orders_date_order ON only_vertebra.orders(date_order);
