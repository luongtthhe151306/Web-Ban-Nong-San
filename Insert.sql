use NongSan

insert into Type( NameType)
values (N'Rau củ')
insert into Type( NameType)
values(N'Hoa Quả')
insert into Type(NameType)
values(N'Gạo')
insert into Type( NameType)
values(N'Sản phẩm chăn nuôi')

insert into Account( Name, Address, Phone, AccountName, Password)
values('Hoang Hien','Hanoi', '0912345679','HoangHien','hien123@')
insert into Account( Name, Address, Phone, AccountName, Password)
values('Minh Chau','Hanoi', '0123459872', 'MinhChau','chau456@')
insert into Account( Name, Address, Phone, AccountName, Password)
values('MinhAnh','HungYen','0987123456','MinhAnh','anhminh@')
insert into Account( Name, Address, Phone, AccountName, Password)
values('VanAnh','Hanoi','0987563412','VanAnh','anhvan34')
insert into Account( Name, Address, Phone, AccountName, Password)
values('Hien Luong','Vinh Khuc-Van Giang-Hung Yen','0123456789','HienLuong','12345678')

insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Tám Xoan',50,3,'Hai Hau',
'https://namvanlong.com/assets/images/0/gao-tam-xoan-hai-hau-e7b24a10.jpg',
10,1000,1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Tẻ',35.5,3,'Vinh Phuc',
'https://nghebep.com/wp-content/uploads/2018/08/gao-te-la-gi.jpg',
50, 2000,1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Táo',25, 2,'Lao Cai','https://cafefcdn.com/thumb_w/650/2017/20170920172246-tao-tay-1506038695093.jpg',
5,100,2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Vải Thiều',15,2,'Bac Giang','https://vtv1.mediacdn.vn/thumb_w/640/2021/5/28/cc-1622172209879452926173.jpg',
30,500,2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Trứng gà',20,4,'Ha Nam','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBvXj5l2ag3PlYdc_u8XtsR3OGIXaAve5zUtb-tTTfla_yztU2lzXGjIiUOp0JnxyYyOQ&usqp=CAU',
200,2000,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Sữa chua',25,4,'Ha Noi','https://cdn.tgdd.vn/2021/09/CookDish/cach-lam-sua-chua-com-xanh-deo-ngon-don-gian-ngon-khong-kem-avt-1200x676.jpg',
20,100,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Cải bắp',10,1,'Hung Yen','https://suckhoedoisong.qltns.mediacdn.vn/Images/hahien/2017/11/16/homemade-cabbage-ointment.jpg',
5,50,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock,IdC)
values(N'Cà rốt',15,1,'Da Lat','https://cdn.tgdd.vn/Files/2014/07/11/553857/1.jpg',
10,60,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau cải',7,1,'Hung Yen','https://sieuthibecon.com/wp-content/uploads/2020/09/cai-ngot-1.jpg',
30,100,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Thái Lan',30,3,'Thai Lan','https://sudospaces.com/eshop/2021/09/gao20.jpg', 300, 700, 4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo nếp ngon',35,3,'Cao Bang','https://cf.shopee.vn/file/c91cc16628f026c12237e50a6be727c1', 250, 500, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Dâu Tây',90,2,'Da Lat','https://bhfood.vn/wp-content/uploads/2020/05/dau-tay-moc-chau-bhfood-1.jpg', 100, 300, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Dưa Hấu',15,2,'Binh Dinh','https://dotchuoinon.wordpress.com/files/2009/11/duahau.jpg?w=640', 300, 900, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Sữa Tươi',45,4,'Ba Vi','http://hn.check.net.vn/data/product/mainimages/original/product11912.jpg', 200, 500, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Bánh Sữa', 35, 4,'Moc Chau','https://mocchau24h.vn/wp-content/uploads/2021/05/banh-sua-e1621826946203.jpg', 500, 1000, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Súp Lơ',13,1,'Ha Nam','https://wrhc2018.com/wp-content/uploads/2020/09/sup-lo-xanh.jpg',150, 100, 3)
select * from Type
select * from Product
SELECT * FROM [Account]
drop table Type
drop table Product
delete from Type
delete from Product
use NongSan
SELECT * FROM [Product]