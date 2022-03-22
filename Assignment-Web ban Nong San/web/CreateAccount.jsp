<%-- 
    Document   : CreateAccount
    Created on : Feb 25, 2022, 1:05:01 AM
    Author     : Admin
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styleCreateAccount.css">
        <title>Create Account</title>
    </head>
    <body>
        <div class="container">
            <% String IdA = request.getParameter("IdA"); %>
            <div class="image"></div>
            <div class="createaccount">
                <div style="text-align: center;padding-bottom: 10px; font-size: 30px;">Tạo tài khoản</div>
                <form name="createAccount" action="CreateAccountServlet" method="post">
                    <label>Tên:</label>
                    <input type="text" name="namecreate"/></br>
                    <label>Địa chỉ:</label>
                    <input type="text" name="addcreate"/></br>
                    <label>Số điện thoại:</label>
                    <input type="text" name="phonecreate"/></br>
                    <label>Tên tài khoản:</label>
                    <input type="text" name="accnamecreate"/></br>
                    <label>Mật khẩu:</label>
                    <input type="text" name="passcreate"/></br>
                    <div>${error}</div>
                    <div class="submit"><input type="submit" value="Tạo tài khoản"/></div>   
                    <input type="hidden" name="IdA" value="<%=IdA %>">
                </form></div>
        </div>
    </body>
</html>
