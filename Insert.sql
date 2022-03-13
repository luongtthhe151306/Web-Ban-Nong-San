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
values(N'Hoang Hien',N'Hanoi', '0912345679',N'HoangHien','hien123@')
insert into Account( Name, Address, Phone, AccountName, Password)
values(N'Minh Chau',N'Hanoi', '0123459872', N'MinhChau','chau456@')
insert into Account( Name, Address, Phone, AccountName, Password)
values(N'MinhAnh',N'HungYen','0987123456',N'MinhAnh','anhminh@')
insert into Account( Name, Address, Phone, AccountName, Password)
values(N'VanAnh',N'Hanoi','0987563412',N'VanAnh','anhvan34')
insert into Account( Name, Address, Phone, AccountName, Password)
values(N'Hien Luong',N'Vinh Khuc-Van Giang-Hung Yen','0123456789',N'HienLuong','12345678')

insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Tám Xoan',50,3,N'Hai Hau',
'https://namvanlong.com/assets/images/0/gao-tam-xoan-hai-hau-e7b24a10.jpg',
10,1000,1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Tẻ',35.5,3,N'Vinh Phuc',
'https://nghebep.com/wp-content/uploads/2018/08/gao-te-la-gi.jpg',
50, 2000,1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Táo',25, 2,N'Lao Cai','https://cafefcdn.com/thumb_w/650/2017/20170920172246-tao-tay-1506038695093.jpg',
5,100,2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Vải Thiều',15,2,N'Bac Giang','https://vtv1.mediacdn.vn/thumb_w/640/2021/5/28/cc-1622172209879452926173.jpg',
30,500,2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Trứng gà',20,4,N'Ha Nam','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBvXj5l2ag3PlYdc_u8XtsR3OGIXaAve5zUtb-tTTfla_yztU2lzXGjIiUOp0JnxyYyOQ&usqp=CAU',
200,2000,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Sữa chua',25,4,N'Ha Noi','https://cdn.tgdd.vn/2021/09/CookDish/cach-lam-sua-chua-com-xanh-deo-ngon-don-gian-ngon-khong-kem-avt-1200x676.jpg',
20,100,3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Cải bắp',10,1,N'Hung Yen','https://suckhoedoisong.qltns.mediacdn.vn/Images/hahien/2017/11/16/homemade-cabbage-ointment.jpg',
5,50,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock,IdC)
values(N'Cà rốt',15,1,N'Da Lat','https://cdn.tgdd.vn/Files/2014/07/11/553857/1.jpg',
10,60,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau cải',7,1,N'Hung Yen','https://sieuthibecon.com/wp-content/uploads/2020/09/cai-ngot-1.jpg',
30,100,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo Thái Lan',30,3,N'Thai Lan','https://sudospaces.com/eshop/2021/09/gao20.jpg', 300, 700, 4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Gạo nếp ngon',35,3,N'Cao Bang','https://cf.shopee.vn/file/c91cc16628f026c12237e50a6be727c1', 250, 500, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Dâu Tây',90,2,N'Da Lat','https://bhfood.vn/wp-content/uploads/2020/05/dau-tay-moc-chau-bhfood-1.jpg', 100, 300, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Dưa Hấu',15,2,N'Binh Dinh','https://dotchuoinon.wordpress.com/files/2009/11/duahau.jpg?w=640', 300, 900, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Sữa Tươi',45,4,N'Ba Vi','http://hn.check.net.vn/data/product/mainimages/original/product11912.jpg', 200, 500, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Bánh Sữa', 35, 4,N'Moc Chau','https://mocchau24h.vn/wp-content/uploads/2021/05/banh-sua-e1621826946203.jpg', 500, 1000, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Súp Lơ',13,1,N'Ha Nam','https://wrhc2018.com/wp-content/uploads/2020/09/sup-lo-xanh.jpg',150, 100, 3)

insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Khoai Tây', 25,1,N'Hung Yen','https://cdn.tgdd.vn/Files/2017/05/14/982280/cach-phan-biet-khoai-tay-trung-quoc-voi-khoai-tay-da-lat-2_760x506.jpg', 300, 400, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Khoai Lang Tím', 23,1,N'Ha Nam','https://madefresh.com.vn/wp-content/uploads/2020/03/Khoai-lang-tim-va-cong-dung-cua-khoai-lang-tim.jpg', 250, 100, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Mướp Đắng', 28, 1,N'Bac Giang', 'https://sohanews.sohacdn.com/k:2015/muopdang1-1422243074231/3-tac-hai-khong-the-ngo-toi-cua-muop-dang.jpeg', 30, 50, 4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Ngót', 7, 1, N'Ba Vi', 'https://vinmec-prod.s3.amazonaws.com/images/20190701_083747_730217_rau-ngot.max-1800x1800.jpg', 30, 50, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Muống', 5,1,N'Ha Noi', 'https://tinicart.vn/wp-content/uploads/2021/08/rau-muong.jpg', 50, 50, 2)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Cần', 8, 1,N'Ha Noi','https://khuyennongtphcm.com/wp-content/uploads/2020/09/rau-can-nuoc-4.jpg', 23, 47, 1)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Cà Chua', 23, 1, N'Hung Yen', 'https://2sao.vietnamnetjsc.vn/images/2016/11/20/21/23/ca-chua-2_151731734.jpg', 47, 89, 4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Rau Cải Cúc', 5,1,N'Ba Vi', 'https://khuyennongtphcm.com/wp-content/uploads/2020/08/cai-cuc-1.jpg', 14, 57, 3)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Su Su',24,1,N'Ha Noi', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Sechium_edule_dsc07767.jpg/280px-Sechium_edule_dsc07767.jpg', 57, 67,4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Ớt Chuông', 35,1,N'Da Lat', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/382/694/products/118468095-592761278067221-1321997785977077439-n.jpg?v=1630320046347', 37, 43, 4)
insert into Product(Name, Price, TypeID, Origin, image, QuantitySold, QuantityStock, IdC)
values(N'Ớt Chuông', 35,1,N'Da Lat', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/382/694/products/118468095-592761278067221-1321997785977077439-n.jpg?v=1630320046347', 37, 43, 3)

select * from Type
select * from Product where IdP = 3
SELECT * FROM [Account]
SELECT DISTINCT A.ID, A.NameType
FROM [Type] AS A JOIN [Product] AS B ON A.ID = B.TypeID
WHERE B.IdC = 3

drop table Product
drop table Orders
drop table TotalBill
drop table Account
drop table Type
delete from Type where ID = 5
delete from Product where IdP=2
use NongSan
SELECT * when IdC = 2 FROM [Product] 
SELECT * FROM [Product] where IdC = 1;
DELETE FROM [Product] WHERE IdP = 27
UPDATE [Product] SET [Name]=N'Man hau', [Price]=17, [TypeId]=2, [Origin]=N'Ba Vi', [image]='https://traicaycaonghe.vn/wp-content/uploads/2021/04/manhau13.jpg', [QuantityStock]=100
                     WHERE IdP = 30;
UPDATE [Type] SET [NameType]=N'Hoa a'
WHERE ID = 6

INSERT INTO [TotalBill] ([IdC])
VALUES()

SELECT * FROM [Orders] WHERE IdC = 1