<%-- 
    Document   : HomeBuyer
    Created on : Feb 25, 2022, 1:10:42 AM
    Author     : Admin
--%>

<%@page import="Model.Order"%>
<%@page import="Model.Account"%>
<%@page import="Model.Type"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ManagerDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>

    <head>
        <title>ProductType</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleProductTypePage.css">
        <link rel="stylesheet" href="./font/fontawesome-free-6.0.0-web/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <div class="web">
            <header class="header">
                <% ManagerDAO md = new ManagerDAO();
                    int p = Integer.parseInt(request.getParameter("page"));
                    request.setAttribute("page", p);
                    int IdA = Integer.parseInt(request.getParameter("IdA"));
                    Account acc = md.getAccountById(IdA);%>
                <div class="grid">
                    <nav class="header-navbar">
                        <ul class="header-list">
                            <% if (acc.isIsAdmin() && acc.isIsSaler()) {%>
                            <li class="header-item">
                                <a href="ManagerAccount.jsp?IdA=<%=IdA%>&page=1" class="header-item-link">Quản lý tài khoản</a>
                            </li>
                            <li class="header-item">
                                <a href="SalerServlet?idA=<%=IdA%>" class="header-item-link">Kênh người bán</a>
                            </li>
                            <% } else if (acc.isIsAdmin()) {
                            %>
                            <li class="header-item">
                                <a href="ManagerAccount.jsp?IdA=<%=IdA%>&page=1" class="header-item-link">Quản lý tài khoản</a>
                            </li>
                            <li class="header-item">
                                <a href="SalerServlet?idA=<%=IdA%>" class="header-item-link">Quản lý sản phẩm</a>
                            </li>
                            <% } else if (acc.isIsSaler()) {%>
                            <li class="header-item">
                                <a href="SalerServlet?idA=<%=IdA%>" class="header-item-link">Kênh người bán</a>
                            </li>
                            <% } else {%>
                            <li class="header-item">
                                <a href="" class="header-item-link">Xin chào <%= acc.getAccountName()%></a>
                            </li>
                            <%}%>
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
                                        <% ArrayList<Product> prolist1 = md.getAllProduct();
                                            for (int i = prolist1.size() - 1; i > prolist1.size() - 4; i--) {%>
                                        <li class="notifi-item">
                                            <a href="OrderProduct.jsp?IdS=<%= prolist1.get(i).getAccount().getIdA()%>&IdA=<%= IdA%>&IdP=<%= prolist1.get(i).getIdP()%>" class="notifi-item" style="text-decoration: none; font-size: 16px; font-weight: 400px">
                                                <img src="<%= prolist1.get(i).getImg()%>" class="notifi-item-img">
                                                <div class="notifi-item-content">Sản phẩm mới từ <%= prolist1.get(i).getAccount().getAccountName()%> </div>
                                            </a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </li>
                            <li class="header-item">
                                <a href="AccountPage.jsp?IdA=<%=IdA%>&IdC=<%=IdA%>" class="header-item-link">${accname}</a>
                            </li>
                            <li class="header-item">
                                <a href="Login.jsp" class="header-item-link">Đăng xuất</a>
                            </li>
                        </ul>
                    </nav>
                    <div class="header-home-search">
                        <div class="home">
                            <a class="logo" href="HomeServlet?idA=${IdA}&accname=${accname}">
                                <i class="fa-solid fa-house home-logo-icon"></i>
                                <div class="header-item-link">Happy Field</div>
                            </a>
                        </div>
                        <div class="search">
                            <form style="display: flex; border: none; margin: 0px; padding: 0px; width: 98%;" action="FindServlet" method="post">
                                <input style="flex: 1; height: 32px;" class="search-input" type="text" placeholder="Nhập thông tin" name="find">
                                <div><button type="submit" style="border: none; background-color: #fff;"><i class="fa-solid fa-magnifying-glass find-icon" style=" padding: 8px 11px!important;"></i></button></div>
                                <input type="hidden" value="<%=IdA%>" name="IdA">
                            </form>
                        </div>
                        <div class="cart">
                            <%ArrayList<Order> orderlist = md.getOrderInCart(IdA);
                                request.setAttribute("orderlist", orderlist);
                                if (acc.isIsCustommser()) {
                            %>
                            <span class="cart-notify" style="position: absolute;padding: 0px 4px;background-color: #fff;color: rgb(20, 138, 26);font-size: 14px;border-radius: 17px;top: -8px;right: 38px;">${requestScope.orderlist.size()}</span>
                            <div class="logo">
                                <a href="" class="logo-link">
                                    <i class="fa-solid fa-cart-shopping cart-logo-icon"></i>
                                </a>
                                <div class="cart-list">
                                    <c:if test="${requestScope.orderlist.size() == 0}">
                                        <img src="./image/empty-cart.webp" class="empty-cart">
                                        <a class="cart-view" style="text-decoration: none; color:rgba(44, 43, 43, 0.993);" href="CartPage.jsp?IdA=<%=IdA%>">Xem giỏ hàng</a>
                                    </c:if>
                                    <c:if test="${requestScope.orderlist.size() < 2 && requestScope.orderlist.size()!= 0}">
                                        <c:forEach begin="0" end="${requestScope.orderlist.size()}" items="${orderlist}" var="order">
                                            <a href="" class="cart-item">
                                                <img src="${order.getProduct().getImg()}" class="img-cart">
                                                <div class="cart-content">
                                                    <span class="cart-content-name"><c:out value="${order.getProduct().getName()}"></c:out></span></br>
                                                    <fmt:parseNumber var="j" integerOnly="true" type="number" value="${order.getProduct().getPrice()}" />
                                                    <span class="cart-content-price"><c:out value="${j}"></c:out>vnd  x <c:out value="${order.getQuantity()}"></c:out></span>
                                                    </div>
                                                </a>
                                        </c:forEach>
                                        <a class="cart-view" style="text-decoration: none; color:rgba(44, 43, 43, 0.993);" href="CartPage.jsp?IdA=<%=IdA%>">Xem giỏ hàng</a>
                                    </c:if>
                                    <c:if test="${requestScope.orderlist.size() >= 2}">
                                        <c:forEach begin="0" end="1" items="${requestScope.orderlist}" var="order">
                                            <a href="" class="cart-item">
                                                <img src="${order.getProduct().getImg()}" class="img-cart">
                                                <div class="cart-content">
                                                    <span class="cart-content-name"><c:out value="${order.getProduct().getName()}"></c:out></span></br>
                                                    <fmt:parseNumber var="j" integerOnly="true" type="number" value="${order.getProduct().getPrice()}" />
                                                    <span class="cart-content-price"><c:out value="${j}"></c:out>vnd  x <c:out value="${order.getQuantity()}"></c:out></span>
                                                    </div>
                                                </a>
                                        </c:forEach>                        
                                        <a class="cart-view" style="text-decoration: none; color:rgba(44, 43, 43, 0.993);" href="CartPage.jsp?IdA=<%=IdA%>">Xem giỏ hàng</a>
                                    </c:if>
                                </div>
                            </div>
                            <%}%>
                        </div>

                    </div>
                </div>
            </header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="navigation-bar" >
                            <a href="HomeServlet?idA=${IdA}&accname=${accname}" class="navigation-bar-link" >Home</a>
                            <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                            <a href="ProductTypeServlet?idT=${type.getIdType()}&IdA=${IdA}" class="navigation-bar-link" >${ typename}</a>
                        </div>
                        <nav class="category">
                            <div class="category-heading">
                                <i class="fa-solid fa-bars category-heading-icon"></i>
                                Danh mục sản phẩm
                            </div>
                            <ul class="category-list">
                                <c:forEach items="${typelist}" var="type">
                                    <li class="category-item">
                                        <a href="ProductTypeServlet?idT=${type.getIdType()}&IdA=${IdA}&page=1" class="catagory-item-link">${type.getTypeName()}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-sm-9">
                        <div class="home-product">
                            <div class="row">
                                <% ArrayList<Product> prolist = (ArrayList<Product>) request.getAttribute("prolist");
                                    int z = 0;
                                    int n = 12;
                                    int size = prolist.size();
                                    if (size % n == 0) {
                                        z = size / n;
                                    } else {
                                        z = (size / n) + 1;
                                    }

                                    int e = n * p ;
                                    int b = n * p - n;
                                    if (e > size) {
                                        e = size;
                                    }
                                    request.setAttribute("end", e);
                                    request.setAttribute("begin", b);
                                    request.setAttribute("zpage", z);
                                %> 
                                <div class="product-list"><a href="ProductTypeServlet?idT=${idT}&IdA=${IdA}" class="product-list-link">${ typename}</a></div>
                                    <% for (int j = b; j < e; j++) {%>
                                <div class="col-sm-3 " style="margin-top: 20px">
                                    <div class="product-item">
                                        <a href="OrderProduct.jsp?IdA=${IdA}&IdS=<%= prolist.get(j).getAccount().getIdA()%>&IdP=<%= prolist.get(j).getIdP()%>" class="product-item-link">
                                            <img src= "<%= prolist.get(j).getImg()%>" class="product-item-img" style="height: 170px">
                                            <p class="product-item-name"><%= prolist.get(j).getName()%></p>
                                            <fmt:parseNumber var="j" integerOnly="true" type="number" value="<%= String.valueOf(prolist.get(j).getPrice())%>" />
                                            <p class="product-item-price">${j}vnd</p>
                                        </a>
                                    </div>
                                </div>                                            
                                <%}%>       
                            </div>                                    
                        </div>
                        <div class="pagging" style="display: flex;padding-left: 90%;">
                            <c:choose>
                                <c:when test="${requestScope.page == 1 && requestScope.zpage > 1}">
                                    <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p%>"><%= p%></a></div>  
                                    <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p + 1%>">>></a></div>    
                                </c:when>
                                <c:when test="${requestScope.page == 1 && requestScope.zpage == 1}">
                                    <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p%>"><%= p%></a></div>  
                                </c:when>
                                <c:when test="${requestScope.page > 1 && requestScope.page < requestScope.zpage}">
                                    <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p - 1%>"><<</a></div>
                                    <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p%>"><%= p%></a></div>  
                                    <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p + 1%>">>></a></div>    
                                </c:when>
                                <c:when test="${requestScope.page == requestScope.zpage}">
                                    <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p - 1%>"><<</a></div>
                                    <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ProductTypeServlet?idT=${idT}&IdA=${IdA}&page=<%= p%>"><%= p%></a></div>    
                                    </c:when>  
                                </c:choose>
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
