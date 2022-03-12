<%-- 
    Document   : UpdateProduct
    Created on : Mar 12, 2022, 5:18:57 PM
    Author     : Admin
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>UpdateProduct</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styleUpdateProductPage.css">
    <link rel="stylesheet" href="./font/fontawesome-free-6.0.0-web/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <header class="header">
        <div class="grid">
            <nav class="header-navbar">
                <ul class="header-list">
                    <!-- <a href="DemoHome.html" class="img-itema">
                                <img width="100" height="100" src="../web/image/Happyfield_logos__primary_hollow_yellow_transparent+(1).png">
                            </a> -->
                    <li class="header-item">
                        <a href="" class="header-item-link">Kênh người bán</a>
                    </li>
                </ul>
                <ul class="header-list">
                    <li class="header-item link-has-notifi">
                        <i class="fa-solid fa-bell"></i>
                        <a href="" class="header-item-link">Thông báo</a>
                        <div class="header-notification">
                            <header class="notifi-header">
                                <div>Thông báo mới</div>
                            </header>
                            <ul class="notifi-list">
                                <li class="notifi-item">
                                    <img src="../web/image/logo.jpg" class="notifi-item-img">
                                    <div class="notifi-item-content">Sản phẩm mới từ </div>
                                </li>
                                <li class="notifi-item">
                                    <img src="../web/image/logo.jpg" class="notifi-item-img">
                                    <div class="notifi-item-content">Sản phẩm mới từ </div>
                                </li>
                                <li class="notifi-item">
                                    <img src="../web/image/logo.jpg" class="notifi-item-img">
                                    <div class="notifi-item-content">Sản phẩm mới từ </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="header-item">
                        <a href="" class="header-item-link">Đăng nhập</a>
                    </li>
                    <li class="header-item">
                        <a href="" class="header-item-link">Đăng ký</a>
                    </li>
                </ul>
            </nav>
            <div class="header-home-search">
                <div class="home">
                    <a class="logo" href="DemoHome.html">
                        <i class="fa-solid fa-house home-logo-icon"></i>
                        <div class="header-item-link">Happy Field</div>
                    </a>
                </div>
                <div class="search">
                    <input class="search-input" type="text" placeholder="Nhập tên sản phẩm">
                    <a href=""><i class="fa-solid fa-magnifying-glass find-icon"></i></a>
                </div>
                <div class="cart">
                    <span class="cart-notify">3</span>
                    <div class="logo">                       
                        <i class="fa-solid fa-cart-shopping cart-logo-icon"></i>
                        <div class="cart-list">
                            <!-- <img src="./image/empty-cart.webp" class="empty-cart"> -->
                            
                            <a href="" class="cart-item">
                                <img src="./image/empty-cart.webp" class="img-cart">
                                <div class="cart-content">
                                    <span class="cart-content-name">Tên sản phẩm</span></br>
                                    <span class="cart-content-price">25.000vnd</span>
                                </div>
                            </a>
                            <a href="" class="cart-item">
                                <img src="./image/empty-cart.webp" class="img-cart">
                                <div class="cart-content">
                                    <span class="cart-content-name">Tên sản phẩm</span></br>
                                    <span class="cart-content-price">25.000vnd</span>
                                </div>
                            </a>
                            <a href="" class="cart-item">
                                <img src="./image/empty-cart.webp" class="img-cart">
                                <div class="cart-content">
                                    <span class="cart-content-name">Tên sản phẩm</span></br>
                                    <span class="cart-content-price">25.000vnd</span>
                                </div>
                            </a>
                            <a class="cart-view" href="">Xem giỏ hàng</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </header>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
                <div class="navigation-bar">
                    <a href="" class="navigation-bar-link">Home</a>
                    <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                    <a href="" class="navigation-bar-link">Kênh người bán</a>
                    <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                    <a href="" class="navigation-bar-link">Cập nhật sản phẩm</a>
                </div>
                <nav class="category">
                    <div class="category-heading">
                        <i class="fa-solid fa-bars category-heading-icon"></i>
                        Danh mục quản lý sản phẩm
                    </div>
                    <ul class="category-list">
                        <li class="category-item">
                            <a href="" class="catagory-item-link">Thêm sản phẩm</a>
                        </li>
                        <li class="category-item">
                            <a href="" class="catagory-item-link">Xóa sản phẩm</a>
                        </li>
                        <li class="category-item">
                            <a href="" class="catagory-item-link">Cập nhật lại sản phẩm</a>
                        </li>
                        <li class="category-item">
                            <a href="" class="catagory-item-link">Cài đặt</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-4" style="padding-top: 50px;">
                        <div class="update-img" style="background-image: url(./image/empty-cart.webp);"></div>
                    </div>
                    <div class="col-sm-7">
                        <form class="create-product">
                            <div class="input-infomation">Tên sản phẩm: <input type="text" name="ipName"placeholder="Nhập tên sản phẩm"></div>
                            <div class="input-infomation">Giá bán: <input type="text" name="ipPrice" placeholder="Nhập giá bán"></div>
                            <div class="input-infomation">Chọn loại sản phẩm:
                                <div><input type="checkbox" name="checkType" value="Rau củ">Rau củ</div>
                                <div><input type="checkbox" name="checkType" value="Rau củ">Rau củ</div>
                                <div><input type="checkbox" name="checkType" value="Rau củ">Rau củ</div>
                                <div><input type="checkbox" name="checkType" value="Rau củ">Rau củ</div>
                            </div>
                            <div class="input-infomation">Nhập loại sản phẩm mới:<input type="text" name="ipType" placeholder="Nhập loại sản phẩm"></div>
                            <div class="input-infomation">Xuất xứ: <input type="text" name="ipOrigin" placeholder="Xuất xứ"></div>
                            <div class="input-infomation">Hình Ảnh: <input type="text" name="ipImg" placeholder="Link địa chỉ ảnh"></div>
                            <div class="input-infomation">Số lượng trong kho: <input type="text" name="ipQuantityStock" placeholder="Nhập số lượng"></div>
                            <input type="submit" value="Cập nhật Sản Phẩm">
                        </form>
                    </div>
                </div>       
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="row">
            <div class="col-sm-4 footer-contact">
                <div class="footer-contact-list">
                    <div>
                        <i class="fa-solid fa-phone footer-icon"></i>
                        Tổng đài: 1900 636 648
                    </div>
                    <div>
                        <i class="fa-solid fa-envelope footer-icon"></i>
                        Gmail: Hf@gmail.com
                    </div>
                </div>
            </div>
            <div class="col-sm-8 footer-content">
                <div class="footer-content-list">
                    <div>
                        <i class="fa-solid fa-check-double footer-icon"></i>
                        Cam kết chất lượng, không hài lòng trả hàng
                    </div>
                    <div>
                        <i class="fa-solid fa-truck-fast footer-icon"></i>
                        Shopping nhanh, giao hàng lẹ
                    </div>
                    <div>
                        <i class="fa-brands fa-facebook footer-icon"></i>
                        <i class="fa-brands fa-instagram footer-icon"></i>
                        <i class="fa-brands fa-google-play footer-icon"></i>
                    </div>
                </div>
            </div>
            <!-- <div class="col-sm-1"></div> -->
        </div>
    </footer>
</body>

</html>