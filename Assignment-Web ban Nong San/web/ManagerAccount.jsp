<%-- 
    Document   : CartPage
    Created on : Mar 14, 2022, 12:37:31 AM
    Author     : Admin
--%>

<%@page import="Model.Type"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Order"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ManagerDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>

    <head>
        <title>Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleAccountPage.css">
        <link rel="stylesheet" href="./font/fontawesome-free-6.0.0-web/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <% ManagerDAO md = new ManagerDAO();
            int IdA = Integer.parseInt(request.getParameter("IdA"));
            Account acc = md.getAccountById(IdA);
            int p = Integer.parseInt(request.getParameter("page"));
            request.setAttribute("page", p);
        %>
        <header class="header">
            <div class="grid">
                <nav class="header-navbar">
                    <ul class="header-list">  
                        <%if (acc.isIsAdmin() && acc.isIsSaler()) { %>
                        <li class="header-item">
                            <a href="ManagerAccount.jsp?IdA=<%= IdA%>&page=1" class="header-item-link">Quản lý tài khoản</a>
                        </li>
                        <li class="header-item">
                            <a href="SalerServlet?idA=<%= IdA%>" class="header-item-link">Kênh người bán</a>
                        </li>
                        <% } else if (acc.isIsAdmin() && !acc.isIsSaler()) {%>
                        <li class="header-item">
                            <a href="ManagerAccount?IdA=<%= IdA%>" class="header-item-link">Quản lý tài khoản</a>
                        </li>
                        <% } %>
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
                            <a href="AccountPage.jsp?IdA=<%=IdA%>" class="header-item-link"><%= acc.getAccountName()%></a>
                        </li>
                        <li class="header-item">
                            <a href="Login.jsp" class="header-item-link">Đăng xuất</a>
                        </li>
                    </ul>
                </nav>
                <div class="header-home-search">
                    <div class="home">
                        <a class="logo" href="HomeServlet?accname=<%= acc.getAccountName()%>&idA=<%=IdA%>">
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

                    </div>
                </div>
            </div>
        </header>
        <div class="container-fluid" style="background-color: rgb(196, 245, 184);">
            <div class="row">
                <div class="col-sm-3">
                    <div class="navigation-bar">
                        <a href="HomeServlet?accname=<%= acc.getAccountName()%>&idA=<%=IdA%>" class="navigation-bar-link">Home</a>
                        <i class="fa-solid fa-angles-right navigation-bar-icon"></i>
                        <a href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%=p%>" class="navigation-bar-link">Quản lý tài khoản</a>
                    </div>
                    <nav class="category">
                        <div class="category-heading">
                            <i class="fa-solid fa-bars category-heading-icon"></i>
                            Danh mục sản phẩm
                        </div>
                        <ul class="category-list">
                            <% ArrayList<Type> typelist = md.getProductType();
                                for (int i = 0; i < typelist.size(); i++) {
                            %>
                            <li class="category-item">
                                <a href="ProductTypeServlet?idT=<%=typelist.get(i).getIdType()%>&IdA=<%=IdA%>&page=1" class="catagory-item-link"><%= typelist.get(i).getTypeName()%></a>
                            </li>
                            <%}%>

                        </ul>
                    </nav>
                </div>
                <div class="col-sm-9">
                    <form action="ManagerAccountServlet" method="get">
                        <table style="border: 1px solid; background-color: #fff;margin: 30px 30px 10px 30px;width: 95%;height: 70%;">
                            <tr>
                                <th style="border: 1px solid;">ID</th>
                                <th style="border: 1px solid;">Name</th>
                                <th style="border: 1px solid;">Address</th>
                                <th style="border: 1px solid;">Phone</th>
                                <th style="border: 1px solid;">AccountName</th>
                                <th style="border: 1px solid;">isCustommer</th>
                                <th style="border: 1px solid;">isSaler</th>
                                <th style="border: 1px solid;">isAdmin</th>
                            </tr>
                            <% ArrayList<Account> allacc = md.getAccount();
                                int z = 0;
                                int n = 5;
                                int size = allacc.size();
                                if (size % n == 0) {
                                    z = size / n;
                                } else {
                                    z = (size / n) + 1;
                                }

                                int e = n * p - 1;
                                int b = n * p - n;
                                request.setAttribute("end", e);
                                request.setAttribute("begin", b);
                                request.setAttribute("zpage", z);
                                request.setAttribute("allacc", allacc);%>
                            <c:forEach begin="${requestScope.begin}" end="${requestScope.end}" items="${requestScope.allacc}" var="acc">
                                <tr>
                                    <td style="border: 1px solid;">${acc.getIdA()}</td>
                                    <td style="border: 1px solid;">${acc.getName()}</td>
                                    <td style="border: 1px solid;">${acc.getAddress()}</td>
                                    <td style="border: 1px solid;">${acc.getPhone()}</td>
                                    <td style="border: 1px solid;">${acc.getAccountName()}</td>
                                    <c:choose>
                                        <c:when test="${acc.isIsCustommser()}">
                                            <td style="border: 1px solid;"><input type="checkbox" name="isC" value="${acc.getIdA()}" checked="true"></td>
                                            </c:when>
                                            <c:when test="${!acc.isIsCustommser()}">
                                            <td style="border: 1px solid;"><input type="checkbox" name="isC" value="${acc.getIdA()}"></td>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${acc.isIsSaler()}">
                                            <td style="border: 1px solid;"><input type="checkbox" name="isS" value="${acc.getIdA()}" checked="true"></td>
                                            </c:when>
                                            <c:when test="${!acc.isIsSaler()}">
                                            <td style="border: 1px solid;"><input type="checkbox" name="isS" value="${acc.getIdA()}"></td>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${acc.isIsAdmin()}">
                                            <td style="border: 1px solid;"><input type="checkbox" checked="true" name="isAdmin" value="${acc.getIdA()}"></td>
                                            </c:when>
                                            <c:when test="${!acc.isIsAdmin()}">
                                            <td style="border: 1px solid;"><input type="checkbox" name="isAdmin" value="${acc.getIdA()}" ></td>
                                            </c:when>
                                        </c:choose>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td><input type="hidden" name="IdA" value="<%=IdA%>"></td>
                                <td><input type="hidden" name="begin" value="<%=b%>"></td>
                                <td><input type="hidden" name="end" value="<%=e%>"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><input type="submit" value="Save"></td>
                            </tr>
                        </table>
                    </form>
                    <div class="pagging" style="display: flex;padding-left: 90%;">
                        <c:choose>
                            <c:when test="${requestScope.page == 1}">
                                <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p%>"><%= p%></a></div>  
                                <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p + 1%>">>></a></div>    
                            </c:when>
                            <c:when test="${requestScope.page > 1 && requestScope.page < requestScope.zpage}">
                                <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p - 1%>"><<</a></div>
                                <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p%>"><%= p%></a></div>  
                                <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p + 1%>">>></a></div>    
                            </c:when>
                            <c:when test="${requestScope.page == requestScope.zpage}">
                                <div class="pagging-link" style="padding: 5px 5px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p - 1%>"><<</a></div>
                                <div class="pagging-link" style="padding: 5px 10px;border: 1px solid;background-color: #fff;"><a style="text-decoration: none;color: black;" href="ManagerAccount.jsp?IdA=<%=IdA%>&page=<%= p%>"><%= p%></a></div>    
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
    </body>

</html>
