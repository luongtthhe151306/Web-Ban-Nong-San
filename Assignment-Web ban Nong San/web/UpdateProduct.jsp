<%-- 
    Document   : UpdateProduct
    Created on : Mar 12, 2022, 5:18:57 PM
    Author     : Admin
--%>

<%@page import="Model.Order"%>
<%@page import="Model.Type"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="DAO.ManagerDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
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
                    <%ManagerDAO md = new ManagerDAO();
                                ArrayList<Account> acclist = md.getAccount();
                                int IdA = Integer.parseInt(request.getParameter("IdA"));
                                Account acc = null;
                                for (Account acclist1 : acclist) {
                                    if (acclist1.getIdA() == IdA) {
                                acc = acclist1;
                            }
                        }%>
                    <ul class="header-list">                    
                        <% if (acc.isIsAdmin() && acc.isIsSaler()) {%>
                        <li class="header-item">
                            <a href="ManagerAccount.jsp?IdA=<%=IdA%>&page=1" class="header-item-link">Qu???n l?? t??i kho???n</a>
                        </li>
                        <li class="header-item">
                            <a href="SalerServlet?idA=<%=IdA%>" class="header-item-link">K??nh ng?????i b??n</a>
                        </li>
                        <% } else if (acc.isIsAdmin()) {
                        %>
                        <li class="header-item">
                            <a href="ManagerAccount.jsp?IdA=<%=IdA%>&page=1" class="header-item-link">Qu???n l?? t??i kho???n</a>
                        </li>
                        <li class="header-item">
                            <a href="SalerServlet?idA=<%=IdA%>" class="header-item-link">Qu???n l?? s???n ph???m</a>
                        </li>
                        <% } else if (acc.isIsSaler()) {%>
                        <li class="header-item">
                            <a href="SalerServlet?idA=<%=IdA%>" class="header-item-link">K??nh ng?????i b??n</a>
                        </li>
                        <% } else {%>
                        <li class="header-item">
                            <a href="" class="header-item-link">Xin ch??o <%= acc.getAccountName()%></a>
                        </li>
                        <%}%>
                    </ul>
                    <ul class="header-list">
                        <li class="header-item link-has-notifi">
                            <i class="fa-solid fa-bell"></i>
                            <a href="" class="header-item-link">Th??ng b??o</a>
                            <div class="header-notification">
                                <header class="notifi-header">
                                    <div>Th??ng b??o m???i</div>
                                </header>
                                <ul class="notifi-list">
                                    <% ArrayList<Product> prolist1 = md.getAllProduct();
                                        for (int i = prolist1.size() - 1; i > prolist1.size() - 4; i--) {%>
                                    <li class="notifi-item">
                                        <a href="OrderProduct.jsp?IdS=<%= prolist1.get(i).getAccount().getIdA()%>&IdA=<%= IdA%>&IdP=<%= prolist1.get(i).getIdP()%>" class="notifi-item" style="text-decoration: none; font-size: 16px; font-weight: 400px">
                                            <img src="<%= prolist1.get(i).getImg()%>" class="notifi-item-img">
                                            <div class="notifi-item-content">S???n ph???m m???i t??? <%= prolist1.get(i).getAccount().getAccountName()%> </div>
                                        </a>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </li>
                        <li class="header-item">
                            <a href="AccountPage.jsp?IdA=<%=IdA%>&IdC=<%=IdA%>" class="header-item-link"><%= acc.getAccountName()%></a>
                        </li>
                        <li class="header-item">
                            <a href="Login.jsp" class="header-item-link">????ng xu???t</a>
                        </li>
                    </ul>
                </nav>
                <div class="header-home-search">
                    <div class="home">
                        <a class="logo" href="HomeServlet?idA=<%= acc.getIdA()%>&accname=<%= acc.getAccountName()%>">
                            <i class="fa-solid fa-house home-logo-icon"></i>
                            <div class="header-item-link">Happy Field</div>
                        </a>
                    </div>
                    <div class="search">
                        <form style="display: flex; border: none; margin: 0px; padding: 0px; width: 98%;" action="FindServlet" method="post">
                            <input style="flex: 1; height: 32px;" class="search-input" type="text" placeholder="Nh???p th??ng tin" name="find">
                            <div><button type="submit" style="border: none; background-color: #fff;"><i class="fa-solid fa-magnifying-glass find-icon" style=" padding: 8px 11px!important;"></i></button></div>
                            <input type="hidden" value="<%=IdA%>" name="IdA">
                        </form>
                    </div>
                    <div class="cart">
                        <%ArrayList<Order> orderlist1 = md.getOrderInCart(IdA);
                        request.setAttribute("orderlist1", orderlist1);
                        %>
                        <span class="cart-notify" style="position: absolute;padding: 0px 4px;background-color: #fff;color: rgb(20, 138, 26);font-size: 14px;border-radius: 17px;top: -8px;right: 38px;">${requestScope.orderlist1.size()}</span>
                        <div class="logo">
                            <a href="" class="logo-link">
                                <i class="fa-solid fa-cart-shopping cart-logo-icon"></i>
                            </a>
                            <div class="cart-list">
                                <c:if test="${requestScope.orderlist1.size() == 0}">
                                    <img src="./image/empty-cart.webp" class="empty-cart">
                                    <a class="cart-view" style="text-decoration: none; color:rgba(44, 43, 43, 0.993);" href="CartPage.jsp?IdA=<%=IdA%>">Xem gi??? h??ng</a>
                                </c:if>
                                <c:if test="${requestScope.orderlist1.size() < 2 && requestScope.orderlist1.size()!= 0}">
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
                                    <a class="cart-view" style="text-decoration: none; color:rgba(44, 43, 43, 0.993);" href="CartPage.jsp?IdA=<%=IdA%>">Xem gi??? h??ng</a>
                                </c:if>
                                <c:if test="${requestScope.orderlist1.size() >= 2}">
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
                                    <a class="cart-view" style="text-decoration: none; color:rgba(44, 43, 43, 0.993);" href="CartPage.jsp?IdA=<%=IdA%>">Xem gi??? h??ng</a>
                                </c:if>
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
                        <a href="HomeServlet?idA=<%= acc.getIdA()%>&accname=<%= acc.getAccountName()%>" class="navigation-bar-link">Home</a>
                        <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                        <a href="SalerServlet?idA=<%= acc.getIdA()%>" class="navigation-bar-link">K??nh ng?????i b??n</a>
                        <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                        <a href="UpdateProductPageServlet?IdA=<%= acc.getIdA()%>" class="navigation-bar-link">C???p nh???t s???n ph???m</a>
                    </div>
                    <nav class="category">
                        <div class="category-heading">
                            <i class="fa-solid fa-bars category-heading-icon"></i>
                            Danh m???c qu???n l?? s???n ph???m
                        </div>
                        <ul class="category-list">
                            <li class="category-item">
                                <a href="CreateProduct.jsp?IdA=<%= acc.getIdA()%>" class="catagory-item-link">Th??m s???n ph???m</a>
                            </li>
                            <li class="category-item">
                                <a href="DeleteProductPageServlet?IdA=<%= acc.getIdA()%>" class="catagory-item-link">X??a s???n ph???m</a>
                            </li>
                            <li class="category-item">
                                <a href="UpdateProductPageServlet?IdA=<%= acc.getIdA()%>" class="catagory-item-link">C???p nh???t l???i s???n ph???m</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-sm-9">
                    <div class="row">
                        <%ArrayList<Product> prolist = md.getAllProduct();
                            int IdP = Integer.parseInt(request.getParameter("IdP"));
                            Product pro = md.getProductByIdP(IdP);
                            
                        %>
                        <div class="col-sm-4" style="padding-top: 50px;">
                            <div class="update-img" style="background-image: url(<%=pro.getImg()%>);"></div>
                        </div>
                        <div class="col-sm-8">
                            <form class="create-product" action="UpdateProductItemServlet?IdA=<%= IdA%>&IdP=<%= IdP%>" method="post">
                                <div class="input-infomation">
                                    T??n s???n ph???m: <input type="text" name="ipName"placeholder="<%= pro.getName()%>" value="<%= pro.getName()%>">
                                </div>
                                <div class="input-infomation">
                                    <fmt:parseNumber var="j" integerOnly="true" type="number" value="<%= String.valueOf( pro.getPrice()) %>" />
                                    Gi?? b??n: <input type="text" name="ipPrice" placeholder="${j}" value="${j}">
                                </div>
                                <div class="input-infomation">
                                    <%ArrayList<Type> typelist = md.getProductType();
                                    for (Type typelist1 : typelist) {
                                        if (typelist1.getIdType() == pro.getType().getIdType()) {%>
                                    <div><input type="checkbox" checked="true" name="checkType" value="<%= typelist1.getTypeName()%>"><%= typelist1.getTypeName()%></div>            
                                        <%} else {%>
                                    <div><input type="checkbox" name="checkType" value="<%= typelist1.getTypeName()%>"><%= typelist1.getTypeName()%></div>   
                                        <%}
                                        }%>
                                </div>
                                <div class="input-infomation">
                                    Nh???p lo???i s???n ph???m m???i:<input type="text" name="ipType" placeholder="Nh???p lo???i s???n ph???m">
                                </div>
                                <div class="input-infomation">
                                    Xu???t x???: <input type="text" name="ipOrigin" placeholder="<%= pro.getOrigin()%>" value="<%= pro.getOrigin()%>">
                                </div>
                                <div class="input-infomation">
                                    H??nh ???nh: <input type="text" name="ipImg" placeholder="<%= pro.getImg()%>" value="<%= pro.getImg()%>">
                                </div>
                                <div class="input-infomation">
                                    S??? l?????ng trong kho: <input type="text" name="ipQuantityStock" placeholder="<%= pro.getQuantityStock()%>" value="<%= pro.getQuantityStock()%>">
                                </div>
                                <input type="submit" value="C???p nh???t S???n Ph???m">
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
                            T???ng ????i: 1900 636 648
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
                            Cam k???t ch???t l?????ng, kh??ng h??i l??ng tr??? h??ng
                        </div>
                        <div>
                            <i class="fa-solid fa-truck-fast footer-icon"></i>
                            Shopping nhanh, giao h??ng l???
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