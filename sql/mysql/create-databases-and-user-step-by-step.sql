-- create database and add an user step by step
-- linuxbender daniel glenn
-- creativecommons.org/licenses/by-nc-sa/3.0/
-- https://github.com/linuxbender/sql/mysql

-- check mysql command if is available on your system
whatis mysql

-- check version
mysql --version

-- login as root : e.q mysql -u root -p
-- mysql -u root -p

-- using help to show command action under mysql
-- e.q help SHOW;

-- show databases
SHOW DATABASES;

-- create database
CREATE DATABASE myTodo_development;
CREATE DATABASE myTodo_test;

-- create user with the name WebUser only with local access and password
GRANT ALL PRIVILEGES ON myTodo_test.* TO 'WebUser'@'localhost' IDENTIFIED BY 'foo2011';

-- create user with the name WebUser only with local access
GRANT ALL ON myTodo_development.* TO 'WebUser'@'localhost';
-- create user password or change the password
set password for 'WebUser'@'localhost' = password('foo2011');

-- show possibles privileges from the system
SHOW PRIVILEGES;

-- show privilefes for the new db user 'WebUser'@'localhost'
SHOW grants FOR 'WebUser'@'localhost';

-- exit to for a short login test for the new user
exit;
-- login with the new user
mysql -u WebUser -p myTodo_test
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
-- other commands
-- show tables on the current database;
SHOW TABLES;

-- swicht to my other database
USE myTodo_development;

-- remove a database
DROP DATABASE myTodo_development;

-- remove user
DROP USER 'WebUser'@'localhost';

-- show fields from a tabel
SHOW FIELDS FROM tblUsers;
-- shortcut for show fields
desc mysql.user;
desc tblUsers;
-- show all users mysql -- login as root or dbowner
select User from  mysql.user;

