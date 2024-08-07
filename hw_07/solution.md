* Создайте таблицу и наполните ее данными
  ```sql
    CREATE TABLE statistic(
      player_name VARCHAR(100) NOT NULL,
      player_id INT NOT NULL,
      year_game SMALLINT NOT NULL CHECK (year_game > 0),
      points DECIMAL(12,2) CHECK (points >= 0),
      PRIMARY KEY (player_name,year_game));
  ```
  ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_07/img/01_0.PNG)
  
* заполнить данными
  ```sql
  INSERT INTO statistic(player_name, player_id, year_game, points) VALUES ('Mike',1,2018,18), ('Jack',2,2018,14), ('Jackie',3,2018,30), ('Jet',4,2018,30), ('Luke',1,2019,16), ('Mike',2,2019,14), ('Jack',3,2019,15), ('Jackie',4,2019,28), ('Jet',5,2019,25), ('Luke',1,2020,19), ('Mike',2,2020,17), ('Jack',3,2020,18), ('Jackie',4,2020,29), ('Jet',5,2020,27);
  ```
   ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_07/img/01_1.PNG)
  
* написать запрос суммы очков с группировкой и сортировкой по годам
  ```sql
  select  year_game as "Год", sum(points) as "Сумма очков"
  from statistic 
  group by year_game 
  order by "Год" desc;
  ```
 ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_07/img/01_21.PNG)
  
* написать cte показывающее тоже самое
  ```sql
  WITH YearlyPoints AS (
  SELECT year_game AS "Год", SUM(points) AS "Сумма очков"
  FROM statistic
  GROUP BY year_game
    )
  SELECT "Год", "Сумма очков"
  FROM YearlyPoints
  ORDER BY "Год" desc;
  ```
  ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_07/img/01_31.PNG)
  
* используя функцию LAG вывести кол-во очков по всем игрокам за текущий код и за предыдущий.
  ```sql
  SELECT player_name, year_game AS "Год",
  points AS "Очки в этот год",
  LAG(points) OVER (PARTITION BY player_name ORDER BY year_game) AS "Очки в предыдущем году"
  from statistic;
  ```
  ![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_07/img/01_4.PNG)
