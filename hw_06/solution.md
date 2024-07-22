* --Создать индекс к какой-либо из таблиц вашей БД
```sql
  CREATE INDEX idx_clients_first_name ON only_vertebra.clients(first_name);
```

* -- результат команды EXPLAIN, в которой используется данный индекс
```sql
EXPLAIN SELECT * FROM only_vertebra.clients WHERE first_name = 'John';
```

* --Реализовать индекс для полнотекстового поиска
```sql
CREATE INDEX idx_services_name_tsvector ON only_vertebra.services USING gin(to_tsvector('english', name));
SELECT * FROM only_vertebra.services WHERE to_tsvector('english', name) @@ to_tsquery('english', 'massage');
```

* --Реализовать индекс на часть таблицы или индекс на поле с функцией. 
```sql
CREATE INDEX idx_clients_upper_last_name ON only_vertebra.clients (upper(last_name));
```

* --Создать индекс на несколько полей
```sql
CREATE INDEX idx_orders_client_date ON only_vertebra.orders(client_id, date_order);
```


