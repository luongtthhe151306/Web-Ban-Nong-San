<%-- 
    Document   : OderProduct
    Created on : Mar 13, 2022, 4:19:03 PM
    Author     : Admin
--%>

<%@page import="Model.Product"%>
<%@page import="Model.Account"%>
<%@page import="DAO.ManagerDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html>

<head>
    <title>Oder</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styleBuyProduct.css">
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
                    <%ManagerDAO md = new ManagerDAO();
                    int IdA = Integer.parseInt(request.getParameter("IdA"));
                    Account acc = md.getAccountById(IdA);
                    %>
                    <li class="header-item">
                        <a href="" class="header-item-link"><%= acc.getAccountName() %></a>
                    </li>
                    <li class="header-item">
                        <a href="Login.jsp" class="header-item-link">Đăng xuất</a>
                    </li>
                </ul>
            </nav>
            <div class="header-home-search">
                <div class="home">
                    <a class="logo" href="HomeServlet?accname=<%= acc.getAccountName() %>&idA=<%= acc.getIdA() %>">
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
                    <a href="HomeServlet?accname=<%= acc.getAccountName() %>&idA=<%= acc.getIdA() %>" class="navigation-bar-link">Home</a>
                    <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                    <a href="OrderProduct?IdS=${IdS}&IdA=<%= acc.getIdA() %>&IdP=${IdP}" class="navigation-bar-link">Mua hàng</a>
                </div>
                <nav class="category">
                    <div class="category-heading">
                        <i class="fa-solid fa-bars category-heading-icon"></i>
                        Danh mục quản lý
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
                    <% int IdP = Integer.parseInt(request.getParameter("IdP"));
                            Product pro = md.getProductByIdP(IdP);
                        %>
                    <div class="col-sm-4" style="padding-top: 50px;">
                        <div class="store"><i class="fa-solid fa-store store-icon"></i><h4><%= acc.getAccountName() %></h4></div>
                        <div class="update-img" style="background-image: url(<%= pro.getImg() %>);"></div>
                        
                    </div>
                    <div class="col-sm-7">
                        <form class="create-product" action="OrderProductServlet?IdA=<%= acc.getIdA()%>&IdP=<%= pro.getIdP() %>">
                            <table>
                            <tr class="infomation"><td>Tên sản phẩm: <%= pro.getName() %></td></tr>
                            <tr class="infomation"><td>Giá bán: <%= pro.getPrice() %>00vnd</td></tr>
                            <tr class="infomation"><td>Xuất xứ: <%= pro.getOrigin() %></td></tr>
                            <tr class="infomation"><td>Số lượng trong kho: <%= pro.getQuantityStock() %></td></tr>
                            <tr class="infomation"><td>Đã bán: <%= pro.getQuantitySold() %></td></tr>
                            <tr><td>Số lượng: <input type="text" name="quantity" class="ipquantity"></td></tr>
                            <tr>${error}</tr>
                            <tr>
                                <td class="submit"><input class="submit-item" type="submit" name="submit" value="Thêm vào giỏ hàng"></td>
                                <td class="submit"><input class=" submit-item-link" type="submit" name="submit" value="Mua hàng"></td>
                            </tr> 
                            </table>             
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