<%-- 
    Document   : Register
    Created on : Feb 29, 2020, 2:12:43 PM
    Author     : thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="block">
            <div class="block">
                <h3>Registration Form</h3>
            </div>
            <div class="block">
                <form action="register" method="post">
                    <table>
                        <tr>
                            <td><div class="registerdiv">User Name: </div></td>
                            <td><input class="input" type="text" name="usernameRegister" value="${usernameRegister}" ></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input class="input" type="password" name="passwordRegister" value="${passwordRegister}"  ></td>
                        </tr>
                        <tr>
                            <td>User Type: </td>
                            <td>
                                <select name="typeUserRegister" class="option">
                                    <option value="Teacher" <c:if test="${typeUserRegister == 'Teacher'}">selected</c:if>>Teacher</option>
                                    <option value="Normal User" <c:if test="${typeUserRegister == 'Normal User'}">selected</c:if>>Normal User</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td><input class="input" type="text" name="emailRegister" value="${emailRegister}" ></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Register"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div class="notify">
                                    <c:out value="${textRegister}"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
