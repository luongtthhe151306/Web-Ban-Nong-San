create database NongSan
use NongSan

create table Type (ID int identity(1,1) primary key, NameType nvarchar(100) not null)

create table Account (IdC int identity(1,1) primary key, Name nvarchar(50) not null, Address nvarchar(200) not null,
Phone varchar(10) not null, AccountName nvarchar(30) not null, Password varchar(10)not null)

create table Product(IdP int identity(1,1) primary key, Name nvarchar(100) not null, Price float not null, 
TypeID int foreign key references Type (ID) not null,
Origin nvarchar(30) not null, image varchar(5000) not null, QuantityStock int not null,
QuantitySold int not null, IdC int foreign key references Account(IdC) not null)

create table TotalBill(IdTB int identity(1,1) primary key, TotalMoney float, 
IdC int foreign key references Account(IdC), OrderTime date,
DeliveryTime date)

create table Orders(IdO int identity(1,1) primary key,
IdTB int foreign key references TotalBill(IdTB), 
IdP int foreign key references Product(IdP), Quantity int)

drop database NongSan
