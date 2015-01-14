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
message_id int NOT NULL AUTO_INCREMENT,
user_id_sender int NOT NULL,
user_id_receiver int NOT NULL,
message_text varchar(128),
message_read_status varchar(128),
PRIMARY KEY (message_id),
FOREIGN KEY (user_id_sender) REFERENCES user(user_id),
FOREIGN KEY (user_id_receiver) REFERENCES user(user_id)
);

CREATE TABLE social_media
(
social_media_id int NOT NULL AUTO_INCREMENT,
social_media_name varchar(128) NOT NULL,
social_media_desc varchar(128),
PRIMARY KEY (social_media_id)
);

CREATE TABLE user_social_media
(
user_id int NOT NULL,
social_media_id int NOT NULL,
social_link varchar(128),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (social_media_id) REFERENCES social_media(social_media_id)
);

CREATE TABLE album
(
album_id int NOT NULL AUTO_INCREMENT,
album_name varchar(128) NOT NULL,
album_caption varchar(128),
user_id int NOT NULL,
PRIMARY KEY (album_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE resource
(
resource_id int NOT NULL AUTO_INCREMENT,
resource_location varchar(128) NOT NULL,
PRIMARY KEY (resource_id)
);

CREATE TABLE photo
(
photo_id int NOT NULL AUTO_INCREMENT,
resource_id int,
photo_caption varchar(128),
user_id int NOT NULL,
album_id int,
PRIMARY KEY (photo_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (resource_id) REFERENCES resource(resource_id),
FOREIGN KEY (album_id) REFERENCES album(album_id)
);

CREATE TABLE photo_tag
(
tag_id int NOT NULL AUTO_INCREMENT, 
photo_id int NOT NULL,
tag_name varchar(128),
PRIMARY KEY (tag_id),
FOREIGN KEY (photo_id) REFERENCES photo(photo_id)
);

CREATE TABLE attribute
(
attribute_id int NOT NULL AUTO_INCREMENT, 
attribute_name varchar(128) NOT NULL,
attribute_desc varchar(128),
PRIMARY KEY (attribute_id)
);

CREATE TABLE photo_attribute
(
photo_id int NOT NULL,
attribute_id int NOT NULL,
attribute_value varchar(128),
FOREIGN KEY (photo_id) REFERENCES photo(photo_id),
FOREIGN KEY (attribute_id) REFERENCES attribute(attribute_id)
);

CREATE TABLE photo_reputation
(
photo_id int NOT NULL,
user_id int NOT NULL,
reputation int,
FOREIGN KEY (photo_id) REFERENCES photo(photo_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE comment
(
comment_id int NOT NULL AUTO_INCREMENT,
photo_id int NOT NULL,
comment_text varchar(128),
PRIMARY KEY (comment_id),
FOREIGN KEY (photo_id) REFERENCES photo(photo_id)
);

CREATE TABLE comment_reputation
(
comment_id int NOT NULL,
user_id int NOT NULL,
reputation int,
FOREIGN KEY (comment_id) REFERENCES comment(comment_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);