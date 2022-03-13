<%-- 
    Document   : Login
    Created on : Mar 11, 2022, 4:00:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styleLogin.css">
</head>

<body>
    <div class="container">
        <div class="image">
        </div>
        <div class="login">
            <div style="padding-left:35%;padding-bottom: 10px; font-size: 30px;">Đăng nhập</div>
            <form action="LoginServlet" method="post">

                <label>Tên tài khoản:</label></br>
                <input class="ip" type="text" name="accname" /></br>
                <label>Mật khẩu:</label></br>
                <input class="ip" type="text" name="pass" /></br>
                <div>${error}</div>
                <input class="submit" type="submit" value="Đăng nhập" /></br>
                <a href="CreateAccount.jsp">Tạo tài khoản mới</a>
            </form>
            
        </div>
    </div>
</body>

</html>
