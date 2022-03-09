<%-- 
    Document   : ProductTypePage
    Created on : Mar 10, 2022, 12:41:21 AM
    Author     : Admin
--%>

<%@page import="Model.Product"%>
<%@page import="Model.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ManagerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Type Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleProductTypePage.css">
        <link rel="stylesheet" href="./font/fontawesome-free-6.0.0-web/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <header class="header">
            <div class="grid">
                <nav class="header-navbar">
                    <ul class="header-list">
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
                        <div class="logo">
                            <a href="" class="logo-link">
                                <i class="fa-solid fa-cart-shopping cart-logo-icon"></i>
                            </a>
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
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3">
                    <div class="navigation-bar" >
                        <a href="" class="navigation-bar-link" >Home</a>
                        <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                        <a href="" class="navigation-bar-link" >Sản phẩm chăn nuôi</a>
                    </div>
                    <nav class="category">
                        <div class="category-heading">
                            <i class="fa-solid fa-bars category-heading-icon"></i>
                            Danh mục sản phẩm
                        </div>
                        <ul class="category-list">
                            <c:forEach items="${typelist}" var="type">
                                <li class="category-item">
                                    <a href="" class="catagory-item-link">${type.getTypeName()}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
                <div class="col-sm-9">
                    <div class="home-product">
                            <div class="row">
                            <%ManagerDAO md = new ManagerDAO();
                                ArrayList<Type> typelist = (ArrayList) request.getAttribute("typelist");
                                for (int i = 0; i < typelist.size(); i++) {%>
                            <div class="product-list"><a href="" class="product-list-link"><%= typelist.get(i).getTypeName()%></a></div>
                                <%ArrayList<Product> prolist = md.getProduct(typelist.get(i).getIdType());
                                        for (int j = 0; j < 4; j++) {%>
                            <div class="col-sm-3 ">
                                <div class="product-item">
                                    <a href="" class="product-item-link">
                                        <img src= "<%= prolist.get(j).getImg()%>" class="product-item-img" style="height: 170px">
                                        <p class="product-item-name"><%= prolist.get(j).getName()%></p>
                                        <p class="product-item-price"><%= prolist.get(j).getPrice()%></p>
                                    </a>
                                </div>
                            </div>

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

