* Напишите запрос по своей базе с регулярным выражением, добавьте пояснение, что вы хотите найти.
  ```sql
  SELECT * FROM clients WHERE first_name ~ '^А'; --найти всех клиентов, чьё имя начинается на "А"  
  ```
* Напишите запрос по своей базе с использованием LEFT JOIN и INNER JOIN, как порядок соединений в FROM влияет на результат? Почему?
  ```sql
  SELECT c.first_name, c.last_name, s.name
  from clients as c
  LEFT JOIN orders as o ON c.client_id = o.client_id
  INNER JOIN services as s ON  s.services_id= o.services_id; 
  --Получить список всех клиентов и услуг, которые были заказаны,но при этом некоторые клиенты могут не воспользоваться ни одной услугой.
  --Здесь, если поменять местами LEFT JOIN и INNER JOIN, то результатом запроса станут только клиенты, которые пользовались какой-либо услугой, с LEFT JOIN мы 
  получаем всех клиентов, включая тех, кто не пользовался услугой. 
  ```
* Напишите запрос на добавление данных с выводом информации о добавленных строках.
  ```sql
  INSERT INTO loyalty_program  (loyalty_id,name_loyalty,discount_size)
  VALUES (1, 'VIP', 20)
  RETURNING loyalty_id,name_loyalty,discount_size;  
  ```
  ```sql
  INSERT INTO clients (client_id ,first_name,last_name,date_registry ,loyalty_id , age_clients, phone)
  VALUES (1, 'Антон', 'Курапов', '2024-04-30 19:30:42','1', '25', 9176)
  RETURNING first_name, last_name, date_registry, age_clients, phone;  
  ```
* Напишите запрос с обновлением данные используя UPDATE FROM.
  ```sql
  UPDATE clients 
  SET age_clients  = 26 , date_registry = '2024-04-30 18:50:42'
  FROM loyalty_program 
  WHERE clients.loyalty_id = loyalty_program.loyalty_id  AND client_id  = 1;  
  ```
* Напишите запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.
  ```sql
  DELETE FROM clients
  USING loyalty_program
  WHERE clients.loyalty_id = loyalty_program.loyalty_id
  AND loyalty_program.loyalty_id = 1;  
  ```
