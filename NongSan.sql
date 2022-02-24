create database NongSan
use NongSan

create table Type (ID int identity(1,1) primary key, NameType nvarchar(100))

create table Saler(IdS int identity(1,1) primary key, Name varchar(30),Address varchar(50), Phone varchar(10),
AccountName varchar(30), Password varchar(8)) 

create table Product(IdP int identity(1,1) primary key, Name nvarchar(100), Price float, 
TypeID int foreign key references Type (ID),
Origin varchar(30), image varchar(300), QuantityStock int,
QuantitySold int, IdSaler int foreign key references Saler(IdS))

create table Buyer (IdBuyer int identity(1,1) primary key, Name varchar(30), Address nvarchar(200),
Phone varchar(10), AccountName varchar(30), Password varchar(8))

create table TotalBill(IdTB int identity(1,1) primary key, TotalMoney float, 
IdBuyer int foreign key references Buyer(IdBuyer), OrderTime date,
DeliveryTime date)

create table Orders(IdO int identity(1,1) primary key,IdB int foreign key references TotalBill(IdTB), 
IdP int foreign key references Product(IdP), Quantity int)

drop table Product