<%-- 
    Document   : CreateAccount
    Created on : Feb 25, 2022, 1:05:01 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <form name="createAccount" action="CreateAccountServlet" method="post">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="namecreate"/></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="addcreate"/></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" name="phonecreate"/></td>
                </tr>
                <tr>
                    <td>Account Name:</td>
                    <td><input type="text" name="accnamecreate"/></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="text" name="passcreate"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create Account"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
