### Cхема
![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_01/diagram.PNG)

### Описание таблиц и полей
* Таблица Clients - Клиенты 
  *  client_id integer [primary key, not null, unique] 
  *  first_name varchar
  *  last_name varchar
  *  date_registry datetime 
  *  loyalty_id integer 
  *  age integer
  *  phone integer 

* Table Personal - Сотрудники
  *  personal_id integer [primary key,not null, unique]
  *  first_name varchar
  *  last_name varchar
  *  ob_title varchar

* Table Services - Услуги
  *  services_id integer [primary key,not null, unique]
  *  name varchar
  *  price integer
  *  duration integer

* Table Orders - Оказанные услуги(заказы)
  *  order_id integer [primary key,not null, unique]
  *  client_id integer
  *  personal_id integer 
  *  services_id integer 
  *  date_order datetime
  *  total_price_order integer 

* Table Loyalty_program - Программа лояльности
  *  loyalty_id integer [primary key,not null, unique]
  *  name_loyalty varchar
  *  discount_size integer

* Table Filial_branch - Филиалы
  *  filial_id integer [primary key,not null, unique]
  *  name_filial varchar
  *  address varchar
  *  phone_number integer
  *  time_job timestamp 

* Table Filial_personal - Принадлежность филиалу
  *  id integer [primary key,not null, unique]
  *  filial_id integer
  *  personal_id integer
 
### Примеры бизнес-задач которые решает база
* Запись о выполненных услугах с полной информацией о клиенте. 
* Расчет стоимости услуги с учетом скидки по программе лояльности.
