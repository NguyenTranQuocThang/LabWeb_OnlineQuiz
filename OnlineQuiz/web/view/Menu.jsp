<%-- 
    Document   : menu
    Created on : Feb 28, 2020, 1:11:35 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/menu.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="menu">
            <ul>

                <li><a href="login">Home</a></li>
                <li><a href="takequiz">Take Quiz</a></li>
                <li><a href="makequiz">Make Quiz</a></li>
                <li><a href="managequiz">Manage Quiz</a></li>
                <li>
                    <c:if test="${username != null}">
                        <a href="logout">Log out</a>
                    </c:if>
                        
                </li>
            </ul>
        </div>
    </body>
</html>
