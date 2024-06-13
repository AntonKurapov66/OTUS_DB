CREATE DATABASE IF NOT EXISTS vertebraDB;
USE vertebraDB;
CREATE TABLE IF NOT EXISTS  vertebraDB.clients (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_registry TIMESTAMP NOT NULL,
    loyalty_id INT NOT NULL,
    age_clients INT NOT NULL CHECK (age_clients > 10),
    phone VARCHAR(20) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS  vertebraDB.personal (
    personal_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    ob_title VARCHAR(100) NOT NULL);
CREATE TABLE IF NOT EXISTS  vertebraDB.services (
    services_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL CHECK (price >= 500),
    duration INT NOT NULL CHECK (duration >= 30));
CREATE TABLE IF NOT EXISTS  vertebraDB.orders (
    order_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    personal_id INT NOT NULL,
    services_id INT NOT NULL,
    date_order TIMESTAMP NOT NULL,
    total_price_order INT NOT NULL CHECK (total_price_order >= 400));
CREATE TABLE IF NOT EXISTS  vertebraDB.loyalty_program (
    loyalty_id INT PRIMARY KEY,
    name_loyalty VARCHAR(50) NOT NULL,
    discount_size INT NOT NULL CHECK (discount_size <= 20 AND discount_size >= 0));
CREATE TABLE IF NOT EXISTS  vertebraDB.filial_branch (
    filial_id INT PRIMARY KEY,
    name_filial VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    time_job TIME NOT NULL,
    UNIQUE (address, phone_number));
CREATE TABLE IF NOT EXISTS  vertebraDB.filial_personal (
    id INT PRIMARY KEY,
    filial_id INT NOT NULL,
    personal_id INT NOT NULL);
