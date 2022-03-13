<%-- 
    Document   : CreateProduct
    Created on : Mar 12, 2022, 9:38:41 AM
    Author     : Admin
--%>

<%@page import="Model.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="DAO.ManagerDAO"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>

<head>
    <title>CreateProduct</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styleCreatProductPage.css">
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
                    <% int IdA = Integer.parseInt(request.getParameter("IdA"));
                    ManagerDAO md = new ManagerDAO();
                    ArrayList<Account> acclist = md.getAccount();
                    Account acc = new Account() ;
                    for(int i=0; i<acclist.size(); i++){
                        if(acclist.get(i).getIdA() == IdA){
                            acc = acclist.get(i);
                        }                                                
                    }
                    %>
                        <a href="SalerServlet?idA=<%= acc.getIdA() %>" class="header-item-link">Kênh người bán</a>
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
                        <a href="" class="header-item-link"><%= acc.getAccountName() %></a>
                    </li>
                    <li class="header-item">
                        <a href="" class="header-item-link">Đăng xuất</a>
                    </li>

                    
                </ul>
            </nav>
            <div class="header-home-search">
                <div class="home">
                    <a class="logo" href="HomeServlet?idA=<%= acc.getIdA() %>&accname=<%= acc.getAccountName() %>">
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
                <div class="navigation-bar">
                    <a href="HomeServlet?idA=<%= acc.getIdA() %>&accname=<%= acc.getAccountName() %>" class="navigation-bar-link">Home</a>
                    <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                    <a href="SalerServlet?idA=<%= acc.getIdA() %>" class="navigation-bar-link">Kênh người bán</a>
                    <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                    <a href="CreateProduct.jsp?IdA=<%= acc.getIdA() %>" class="navigation-bar-link">Thêm sản phẩm</a>
                </div>
                <nav class="category">
                    <div class="category-heading">
                        <i class="fa-solid fa-bars category-heading-icon"></i>
                        Danh mục quản lý sản phẩm
                    </div>
                    <ul class="category-list">
                        <li class="category-item">
                            <a href="CreateProduct.jsp?IdA=<%= acc.getIdA() %>" class="catagory-item-link">Thêm sản phẩm</a>
                        </li>
                        <li class="category-item">
                            <a href="DeleteProductPageServlet?IdA=<%= acc.getIdA() %>" class="catagory-item-link">Xóa sản phẩm</a>
                        </li>
                        <li class="category-item">
                            <a href="UpdateProductPageServlet?IdA=<%= acc.getIdA() %>" class="catagory-item-link">Cập nhật lại sản phẩm</a>
                        </li>
                        
                    </ul>
                </nav>
            </div>
            <div class="col-sm-9">
                <form class="create-product" action="CreateProductServlet?IdA=<%=IdA%>" method="post">
                    <div class="input-infomation">Tên sản phẩm: <input type="text" name="ipName"placeholder="Nhập tên sản phẩm"></div>
                    <div class="input-infomation">Giá bản: <input type="text" name="ipPrice" placeholder="Nhập giá bán"></div>
                    <div class="input-infomation">Chọn loại sản phẩm:
                        <%ArrayList<Type> typelist = md.getProductType();
                        int s = typelist.size();
                        for(int i=0; i<=s-1; i++){ %>
                        <input type="checkbox" name="checkType" value="<%= typelist.get(i).getIdType()%>"><%= typelist.get(i).getTypeName() %>        
                        <%}%>
                    </div>
                    <div class="input-infomation">Nhập loại sản phẩm mới:<input type="text" name="ipType" placeholder="Nhập loại sản phẩm"></div>
                    <div class="input-infomation">Xuất xứ: <input type="text" name="ipOrigin" placeholder="Xuất xứ"></div>
                    <div class="input-infomation">Hình Ảnh: <input type="text" name="ipImg" placeholder="Link địa chỉ ảnh"></div>
                    <div class="input-infomation">Số lượng trong kho: <input type="text" name="ipQuantityStock" placeholder="Nhập số lượng"></div>
                    <input type="submit" value="Thêm Sản Phẩm">
                </form>
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