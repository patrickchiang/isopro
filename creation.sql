DROP DATABASE IF EXISTS isopro;

CREATE DATABASE isopro;

USE isopro;

CREATE TABLE user
(
user_id int NOT NULL AUTO_INCREMENT,
user_email varchar(128) NOT NULL,
user_username varchar(128) NOT NULL,
user_password_salt varchar(128) NOT NULL,
user_password_hash varchar(128) NOT NULL,
PRIMARY KEY (user_id),
CONSTRAINT unique_username UNIQUE (email),
CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE user_info
(
user_id int NOT NULL,
info_first_name varchar(128),
info_last_name varchar(128),
info_city varchar(128),
info_phone_number varchar(128),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

