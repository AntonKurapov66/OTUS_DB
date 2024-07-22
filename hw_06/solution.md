* --Создать индекс к какой-либо из таблиц вашей БД
```sql
  CREATE INDEX idx_clients_first_name ON only_vertebra.clients(first_name);
```

* -- результат команды EXPLAIN, в которой используется данный индекс
```sql
EXPLAIN SELECT * FROM only_vertebra.clients WHERE first_name = 'John';
```
* ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_06/img/01_0.PNG)

* --Реализовать индекс для полнотекстового поиска
```sql
CREATE INDEX idx_services_name_tsvector ON only_vertebra.services USING gin(to_tsvector('english', name));
SELECT * FROM only_vertebra.services WHERE to_tsvector('english', name) @@ to_tsquery('english', 'massage');
```
* ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_06/img/01_2.PNG)

* --Реализовать индекс на часть таблицы или индекс на поле с функцией. 
```sql
CREATE INDEX idx_clients_upper_last_name ON only_vertebra.clients (upper(last_name));
```

* --Создать индекс на несколько полей
```sql
CREATE INDEX idx_orders_client_date ON only_vertebra.orders(client_id, date_order);
```

* Комментарии к каждому из индексов
  *  Индекс для поля first_name в таблице clients: этот индекс ускоряет поиск клиентов по их именам, обеспечивая быструю фильтрацию запросов.
  *  Индекс для полнотекстового поиска по полю name в таблице services: этот индекс позволяет эффективно выполнять полнотекстовый поиск по названиям услуг, что особенно полезно для поиска по частичному совпадению слов.
  *  Индекс на часть таблицы по date_registry в таблице clients: этот индекс улучшает производительность запросов, которые ищут недавно зарегистрированных клиентов, фокусируясь только на последних записях.
  *  Композитный индекс для полей client_id и date_order в таблице orders: этот индекс ускоряет запросы, которые фильтруют или сортируют заказы по клиенту и дате заказа, обеспечивая более быструю сортировку и выборку данных.

* Дополнительный индексы которые можно добавить: 

```sql
-- Создание индексов для внешних ключей
CREATE INDEX idx_orders_client_id ON only_vertebra.orders(client_id);
CREATE INDEX idx_orders_personal_id ON only_vertebra.orders(personal_id);
CREATE INDEX idx_orders_services_id ON only_vertebra.orders(services_id);
CREATE INDEX idx_filial_personal_filial_id ON only_vertebra.filial_personal(filial_id);
CREATE INDEX idx_filial_personal_personal_id ON only_vertebra.filial_personal(personal_id);
CREATE INDEX idx_clients_loyalty_id ON only_vertebra.clients(loyalty_id);

-- Создание индексов для уникальных и часто запрашиваемых полей
CREATE INDEX idx_clients_phone ON only_vertebra.clients(phone);
CREATE INDEX idx_orders_total_price ON only_vertebra.orders(total_price_order);
CREATE INDEX idx_orders_date_order ON only_vertebra.orders(date_order);
CREATE INDEX idx_filial_branch_address ON only_vertebra.filial_branch(address);
CREATE INDEX idx_filial_branch_phone_number ON only_vertebra.filial_branch(phone_number);

-- Создание композитных индексов
CREATE INDEX idx_orders_client_date ON only_vertebra.orders(client_id, date_order);
``
*  Индексы для внешних ключей: Ускоряют выполнение операций соединения таблиц, что особенно важно при выполнении сложных запросов с несколькими таблицами.
*  Индексы для уникальных полей: Ускоряют поиск по уникальным полям, таким как телефонные номера.
*  Композитные индексы: Улучшают производительность запросов, которые часто используют сочетание нескольких столбцов в условиях.
