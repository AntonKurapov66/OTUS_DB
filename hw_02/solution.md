## Проводим анализ возможных запросов\отчетов\поиска данных.
Таблица Clients:
* поиск данных клиента по номеру телефона

Таблица Orders:
* аналитика оказанных услуг по стоимости
* аналитика оказанных услуг по дате оказания
## Предполагаем возможную кардинальность поля.
Таблица Clients:
* phone более 1000

Таблица Orders:
* total_price_order более 100 (учитывая разные уровни лояльности и большого кол-ва оказываемых услуг) 
* date_order чуть менее 365 (если рассматривать один рабочий год сети) 
## Создаем дополнительные индексы - простые или композитные.
 ```sql
  CREATE INDEX idx_clients_phone ON clients(phone);
```
 ```sql
  CREATE INDEX idx_orders_total_price ON orders(total_price);
```
 ```sql
  CREATE INDEX idx_orders_date_order ON orders(date_order);
```
## На каждый индекс пишем краткое описание зачем он нужен (почему по этому полю\полям).
* idx_clients_phone - необходим для быстрого поиска клиента. 
* idx_orders_total_price - необходим для ведения учета и аналитики фин.вопросов.
* idx_orders_date_order - необходим для аналитики рабочей недели,месяца,года. И распределения новых услуг в свободные временные рамки.
## Думаем какие логические ограничения в БД нужно добавить - например какие поля должны быть уникальны, в какие нужно добавить условия, чтобы не нарушить бизнес логику. Пример - нельзя провести операцию по переводу средств на отрицательную сумму.
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
## Создаем ограничения по выбранным полям.
