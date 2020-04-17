create database bookshop;
create user 'bookshop'@'localhost' identified by 'bookshop';
grant all privileges on bookshop.* to 'bookshop'@'localhost';
flush privileges;