show databases;

create database IF NOT exists pruthvi;

show databases;

use pruthvi;


create table person(driver_id varchar(10),name varchar(20), address varchar(30), primary key(driver_id));
create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
create table accident(report_num int,accident_date date, location varchar(20), primary key(report_num));
create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id, reg_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num));
create table participated(driver_id varchar(10), reg_num varchar(10), report_num int, damage_amount int, primary key(driver_id, reg_num, report_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num), foreign key(report_num) references accident(report_num));

insert into person values('A01','Richard','Srinivas nagar');
insert into person values('A02','Smith','Ashok nagar');
insert into person values('A03','John','Shivaji nagar');

insert into car values('KA052250','Indica',1990);
insert into car values('KA095477','Toyota',1998);
insert into car values('KA041702','Audi',2005);

insert into owns values('A01','KA095477');
insert into owns values('A02','KA041702');
insert into owns values('A03','KA052250');

insert into participated values('A01','KA095477',11,10000);
insert into participated values('A02','KA041702',12,50000);
insert into participated values('A03','KA052250',13,25000);

insert into accident values(11,'2003-01-01','Mysore road');
insert into accident values(12,'2004-02-02','South end circle');
insert into accident values(13,'2003-01-21','Bull temple road');

update participated set damage_amount = 25000 where reg_num = 'KA041702' and report_num = 12;
update participated set damage_amount = 25000 where reg_num = 'KA095477' and report_num = 11;

select * from participated;

select count(distinct driver_id) cars_in_2008_accidents from participated a, accident b where a.report_num= b.report_num and b.accident_date like '2003%';


