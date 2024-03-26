## Описание/Пошаговая инструкция выполнения домашнего задания:
* Развернуть контейнер с PostgreSQL или установить СУБД на виртуальную машину.

  * Развернул контейнер, в хост прописал IP интерфейса который смотрит в интернет. yml-файл находится в корневой директории домашнего задания  

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_0.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_1.PNG)

* Запустить сервер.
   * Сервер запускается при поднятии докер-контейнера

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_2.PNG)

* Создать клиента с подключением к базе данных postgres через командную строку.
   * Установил клиент psql на виртуальную машину где развернул контейнер, подключился к БД

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_3.PNG)
   
* Подключиться к серверу используя pgAdmin или другое аналогичное приложение.

   * уже на собственном ПК подлючаюсь к удаленной БД (используя IP виртуальной машины, которую выдал мне провайдер) 

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_4.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_5.PNG)

![alt text](https://github.com/AntonKurapov66/OTUS_DB/blob/main/hw_03/img/01_6.PNG)
