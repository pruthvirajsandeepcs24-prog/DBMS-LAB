show databases;

create database IF NOT exists pruthvi;

show databases;

use pruthvi;


create table human(driver_id varchar(10),name varchar(20), address varchar(30), primary key(driver_id));

desc human;

create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
create table accident(report_num int,accident_date date, location varchar(20), primary key(report_num));
create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id, reg_num), foreign key(driver_id) references human(driver_id), foreign key(reg_num) references car(reg_num));
create table participated(driver_id varchar(10), reg_num varchar(10), report_num int, damage_amount int, primary key(driver_id, reg_num, report_num), foreign key(driver_id) references human(driver_id), foreign key(reg_num) references car(reg_num), foreign key(report_num) references accident(report_num));

insert into accident values(11,'2003-01-01','Mysore road');
insert into accident values(12,'2004-02-02','South end circle');
insert into accident values(13,'2003-01-21','Bull temple road');
insert into accident values(14,'2008-02-17','Mysore road');
insert into accident values(15,'2004-03-05','Kanakpura road');
select * from accident;