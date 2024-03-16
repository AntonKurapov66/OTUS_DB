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
* Таблица Clients - Клиенты (нельзя зарегестрировать нового клиента задним числом, клиентом может быть любой человек старше 10 лет, уникальный номер телефона для каждого клиента)
  *  client_id integer [primary key, not null, unique] 
  *  first_name varchar [not null]
  *  last_name varchar [not null]
  *  date_registry datetime [not null] CHECK (date_registry >= now())
  *  loyalty_id integer [foreign key, not null]
  *  age integer [not null]  CHECK (age > 10)
  *  phone integer [not null, unique]

* Table Personal - Сотрудники
  *  personal_id integer [primary key,not null, unique]
  *  first_name varchar [not null]
  *  last_name varchar [not null]
  *  ob_title varchar [not null]

* Table Services - Услуги (Стоимость услуги не может быть ниже 500Р, продолжительность услуги не может быть меньше 30 минут)
  *  services_id integer [primary key,not null, unique]
  *  name varchar [not null]
  *  price integer [not null] CHECK (price >= 500)
  *  duration integer [not null] CHECK (duration >= 30)

* Table Orders - Оказанные услуги(заказы) (Конечная сумма услуги не может быть ниже 400P)
  *  order_id integer [primary key,not null, unique]
  *  client_id integer [foreign key, not null]
  *  personal_id integer [foreign key, not null]
  *  services_id integer [foreign key, not null]
  *  date_order datetime [not null]
  *  total_price_order integer [not null] CHECK (total_price_order >= 400)

* Table Loyalty_program - Программа лояльности (Максимальный размер скидки 20 %)
  *  loyalty_id integer [primary key,not null, unique]
  *  name_loyalty varchar [not null]
  *  discount_size integer [not null] CHECK (total_price_order <= 20 and total_price_order >= 0)

* Table Filial_branch - Филиалы (Для каждого филиала уникальный адрес и номер телефона)
  *  filial_id integer [primary key,not null, unique]
  *  name_filial varchar [not null]
  *  address varchar [not null, unique] 
  *  phone_number integer [not null, unique]
  *  time_job timestamp [not null]

* Table Filial_personal - Принадлежность филиалу
  *  id integer [primary key,not null, unique]
  *  filial_id integer [foreign key, not null]
  *  personal_id integer [foreign key, not null]
## Создаем ограничения по выбранным полям.
```sql
    ALTER TABLE clients
    ALTER COLUMN first_name SET NOT NULL,
    ALTER COLUMN last_name SET NOT NULL,
    ALTER COLUMN date_registry SET NOT NULL,
    ALTER COLUMN loyalty_id SET NOT NULL,
    ALTER COLUMN age SET NOT NULL,
    ALTER COLUMN phone SET NOT NULL,
    ADD CONSTRAINT CHECK (date_registry >= now()),
    ADD CONSTRAINT CHECK (age > 10),
    ADD CONSTRAINT UNIQUE (phone),
    ADD CONSTRAINT FOREIGN KEY (loyalty_id) REFERENCES loyalty_program (loyalty_id);
```
Для всех остальных таблиц по аналогии.
