create database student_management;
use student_management;

create table class (
	id int primary key auto_increment,
    name varchar(100) not null
 );
create table teacher(
	id int primary key auto_increment,
    name varchar(100) not null,
	age int not null,
	country varchar(255) not null
);