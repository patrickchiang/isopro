DROP DATABASE IF EXISTS isopro;

CREATE DATABASE isopro;

USE isopro;

CREATE TABLE users
(
user_id int NOT NULL AUTO_INCREMENT,
user_email varchar(128) NOT NULL,
user_username varchar(128),
user_password_salt varchar(128) NOT NULL,
user_password_hash varchar(128) NOT NULL,
PRIMARY KEY (user_id),
CONSTRAINT unique_username UNIQUE (email),
CONSTRAINT unique_email UNIQUE (email)
);

