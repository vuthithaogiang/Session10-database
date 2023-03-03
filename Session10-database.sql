use master
go

if exists (select * from  sys.databases where Name='Session10')
drop  database Session10

create database Session10

use Session10 
go

create table Person (
   Person_ID int identity (1, 1) check (Person_Id < 1000000) primary key,
   LName varchar(25) not null,
   Project_ID varchar(15)  not null, 
   Dept_Name varchar(15) not null
);

create table Department (
  Dept_Name varchar(15) not null,
  UNIQUE (Dept_Name),
  primary key (Dept_Name)

);

create table Project (
  Project_ID varchar(15) not null,
  UNIQUE (Project_ID), 
  Budget dec(6,2) not null, 
  Dept_Name varchar(15) not null,

  primary key (Project_ID), 

  foreign key (Dept_Name) references Department(Dept_Name)


);

alter table Person 
   add constraint  FK_ProjectId  foreign key (Project_ID) references Project(Project_Id)

go

alter table Person 
   add constraint FK_DeptName foreign key (Dept_Name) references Department(Dept_Name)
go


  

select * from Person 

select * from Department 

select * from Project