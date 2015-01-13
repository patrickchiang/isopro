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
CONSTRAINT unique_username UNIQUE (user_username),
CONSTRAINT unique_email UNIQUE (user_email)
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

CREATE TABLE message
(
message_id int NOT NULL,
user_id_sender int NOT NULL,
user_id_receiver int NOT NULL,
message_text varchar(128),
message_read_status varchar(128),
FOREIGN KEY (user_id_sender) REFERENCES user(user_id),
FOREIGN KEY (user_id_receiver) REFERENCES user(user_id)
);