<%-- 
    Document   : Login
    Created on : Feb 28, 2020, 9:48:38 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="block">
            <c:choose>
                <c:when test="${username == null}">
                    <div class="block">
                        <h3>Login Form</h3>
                    </div>
                    <div class="block">
                        <form action="login" method="Post">
                            <table>
                                <tr>
                                    <td>User Name: </td>
                                    <td><input type="text" class="input" name="username" required ></td>
                                </tr>
                                <tr>
                                    <td>Password: </td>
                                    <td><input type="password" class="input" name="password" required ></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Sign in"><a href="register"> Register</a></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div class="notify">
                                            <c:out value="${testAccount}" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="block">
                        <p>Hello<span class="titleBlue"><c:out value=" ${username}" /></span></p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
