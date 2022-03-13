<%-- 
    Document   : HomeBuyer
    Created on : Feb 25, 2022, 1:10:42 AM
    Author     : Admin
--%>

<%@page import="Model.Type"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ManagerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleHome.css">
        <link rel="stylesheet" href="./font/fontawesome-free-6.0.0-web/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <div class="web">
            <header class="header">
                <div class="grid">
                    <nav class="header-navbar">
                        <ul class="header-list">
                            <li class="header-item">
                                <a href="SalerServlet?idA=${idA}" class="header-item-link">Kênh người bán</a>
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
                            <c:choose>
                                <c:when test="${accname == null}">
                                    <li class="header-item">
                                        <a href="Login.jsp" class="header-item-link">Đăng nhập</a>
                                    </li>
                                    <li class="header-item">
                                        <a href="" class="header-item-link">Đăng ký</a>
                                    </li>
                                </c:when>
                                <c:when test="${accname != null}">
                                    <li class="header-item">
                                        <a href="" class="header-item-link">${accname}</a>
                                    </li>
                                    <li class="header-item">
                                        <a href="Login.jsp" class="header-item-link">Đăng xuất</a>
                                    </li>  
                                </c:when>
                            </c:choose>                            
                        </ul>
                    </nav>
                    <div class="header-home-search">
                        <div class="home">
                            <a class="logo" href="HomeServlet?accname=${accname}&idA=${idA}">
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
                        <a href="HomeServlet?accname=${accname}&idA=${idA}" style="text-decoration: none;"><h3 style="margin-left: 10px 0 0 35px; color: #fff">Home</h3></a>
                        <nav class="category">
                            <div class="category-heading">
                                <i class="fa-solid fa-bars category-heading-icon"></i>
                                Danh mục sản phẩm
                            </div>
                            <ul class="category-list">
                                <c:forEach items="${typelist}" var="type">
                                    <li class="category-item">
                                        <a href="ProductTypeServlet?idT=${type.getIdType()}&IdA=${idA}" class="catagory-item-link">${type.getTypeName()}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-sm-9">
                        <div class="home-product">
                            <% ManagerDAO md = new ManagerDAO();
                                ArrayList<Type> typelist = (ArrayList<Type>) request.getAttribute("typelist");
                                for (Type typelist1 : typelist) {%>
                            <div class="row">
                            <div class="product-list">
                                <a class="product-list-link" href="ProductTypeServlet?idT=<%= typelist1.getIdType()%>&IdA=${idA}"><%= typelist1.getTypeName()%></a>
                            </div>
                            
                                <%ArrayList<Product> prolist = new ArrayList();
                                    prolist = md.getProduct(typelist1.getIdType());
                                    request.setAttribute("prolist", prolist);%>
                                <c:forEach begin="0" end="3" items="${requestScope.prolist}" var="pro">
                                    <div class="col-sm-3">
                                        <div class="product-item">
                                            <a href="OrderProduct.jsp?IdS=${pro.getAccount().getIdA()}&IdA=${idA}&IdP=${ pro.getIdP}" class="product-item-link">
                                                <image class="product-item-img" src="${pro.getImg()}" style="height: 170px">
                                                <p class="product-item-name">${pro.getName()}</p>
                                                <p class="product-item-price">${pro.getPrice()}</p>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <a class="product-viewall" href="ProductTypeServlet?idT=<%= typelist1.getIdType()%>&IdA=${idA}">Xem tất cả</a>
                            </div>
                            <%}%>
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
        </div>
    </body>

</html>
