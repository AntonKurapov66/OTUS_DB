## Физическая репликация:

  * Настроить физическую репликации между двумя кластерами базы данных
  * Репликация должна работать использую "слот репликации"
  * Реплика должна отставать от мастера на 5 минут

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_0.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_1.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_2.PNG)

* master
  
![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_3.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_3_1.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_4.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_5.PNG)

* replica
  
![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_5_1.PNG)

* master

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_6.PNG)

* replica

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_6_1.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_6_2.PNG)

## Логическая репликация:
  * В стенд добавить еще один кластер Postgresql. Необходимо:
  * Создать на первом кластере базу данных, таблицу и наполнить ее данными (на ваше усмотрение)
  * На нем же создать публикацию этой таблицы
  * На новом кластере подписаться на эту публикацию
  * Убедиться что она среплицировалась. Добавить записи в эту таблицу на основном сервере и убедиться, что они видны на логической реплике

* master
  
![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_7.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_7_1.PNG)

* logical_replica

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_7_1_1.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_7_2.PNG)

* master

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_7_3.PNG)

* logical_replica

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_08/img/01_7_4.PNG)
