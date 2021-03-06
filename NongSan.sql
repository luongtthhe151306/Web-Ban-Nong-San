create database NongSan
use NongSan

create table Type (ID int identity(1,1) primary key, NameType nvarchar(100) not null)

create table Account (IdC int identity(1,1) primary key, Name nvarchar(50) not null, Address nvarchar(200) not null,
Phone varchar(10) not null, AccountName nvarchar(30) not null, Password varchar(10)not null,
isCustommer bit, isSaler bit, isAdmin bit)

create table Product(IdP int identity(1,1) primary key, Name nvarchar(100) not null, Price float not null, 
TypeID int foreign key references Type (ID) not null,
Origin nvarchar(30) not null, image varchar(5000) not null, QuantityStock int not null,
QuantitySold int not null, IdC int foreign key references Account(IdC) not null)

create table TotalBill(IdTB int identity(1,1) primary key, TotalMoney float, 
IdC int foreign key references Account(IdC), OrderTime datetime)

create table Orders(IdO int identity(1,1) primary key,
IdC int not null,
IdTB int foreign key references TotalBill(IdTB) not null, 
IdP int foreign key references Product(IdP) not null, NameP nvarchar(100) not null, PriceP float not null,
Quantity int not null, payment bit not null)



insert into Account( Name, Address, Phone, AccountName, Password, isAdmin)
values(N'Admin',N'Hanoi', '0912345679',N'Admin','Admin123', 1)
insert into Account( Name, Address, Phone, AccountName, Password, isSaler, isCustommer)
values(N'Hoang Hien',N'Hanoi', '0912345679',N'HoangHien','hien123@', 1, 1)
insert into Account( Name, Address, Phone, AccountName, Password, isSaler, isCustommer)
values(N'Minh Chau',N'Hanoi', '0123459872', N'MinhChau','chau456@', 1,1)
insert into Account( Name, Address, Phone, AccountName, Password, isCustommer)
values(N'MinhAnh',N'HungYen','0987123456',N'MinhAnh','anhminh@',1)
insert into Account( Name, Address, Phone, AccountName, Password, isSaler, isCustommer)
values(N'VanAnh',N'Hanoi','0987563412',N'VanAnh','anhvan34',1,1)
insert into Account( Name, Address, Phone, AccountName, Password, isSaler, isCustommer)
values(N'Hien Luong',N'Vinh Khuc-Van Giang-Hung Yen','0123456789',N'HienLuong','12345678',1,1)

insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Tám Xoan',50000,3,N'Hai Hau',
'https://namvanlong.com/assets/images/0/gao-tam-xoan-hai-hau-e7b24a10.jpg',
10,1000,2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Tẻ',35500,3,N'Vinh Phuc',
'https://nghebep.com/wp-content/uploads/2018/08/gao-te-la-gi.jpg',
50, 2000,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Táo',25000, 2,N'Lao Cai','https://cafefcdn.com/thumb_w/650/2017/20170920172246-tao-tay-1506038695093.jpg',
5,100,5)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Vải Thiều',15000,2,N'Bac Giang','https://vtv1.mediacdn.vn/thumb_w/640/2021/5/28/cc-1622172209879452926173.jpg',
30,500,6)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Trứng gà',20000,4,N'Ha Nam','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBvXj5l2ag3PlYdc_u8XtsR3OGIXaAve5zUtb-tTTfla_yztU2lzXGjIiUOp0JnxyYyOQ&usqp=CAU',
200,2000,2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Sữa chua',25000,4,N'Ha Noi','https://cdn.tgdd.vn/2021/09/CookDish/cach-lam-sua-chua-com-xanh-deo-ngon-don-gian-ngon-khong-kem-avt-1200x676.jpg',
20,100,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Cải bắp',10000,1,N'Hung Yen','https://suckhoedoisong.qltns.mediacdn.vn/Images/hahien/2017/11/16/homemade-cabbage-ointment.jpg',
5,50,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock,IdC)
values(N'Cà rốt',15000,1,N'Da Lat','https://cdn.tgdd.vn/Files/2014/07/11/553857/1.jpg',
10,60,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau cải',7000,1,N'Hung Yen','https://sieuthibecon.com/wp-content/uploads/2020/09/cai-ngot-1.jpg',
30,100,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Thái Lan',30000,3,N'Thai Lan','https://sudospaces.com/eshop/2021/09/gao20.jpg', 300, 700, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo nếp ngon',35000,3,N'Cao Bang','https://cf.shopee.vn/file/c91cc16628f026c12237e50a6be727c1', 250, 500, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Dâu Tây',90000,2,N'Da Lat','https://bhfood.vn/wp-content/uploads/2020/05/dau-tay-moc-chau-bhfood-1.jpg', 100, 300, 6)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Dưa Hấu',15000,2,N'Binh Dinh','https://dotchuoinon.wordpress.com/files/2009/11/duahau.jpg?w=640', 300, 900, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Sữa Tươi',45000,4,N'Ba Vi','http://hn.check.net.vn/data/product/mainimages/original/product11912.jpg', 200, 500, 6)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Bánh Sữa', 35000, 4,N'Moc Chau','https://mocchau24h.vn/wp-content/uploads/2021/05/banh-sua-e1621826946203.jpg', 500, 1000, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Súp Lơ',13000,1,N'Ha Nam','https://wrhc2018.com/wp-content/uploads/2020/09/sup-lo-xanh.jpg',150, 100, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Khoai Tây', 25000,1,N'Hung Yen','https://cdn.tgdd.vn/Files/2017/05/14/982280/cach-phan-biet-khoai-tay-trung-quoc-voi-khoai-tay-da-lat-2_760x506.jpg', 300, 400, 5)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Khoai Lang Tím', 23000,1,N'Ha Nam','https://madefresh.com.vn/wp-content/uploads/2020/03/Khoai-lang-tim-va-cong-dung-cua-khoai-lang-tim.jpg', 250, 100, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Mướp Đắng', 28000, 1,N'Bac Giang', 'https://sohanews.sohacdn.com/k:2015/muopdang1-1422243074231/3-tac-hai-khong-the-ngo-toi-cua-muop-dang.jpeg', 30, 50, 6)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Ngót', 7000, 1, N'Ba Vi', 'https://vinmec-prod.s3.amazonaws.com/images/20190701_083747_730217_rau-ngot.max-1800x1800.jpg', 30, 50, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Muống', 5000,1,N'Ha Noi', 'https://tinicart.vn/wp-content/uploads/2021/08/rau-muong.jpg', 50, 50, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Cần', 8000, 1,N'Ha Noi','https://khuyennongtphcm.com/wp-content/uploads/2020/09/rau-can-nuoc-4.jpg', 23, 47, 5)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Cà Chua', 23000, 1, N'Hung Yen', 'https://2sao.vietnamnetjsc.vn/images/2016/11/20/21/23/ca-chua-2_151731734.jpg', 47, 89, 6)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Cải Cúc', 5000,1,N'Ba Vi', 'https://khuyennongtphcm.com/wp-content/uploads/2020/08/cai-cuc-1.jpg', 14, 57, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Su Su',24000,1,N'Ha Noi', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Sechium_edule_dsc07767.jpg/280px-Sechium_edule_dsc07767.jpg', 57, 67,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Ớt Chuông', 35000,1,N'Da Lat', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/382/694/products/118468095-592761278067221-1321997785977077439-n.jpg?v=1630320046347', 37, 43, 2)
