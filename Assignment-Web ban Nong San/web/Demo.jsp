<%-- 
    Document   : Demo
    Created on : Mar 13, 2022, 7:55:12 PM
    Author     : Admin
--%>

<%@page import="Model.Product"%>
<%@page import="Model.Account"%>
<%@page import="DAO.ManagerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%ManagerDAO md = new ManagerDAO();
                    int IdA = Integer.parseInt(request.getParameter("IdA"));
                    Account acc = md.getAccountById(IdA);
        %>
        <div><%=acc %></div>
        <% int IdP = Integer.parseInt(request.getParameter("IdP"));
                            Product pro = md.getProductByIdP(IdP);
                        %>
                        <div><%=IdP %></div>
                        <div><%= pro %></div>
    </body>
</html>
