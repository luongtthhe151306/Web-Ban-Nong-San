create database NongSan
use NongSan

create table Type (ID int primary key, NameType varchar(30))

create table Saler(IdS int primary key, Name varchar(30), DOB varchar, gender bit,
Gmail varchar(30), Phone varchar(10)) 

create table Product(IdP int primary key, Name varchar(30), Price float, 
TypeID int foreign key references Type (ID),
Origin varchar(30), image varchar(300), QuantityStock int,
QuantitySold int, IdSaler int foreign key references Saler(IdS))

create table Buyer (IdBuyer int primary key, Name varchar(30), Address varchar(50),
Phone varchar(10))

create table TotalBill(IdTB int primary key, TotalMoney float, 
IdBuyer int foreign key references Buyer(IdBuyer), OrderTime date,
DeliveryTime date)

create table Orders(IdO int foreign key references TotalBill(IdTB), 
IdP int foreign key references Product(IdP), Quantity int)

drop table TotalBill