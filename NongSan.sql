create database NongSan
use NongSan

create table Type (ID int identity(1,1) primary key, NameType nvarchar(100))

create table Account (IdC int identity(1,1) primary key, Name nvarchar(50), Address nvarchar(200),
Phone varchar(10), AccountName nvarchar(30), Password varchar(10))

create table Product(IdP int identity(1,1) primary key, Name nvarchar(100), Price float, 
TypeID int foreign key references Type (ID),
Origin nvarchar(30), image varchar(300), QuantityStock int,
QuantitySold int, IdC int foreign key references Account(IdC))

create table TotalBill(IdTB int identity(1,1) primary key, TotalMoney float, 
IdC int foreign key references Account(IdC), OrderTime date,
DeliveryTime date)

create table Orders(IdO int identity(1,1) primary key,
IdTB int foreign key references TotalBill(IdTB), 
IdP int foreign key references Product(IdP), Quantity int)

drop database NongSan